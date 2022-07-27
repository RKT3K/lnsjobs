<?php

namespace App\Http\Controllers;
use App\Models\AdminNotification;
use App\Models\Category;
use App\Models\City;
use App\Models\Employer;
use App\Models\Frontend;
use App\Models\Industry;
use App\Models\Job;
use App\Models\JobExperience;
use App\Models\JobShift;
use App\Models\JobType;
use App\Models\Language;
use App\Models\Page;
use App\Models\SupportAttachment;
use App\Models\SupportMessage;
use App\Models\SupportTicket;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\JobApply;
use Auth;

class SiteController extends Controller
{
    public function __construct(){
        $this->activeTemplate = activeTemplate();
    }

    public function index(){
        $count = Page::where('tempname',$this->activeTemplate)->where('slug','home')->count();
        if($count == 0){
            $page = new Page();
            $page->tempname = $this->activeTemplate;
            $page->name = 'HOME';
            $page->slug = 'home';
            $page->save();
        }
        $pageTitle = 'Home';
        $cities = City::where('status', 1)->with('location')->select('id', 'name')->get();
        $sections = Page::where('tempname',$this->activeTemplate)->where('slug','home')->first();
        $categorys = Category::where('status', 1)->with('job')->select('id', 'name')->get();
        return view($this->activeTemplate . 'home', compact('pageTitle','sections', 'cities', 'categorys'));
    }

    public function candidateProfile($slug,$id)
    {
        $pageTitle = "Candidate Profile";
        $candidate = User::where('status', 1)->where('id', $id)->firstOrFail();
        return view($this->activeTemplate . 'candidate_profile', compact('pageTitle', 'candidate'));
    }

    public function pages($slug)
    {
        $page = Page::where('tempname',$this->activeTemplate)->where('slug',$slug)->firstOrFail();
        $pageTitle = $page->name;
        $sections = $page->secs;
        return view($this->activeTemplate . 'pages', compact('pageTitle','sections'));
    }

    public function contact()
    {
        $pageTitle = "Contact Us";
        return view($this->activeTemplate . 'contact',compact('pageTitle'));
    }
    public function contactSubmit(Request $request)
    {
        $attachments = $request->file('attachments');
        $allowedExts = array('jpg', 'png', 'jpeg', 'pdf');
        $this->validate($request, [
            'name' => 'required|max:191',
            'email' => 'required|max:191',
            'subject' => 'required|max:100',
            'message' => 'required',
        ]);
        $random = getNumber();
        $ticket = new SupportTicket();
        $userId=0;
        if(auth()->user()){
         $user=auth()->id();
        }
        if(auth()->guard('employer')->user()){
            $userId=auth()->guard('employer')->user()->id;
        }
        $ticket->user_id = $userId;
        $ticket->name = $request->name;
        $ticket->email = $request->email;
        $ticket->priority = 2;


        $ticket->ticket = $random;
        $ticket->subject = $request->subject;
        $ticket->last_reply = Carbon::now();
        $ticket->status = 0;
        $ticket->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = auth()->user() ? auth()->user()->id : 0;
        $adminNotification->title = 'A new support ticket has opened ';
        $adminNotification->click_url = urlPath('admin.ticket.view',$ticket->id);
        $adminNotification->save();

        $message = new SupportMessage();
        $message->supportticket_id = $ticket->id;
        $message->message = $request->message;
        $message->save();

        $notify[] = ['success', 'ticket created successfully!'];
        return redirect()->route('ticket.view', [$ticket->ticket])->withNotify($notify);
    }

    public function companyProfile($slug, $id)
    {
        $pageTitle = "Company Profile";
        $emptyMessage = "No data found";
        $employer = Employer::where('id', $id)->where('status', 1)->with('jobs', 'jobs.employer', 'jobs.location', 'jobs.city')->firstOrFail();
        return view($this->activeTemplate . 'employer_profile', compact('pageTitle', 'emptyMessage', 'employer'));
    }

    public function companyList()
    {
        $pageTitle = "Company list";
        $emptyMessage = "No data found";
        $industries = Industry::where('status', 1)->latest()->get();
        $employers = Employer::where('status', 1)->inRandomOrder()->with('jobs')->paginate(getPaginate());
        $sections = Page::where('tempname',$this->activeTemplate)->where('slug','companies')->first();
        return view($this->activeTemplate . 'employer', compact('pageTitle', 'emptyMessage', 'employers', 'industries', 'sections'));
    }

