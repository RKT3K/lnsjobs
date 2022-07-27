<?php

namespace App\Http\Controllers\Employer;

use App\Http\Controllers\Controller;
use App\Models\AdminNotification;
use App\Models\Category;
use App\Models\City;
use App\Models\Job;
use App\Models\JobApply;
use App\Models\JobExperience;
use App\Models\JobShift;
use App\Models\JobSkill;
use App\Models\JobType;
use App\Models\Location;
use App\Models\Order;
use App\Models\SalaryPeriod;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JobController extends Controller
{
    public function __construct()
    {
        $this->activeTemplate = activeTemplate();
    }

    public function index()
    {
        $pageTitle = "All Job";
        $emptyMessage = "No data found";
        $employer = auth()->guard('employer')->user();
        $jobs = Job::where('employer_id', $employer->id)->with('category', 'shift', 'type', 'jobApplication')->latest()->paginate(getPaginate());
        return view($this->activeTemplate . 'employer.job.index', compact('employer', 'pageTitle', 'emptyMessage', 'jobs'));
    }

    public function appliedJob($id)
    {
        $pageTitle = "Applied job list";
        $emptyMessage = "No data found";
        $employer = auth()->guard('employer')->user();
        $appliedJobs = JobApply::whereHas('job',function($q) use ($employer){
            $q->where('employer_id',$employer->id);
        })->where('job_id', $id)->latest()->with('user')->paginate(getPaginate());
        return view($this->activeTemplate . 'employer.job.applied', compact('pageTitle', 'emptyMessage', 'appliedJobs'));
    }

    public function create()
    {
        $employer = Auth::guard('employer')->user();
        $order = Order::where('employer_id', $employer->id)->where('status', 1)->first();
        if(!$order){
            $notify[] = ['error', 'Subscriber our plan then create job post'];
            return redirect()->route('employer.home')->withNotify($notify);
        }
        if($employer->job_post_count <= 0){
            $notify[] = ['error', 'Job posting limit is over'];
            return back()->withNotify($notify);
        }
        $pageTitle = "Job post create";
        $cities = City::where('status', 1)->select('id', 'name')->with('location')->get();
        $types = JobType::where('status', 1)->select('id', 'name')->get();
        $shifts = JobShift::where('status', 1)->select('id', 'name')->get();
        $skills = JobSkill::where('status', 1)->select('id', 'name')->get();
        $categorys = Category::where('status', 1)->select('id', 'name')->get();
        $experiences = JobExperience::where('status', 1)->select('id', 'name')->get();
        $salaryPeriods = SalaryPeriod::where('status', 1)->select('id', 'name')->get();
        return view($this->activeTemplate . 'employer.job.create', compact('pageTitle', 'cities', 'types', 'shifts', 'skills', 'categorys', 'experiences', 'salaryPeriods'));
    }

    public function store(Request $request)
    {
        $employer = Auth::guard('employer')->user();
        $order = Order::where('employer_id', $employer->id)->where('status', 1)->first();
        if(!$order){
            $notify[] = ['error', 'Subscriber our plan then create job post'];
            return back()->withNotify($notify);
        }
        if($employer->job_post_count <= 0){
            $notify[] = ['error', 'Job posting limit is over'];
            return back()->withNotify($notify);
        }
        $request->validate([
            'title' => 'required|max:255',
            'category' => 'required|exists:categories,id',
            'type' => 'required|exists:job_types,id',
            'city' => 'required|exists:cities,id',
            'location' => 'required|exists:locations,id',
            'shift' => 'required|exists:job_shifts,id',
            'vacancy' => 'required|integer|gt:0',
            'job_experience' => 'required|exists:job_experiences,id',
            'gender' => 'required|in:1,2,3',
            'salary_type' => 'required|in:1,2',
            'salary_period' => 'required|exists:salary_periods,id',
            'deadline' => 'required|date',
            'age' => 'required',
            'description' => 'required',
            'responsibilities' => 'required',
            'requirements' => 'required',
        ]);
        if($request->salary_type == 2){
            $request->validate([
                'salary_from' => 'required|numeric|gt:0',
                'salary_to' => 'required|numeric|gt:0',
            ]);
        }
        $employer->job_post_count -= 1;
        $employer->save();

        if($employer->job_post_count <= 0){
            $order = Order::where('employer_id', $employer->id)->where('status', 1)->first();
            if($order){
                $order->status = 2;
                $order->save();

                notify($employer, 'JOB_LIMIT_OVER', [
                    'plan_name' => $order->plan->name,
                    'order_number' => $order->order_number
                ]);
            }
        }


        $category = Category::where('status', 1)->where('id',$request->category)->firstOrFail();
        $type = JobType::where('status', 1)->where('id',$request->type)->firstOrFail();
        $city = City::where('status', 1)->where('id',$request->type)->firstOrFail();
        $shift = JobShift::where('status', 1)->where('id',$request->shift)->firstOrFail();
        $experience = JobExperience::where('status', 1)->where('id',$request->job_experience)->firstOrFail();
        $salaryPeriod = SalaryPeriod::where('status', 1)->where('id',$request->salary_period)->firstOrFail();

        $job = new Job();
        $job->title = $request->title;
        $job->employer_id = $employer->id;
        $job->category_id = $request->category;
        $job->type_id = $request->type;
        $job->city_id = $request->city;
        $job->location_id = $request->location;
        $job->shift_id = $request->shift;
        $job->vacancy = $request->vacancy;
        $job->salary_type = $request->salary_type;
        $job->salary_period = $request->salary_period;
        $job->job_experience_id = $request->job_experience;
        $job->deadline = $request->deadline;
        $job->gender = $request->gender;
        $job->age = $request->age;
        $job->description = $request->description;
        $job->responsibilities = $request->responsibilities;
        $job->requirements = $request->requirements;
        $job->salary_from = $request->salary_from ? $request->salary_from : 0;
        $job->salary_to = $request->salary_to ? $request->salary_to : 0;
        $job->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = $employer->id;
        $adminNotification->title = 'Job create';
        $adminNotification->click_url = urlPath('admin.manage.job.detail', $job->id);
        $adminNotification->save();

        $notify[] =['success', 'Job has been created'];
        return back()->withNotify($notify);
    }

    public function edit($id)
    {
        $employer = Auth::guard('employer')->user();
        $order = Order::where('employer_id', $employer->id)->where('status', 1)->first();
        if(!$order){
            $notify[] = ['error', 'Subscriber our plan then create job post'];
            return redirect()->route('employer.home')->withNotify($notify);
        }
        if($employer->job_post_count <= 0){
            $notify[] = ['error', 'Job posting limit is over'];
            return back()->withNotify($notify);
        }
        $pageTitle = "Job Update";
        $cities = City::where('status', 1)->select('id', 'name')->with('location')->get();
        $types = JobType::where('status', 1)->select('id', 'name')->get();
        $shifts = JobShift::where('status', 1)->select('id', 'name')->get();
        $skills = JobSkill::where('status', 1)->select('id', 'name')->get();
        $categorys = Category::where('status', 1)->select('id', 'name')->get();
        $experiences = JobExperience::where('status', 1)->select('id', 'name')->get();
        $salaryPeriods = SalaryPeriod::where('status', 1)->select('id', 'name')->get();
        $employer = Auth::guard('employer')->user();
        $job = Job::where('id', $id)->where('employer_id', $employer->id)->firstOrFail();
        return view($this->activeTemplate . 'employer.job.edit', compact('pageTitle', 'employer', 'job', 'cities', 'types', 'shifts', 'skills', 'categorys', 'experiences', 'salaryPeriods'));
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $employer = Auth::guard('employer')->user();
        $order = Order::where('employer_id', $employer->id)->where('status', 1)->first();
        if(!$order){
            $notify[] = ['error', 'Subscriber our plan then create job post'];
            return back()->withNotify($notify);
        }
        if($employer->job_post_count <= 0){
            $notify[] = ['error', 'Job posting limit is over'];
            return back()->withNotify($notify);
        }
        $request->validate([
            'title' => 'required|max:255',
            'category' => 'required|exists:categories,id',
            'type' => 'required|exists:job_types,id',
            'city' => 'required|exists:cities,id',
            'location' => 'required|exists:locations,id',
            'shift' => 'required|exists:job_shifts,id',
            'vacancy' => 'required|integer|gt:0',
            'job_experience' => 'required|exists:job_experiences,id',
            'gender' => 'required|in:1,2,3',
            'salary_type' => 'required|in:1,2',
            'salary_period' => 'required|exists:salary_periods,id',
            'deadline' => 'required|date',
            'age' => 'required',
            'description' => 'required',
            'responsibilities' => 'required',
            'requirements' => 'required',
        ]);
        if($request->salary_type == 2){
            $request->validate([
                'salary_from' => 'required|numeric|gt:0',
                'salary_to' => 'required|numeric|gt:0',
            ]);
        }
        $category = Category::where('status', 1)->where('id',$request->category)->firstOrFail();
        $type = JobType::where('status', 1)->where('id',$request->type)->firstOrFail();
        $city = City::where('status', 1)->where('id',$request->type)->firstOrFail();
        $shift = JobShift::where('status', 1)->where('id',$request->shift)->firstOrFail();
        $experience = JobExperience::where('status', 1)->where('id',$request->job_experience)->firstOrFail();
        $salaryPeriod = SalaryPeriod::where('status', 1)->where('id',$request->salary_period)->firstOrFail();

        $job = Job::where('employer_id', $employer->id)->where('id', $id)->first();
        if($job->status != 0){
            $notify[] = ['error', 'Only pending jobs can be updated'];
            return back()->withNotify($notify);
        }
        $job->title = $request->title;
        $job->employer_id = $employer->id;
        $job->category_id = $request->category;
        $job->type_id = $request->type;
        $job->city_id = $request->city;
        $job->location_id = $request->location;
        $job->shift_id = $request->shift;
        $job->vacancy = $request->vacancy;
        $job->salary_type = $request->salary_type;
        $job->salary_period = $request->salary_period;
        $job->job_experience_id = $request->job_experience;
        $job->deadline = $request->deadline;
        $job->gender = $request->gender;
        $job->age = $request->age;
        $job->description = $request->description;
        $job->responsibilities = $request->responsibilities;
        $job->requirements = $request->requirements;
        $job->salary_from = $request->salary_from ? $request->salary_from : 0;
        $job->salary_to = $request->salary_to ? $request->salary_to : 0;
        $job->save();
        $notify[] =['success', 'Job has been updated'];
        return back()->withNotify($notify);
    }

    public function cvDownload($id)
    {
        $employer = Auth::guard('employer')->user();
        $jobApply = JobApply::whereHas('job',function($q) use ($employer){
            $q->where('employer_id',$employer->id);
        })->findOrFail(decrypt($id));
        $path = imagePath()['profile']['user']['path'];
        $fullPath = $path.'/'. $jobApply->user->cv;
        $title = slug($jobApply->user->username);
        $ext = pathinfo($jobApply->user->cv, PATHINFO_EXTENSION);
        $mimetype = mime_content_type($fullPath);
        header('Content-Disposition: attachment; filename="' . $title . '.' . $ext . '";');
        header("Content-Type: " . $mimetype);
        return readfile($fullPath);
    }

    public function approved(Request $request)
    {
        $employer = Auth::guard('employer')->user();
        $jobApply = JobApply::whereHas('job',function($q) use ($employer){
            $q->where('employer_id',$employer->id);
        })->findOrFail($request->id);
        $jobApply->status = 1;
        $jobApply->save();

        $user = User::findOrFail($jobApply->user_id);
        notify($user, 'JOB_APPLICATION_RECIVED', [
            'company_name' => $jobApply->job->employer->company_name,
            'job_title' => $jobApply->job->title
        ]);
        $notify[] = ['success', 'Job application recived'];
        return back()->withNotify($notify);
    }

    public function cancel(Request $request)
    {
        $employer = Auth::guard('employer')->user();
        $jobApply = JobApply::whereHas('job',function($q) use ($employer){
            $q->where('employer_id',$employer->id);
        })->findOrFail($request->id);
        $jobApply->status = 2;
        $jobApply->save();

        $user = User::findOrFail($jobApply->user_id);
        notify($user, 'JOB_APPLICATION_CANCELLED', [
            'company_name' => $jobApply->job->employer->company_name,
            'job_title' => $jobApply->job->title
        ]);
        $notify[] = ['success', 'Job application cancelled'];
        return back()->withNotify($notify);
    }
}