    public function companySearch(Request $request)
    {
        $request->validate([
            'industry_id' => 'nullable|exists:industries,id'
        ]);
        $search = $request->search;
        $industryId = $request->industry_id;
        $pageTitle = "Company Search";
        $emptyMessage = "No data found";
        $industries = Industry::where('status', 1)->latest()->get();
        $employers = Employer::where('status', 1)->with('jobs');
        if($request->industry_id){
            $employers = $employers->where('industry_id', $request->industry_id);
        }
        if($request->search){
            $employers  = $employers->where('company_name', 'like', "%$search%");
        }
        $employers = $employers->paginate(getPaginate());
        return view($this->activeTemplate . 'employer', compact('pageTitle', 'emptyMessage', 'employers', 'industries', 'search', 'industryId'));
    }

    public function job()
    {
        $pageTitle = "All Job";
        $emptyMessage = "No data found";
        $cities = City::where('status', 1)->select('id', 'name')->with('location')->get();
        $jobTypes = JobType::where('status', 1)->select('id', 'name')->with('job')->get();
        $categorys = Category::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobShifts = JobShift::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobExperiences = JobExperience::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobs = Job::where('status', 1)->whereDate('deadline','>', Carbon::now()->toDateTimeString())->latest()->with('employer', 'location', 'city')->inRandomOrder()->paginate(getPaginate(6));
        return view($this->activeTemplate . 'job', compact('pageTitle', 'emptyMessage', 'jobs', 'jobTypes', 'jobShifts', 'jobExperiences', 'categorys', 'cities'));
    }

    public function jobFilter(Request $request)
    {
        $request->validate([
            'city' => 'nullable|exists:cities,id',
            'location' => 'nullable|exists:locations,id',
            'category.*' => 'nullable|exists:categories,id',
            'job_type.*' => 'nullable|exists:job_types,id',
            'job_shift.*' => 'nullable|exists:job_shifts,id',
            'job_experience.*' => 'nullable|exists:job_experiences,id',
            'search' => 'nullable|max:255',
        ]);
        $pageTitle = "Job Filter";
        $emptyMessage = "No data found";

        $cities = City::where('status', 1)->select('id', 'name')->with('location')->get();
        $jobTypes = JobType::where('status', 1)->select('id', 'name')->with('job')->get();
        $categorys = Category::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobShifts = JobShift::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobExperiences = JobExperience::where('status', 1)->select('id', 'name')->with('job')->get();

        $cityId = $request->city;
        $locationId = $request->location;
        $categoryId = $request->category;
        $search = $request->search;
        $jobTypeId = $request->job_type;
        $shiftId = $request->job_shift;
        $jobExperienceId = $request->job_experience;

        $jobs = Job::where('status', 1)->whereDate('deadline','>', Carbon::now()->toDateTimeString());
        if($request->city){
            $jobs = $jobs->where('city_id', $request->city);
        }
        if($request->location){
            $jobs = $jobs->where('location_id', $request->location);
        }
        if($request->search){
            $jobs = $jobs->where('title', 'like', "%$search%");
        }
        if($request->category){
            $jobs = $jobs->whereIn('category_id', $request->category);
        }
        if($request->job_type){
            $jobs = $jobs->whereIn('type_id', $request->job_type);
        }
        if($request->job_shift){
            $jobs = $jobs->whereIn('shift_id', $request->job_shift);
        }
        if($request->job_experience){
            $jobs = $jobs->whereIn('job_experience_id', $request->job_experience);
        }
        $jobs = $jobs->with('employer', 'location', 'city')->paginate(getPaginate(6));
        return view($this->activeTemplate . 'job', compact('pageTitle', 'emptyMessage', 'jobs', 'jobTypes', 'jobShifts', 'jobExperiences', 'categorys', 'cities', 'cityId', 'locationId', 'search', 'categoryId', 'jobTypeId', 'shiftId', 'jobExperienceId'));
    }

    public function jobDetails($id)
    {
        $applied = false;
        if(getUser()){$applied = jobApply::where('job_id', $id)->where('user_id', getUser()->id)->first() ? true:false;}
        //$applied = jobApply::where('job_id', $id)->where('user_id', getUser()->id)->first() ? true:false;
        $pageTitle = "Job Detail";
        $emptyMessage = "No data found";
        $job = Job::where('status', 1)->whereDate('deadline','>', Carbon::now()->toDateTimeString())->where('id', $id)->firstOrFail();
        $companyJobs = Job::where('status', 1)->whereDate('deadline','>', Carbon::now()->toDateTimeString())->where('employer_id', $job->employer_id)->latest()->limit(4)->with('employer')->where('id', '!=', $id)->paginate(getPaginate());
        return view($this->activeTemplate . 'job_details', compact('pageTitle','applied', 'emptyMessage', 'job', 'companyJobs'));
    }

    public function jobCategory($id)
    {
        $pageTitle = "Job Category";
        $emptyMessage = "No data found";
        $emptyMessage = "No data found";
        $cities = City::where('status', 1)->select('id', 'name')->with('location')->get();
        $jobTypes = JobType::where('status', 1)->select('id', 'name')->with('job')->get();
        $categorys = Category::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobShifts = JobShift::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobExperiences = JobExperience::where('status', 1)->select('id', 'name')->with('job')->get();
        $jobs = Job::where('status', 1)->whereDate('deadline','>', Carbon::now()->toDateTimeString())->where('category_id', $id)->with('employer', 'location', 'city')->paginate(getPaginate());
        return view($this->activeTemplate . 'job', compact('pageTitle', 'emptyMessage', 'jobs', 'cities', 'jobTypes', 'categorys', 'jobShifts', 'jobExperiences'));
    }

    public function changeLanguage($lang = null)
    {
        $language = Language::where('code', $lang)->first();
        if (!$language) $lang = 'en';
        session()->put('lang', $lang);
        return redirect()->back();
    }

    public function blogDetails($id,$slug){
        $recentBlogs = Frontend::where('data_keys','blog.element')->orderby('id', 'DESC')->limit(9)->get();
        $blog = Frontend::where('id',$id)->where('data_keys','blog.element')->firstOrFail();
        $pageTitle = "Blog Details";
        return view($this->activeTemplate.'blog_details',compact('blog','pageTitle', 'recentBlogs'));
    }


    public function blog(){
        $pageTitle = "Blog";
        $blogs = Frontend::where('data_keys','blog.element')->paginate(9);
        $sections = Page::where('tempname',$this->activeTemplate)->where('slug','blog')->first();
        return view($this->activeTemplate.'blog',compact('blogs','pageTitle', 'sections'));
    }

    public function footerMenu($slug, $id)
    {
        $data = Frontend::where('id', $id)->where('data_keys', 'policy_pages.element')->firstOrFail();
        $pageTitle =  $data->data_values->title;
        return view($this->activeTemplate . 'menu', compact('data', 'pageTitle'));
    }

    public function cookieAccept(){
        session()->put('cookie_accepted',true);
        return response()->json(['success' => 'Cookie accepted successfully']);
    }

    public function placeholderImage($size = null){
        $imgWidth = explode('x',$size)[0];
        $imgHeight = explode('x',$size)[1];
        $text = $imgWidth . '×' . $imgHeight;
        $fontFile = realpath('assets/font') . DIRECTORY_SEPARATOR . 'RobotoMono-Regular.ttf';
        $fontSize = round(($imgWidth - 50) / 8);
        if ($fontSize <= 9) {
            $fontSize = 9;
        }
        if($imgHeight < 100 && $fontSize > 30){
            $fontSize = 30;
        }

        $image     = imagecreatetruecolor($imgWidth, $imgHeight);
        $colorFill = imagecolorallocate($image, 100, 100, 100);
        $bgFill    = imagecolorallocate($image, 175, 175, 175);
        imagefill($image, 0, 0, $bgFill);
        $textBox = imagettfbbox($fontSize, 0, $fontFile, $text);
        $textWidth  = abs($textBox[4] - $textBox[0]);
        $textHeight = abs($textBox[5] - $textBox[1]);
        $textX      = ($imgWidth - $textWidth) / 2;
        $textY      = ($imgHeight + $textHeight) / 2;
        header('Content-Type: image/jpeg');
        imagettftext($image, $fontSize, 0, $textX, $textY, $colorFill, $fontFile, $text);
        imagejpeg($image);
        imagedestroy($image);
    }


    public function candidateCvDownload($id)
    {
        $user = User::findOrFail(decrypt($id));
        $path = imagePath()['profile']['user']['path'];
        $fullPath = $path.'/'. $user->cv;
        $title = slug($user->username);
        $ext = pathinfo($user->cv, PATHINFO_EXTENSION);
        $mimetype = mime_content_type($fullPath);
        header('Content-Disposition: attachment; filename="' . $title . '.' . $ext . '";');
        header("Content-Type: " . $mimetype);
        return readfile($fullPath);
    }

    public function contactWithCompany(Request $request)
    {
        $request->validate([
            'employer_id' => 'required|exists:employers,id',
            'name' => 'required|max:80',
            'email' => 'required|max:80',
            'message' => 'required|max:500'
        ]);
        $employer = Employer::findOrFail($request->employer_id);
        notify($employer, 'CONTACT_WITH_COMPANY',[
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message
        ]);
        $notify[] = ['success', 'Contact mail has been submitted'];
        return back()->withNotify($notify);
    }

    public function contactWithEmployer(Request $request)
    {
        $request->validate([
            'candidate_id' => 'required|exists:users,id',
            'name' => 'required|max:80',
            'email' => 'required|max:80',
            'message' => 'required|max:500'
        ]);
        $employer = User::findOrFail($request->candidate_id);
        notify($employer, 'CONTACT_WITH_CANDIDATE',[
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message
        ]);
        $notify[] = ['success', 'Contact mail has been submitted'];
        return back()->withNotify($notify);
    }

}
