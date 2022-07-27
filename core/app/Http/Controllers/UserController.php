<?php

namespace App\Http\Controllers;

use App\Lib\GoogleAuthenticator;
use App\Models\Degree;
use App\Models\EducationalQualification;
use App\Models\EmploymentHistory;
use App\Models\FavoriteItem;
use App\Models\GeneralSetting;
use App\Models\JobApply;
use App\Models\JobSkill;
use App\Models\LevelOfEducation;
use App\Models\SupportTicket;
use App\Models\Transaction;
use App\Rules\FileTypeValidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    public function __construct()
    {
        $this->activeTemplate = activeTemplate();
    }
    
    public function home()
    {
        $pageTitle = 'Dashboard';
        $emptyMessage = "No data found";
        $user = Auth::user();
        $jobApplyCount = JobApply::where('user_id', $user->id)->count();
        $favoriteJobCount = FavoriteItem::where('user_id', $user->id)->count();
        $totalTicketCount = SupportTicket::where('user_id', $user->id)->count();
        $jobApplys = JobApply::where('user_id', $user->id)->orderBy('id', 'DESC')->with('job', 'job.employer')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.dashboard', compact('pageTitle', 'jobApplys', 'jobApplyCount', 'favoriteJobCount', 'totalTicketCount', 'emptyMessage'));
    }

    public function profile()
    {
        $pageTitle = "Profile Setting";
        $user = Auth::user();
        $skills = JobSkill::where('status', 1)->select('id', 'name')->get();
        return view($this->activeTemplate. 'user.profile_setting', compact('pageTitle','user', 'skills'));
    }

    public function submitProfile(Request $request)
    {
        $user = Auth::user();
        $request->validate([
            'firstname' => 'required|string|max:40',
            'lastname' => 'required|string|max:40',
            'email' => 'required|email|max:40|unique:users,email,'.$user->id,
            'mobile' => 'required|max:40|unique:users,mobile,'.$user->id,
            'designation' => 'required|max:120',
            'gender' => 'required|in:1,2',
            'married' => 'required|in:1,2,3,4',
            'birth_date' => 'required|date',
            'national_id' => 'required|max:40',
            'address' => 'required|max:80',
            'state' => 'required|max:80',
            'zip' => 'required|max:40',
            'city' => 'required|max:50',
            'skill' => 'nullable|array|exists:job_skills,id',
            'language' => 'required|array',
            'detail' => 'required',
            'facebook' => 'nullable|url',
            'twitter' => 'nullable|url',
            'pinterest' => 'nullable|url',
            'linkedin' => 'nullable|url',
            'image' => ['nullable','image',new FileTypeValidate(['jpg','jpeg','png'])],
            'cv' => ['nullable',new FileTypeValidate(['pdf'])],
        ]);
        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $user->email = $request->email;
        $user->mobile = $request->mobile;
        $user->designation = $request->designation;
        $user->gender = $request->gender;
        $user->married = $request->married;
        $user->birth_date = $request->birth_date;
        $user->national_id = $request->national_id;
        $user->address = [
            'address' => $request->address,
            'state' => $request->state,
            'zip' => $request->zip,
            'country' => @$user->address->country,
            'city' => $request->city,
        ];
        $user->language = $request->language;
        $user->skill = $request->skill;
        $user->details = $request->detail;

        $user->socialMedia =  [
            'facebook' => $request->facebook,
            'twitter' => $request->twitter,
            'pinterest' => $request->pinterest,
            'linkedin' => $request->linkedin
        ];
        if ($request->hasFile('image')) {
            $location = imagePath()['profile']['user']['path'];
            $size = imagePath()['profile']['user']['size'];
            $filename = uploadImage($request->image, $location, $size, $user->image);
            $user->image = $filename;
        }
        
        $user->save();
        $notify[] = ['success', 'Profile updated successfully.'];
        return back()->withNotify($notify);
    }

    public function uploadCv(Request $request)
    {
        $request->validate([
            'cv' => ['required',new FileTypeValidate(['pdf'])],
        ]);
        $user = Auth::user();
        if ($request->hasFile('cv')) {
            $location = imagePath()['profile']['user']['path'];
            $filenameCv = uploadFile($request->cv, $location, null, $user->cv);
            $user->cv = $filenameCv;
        }
        $user->save();
        $notify[] = ['success', 'cv uploaded successfully.'];
        return back()->withNotify($notify);
    }

    public function pdfViewer()
    {
        $pageTitle = "View Resume";
        $user = Auth::user();

        if($user->cv != null){
            $path = imagePath()['profile']['user']['path'];
            $fullPath = $path.'/'. $user->cv;
        }else{
            $fullPath = null;
        }
        return view($this->activeTemplate . 'user.pdf_view', compact('user', 'fullPath', 'pageTitle'));
    }

    public function educationIndex(Request $request)
    {
        $pageTitle = "Educational Qualification";
        $emptyMessage = "No data found";
        $user = Auth::user();
        $levels = LevelOfEducation::where('status', 1)->select('id', 'name')->get();
        $degrees = Degree::where('status', 1)->select('id', 'name')->get();
        $educations = EducationalQualification::where('user_id', $user->id)->get();
        return view($this->activeTemplate . 'user.education', compact('pageTitle', 'emptyMessage', 'educations', 'levels', 'degrees'));
    }

    public function educationStore(Request $request)
    {
        $request->validate([
            'level_id' => 'required|exists:level_of_education,id',
            'institute' => 'required|max:255',
            'passing_year' => 'required|date_format:Y',
            'degree' => 'required|exists:exam_or_degrees,id'
        ]);
        $level = LevelOfEducation::where('id', $request->level_id)->where('status', 1)->firstOrFail();
        $degree = Degree::where('id', $request->degree)->where('status', 1)->firstOrFail();
        $education = new EducationalQualification;
        $education->user_id = auth()->user()->id;
        $education->level_of_education_id = $request->level_id;
        $education->institute = $request->institute;
        $education->passing_year = $request->passing_year;
        $education->degree_id = $request->degree;
        $education->save();
        $notify[] =['success', 'Education Qualification has been created'];
        return back()->withNotify($notify);
}


    public function educationUpdate(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:educational_qualifications,id',
            'level_id' => 'required|exists:level_of_education,id',
            'institute' => 'required|max:255',
            'passing_year' => 'required|date_format:Y',
            'degree' => 'required|exists:exam_or_degrees,id'
        ]);
        $level = LevelOfEducation::where('id', $request->level_id)->where('status', 1)->firstOrFail();
        $degree = Degree::where('id', $request->degree)->where('status', 1)->firstOrFail();
        $education = EducationalQualification::find($request->id);
        $education->user_id = auth()->user()->id;
        $education->level_of_education_id = $request->level_id;
        $education->institute = $request->institute;
        $education->passing_year = $request->passing_year;
        $education->degree_id = $request->degree;
        $education->save();
        $notify[] =['success', 'Education Qualification has been created'];
        return back()->withNotify($notify);
    }


    public function educationDelete(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:educational_qualifications,id'
        ]);
        $user = Auth::user();
        $education = EducationalQualification::where('id', $request->id)->where('user_id', $user->id)->firstOrFail();
        $education->delete();
        $notify[] = ['success', 'Education Qualification has been deleted'];
        return back()->withNotify($notify);
    }

    public function employmentIndex()
    {
        $user = Auth::user();
        $pageTitle = "Employment history";
        $emptyMessage = "No data found";
        $employments = EmploymentHistory::where('user_id', $user->id)->get();
        return view($this->activeTemplate . 'user.employment', compact('pageTitle', 'emptyMessage', 'employments'));
    }

    public function employmentStore(Request $request)
    {
        $request->validate([
            'company_name' => 'required|max:120',
            'designation' => 'required|max:120',
            'department' => 'required|max:120',
            'start_date' => 'required|date',
            'currently_work' => 'nullable|in:1',
            'end_date' => 'nullable|date|after:start_date',
            'responsibilities' => 'required'
        ]);
        if($request->end_date == null){
            $request->validate([
                'currently_work' => 'required|in:1',
            ]);
        }else{
            $request->validate([
                'end_date' => 'required|date|after:start_date',
            ]);
        }
        $employment = new EmploymentHistory;
        $employment->user_id = auth()->user()->id;
        $employment->company_name = $request->company_name;
        $employment->designation = $request->designation;
        $employment->department = $request->department;
        $employment->start_date = $request->start_date;
        $employment->end_date = $request->end_date;
        $employment->currently_work = $request->currently_work ? $request->currently_work : 0;
        $employment->responsibilities = $request->responsibilities;
        $employment->save();
        $notify[] = ['success', 'Employment history has been created'];
        return back()->withNotify($notify);
    }


    public function employmentUpdate(Request $request)
    {
        $request->validate([
            'company_name' => 'required|max:120',
            'designation' => 'required|max:120',
            'department' => 'required|max:120',
            'start_date' => 'required|date',
            'currently_work' => 'nullable|in:1',
            'end_date' => 'nullable|date|after:start_date',
            'responsibilities' => 'required'
        ]);
        if($request->end_date == null){
            $request->validate([
                'currently_work' => 'required|in:1',
            ]);
        }else{
            $request->validate([
                'end_date' => 'required|date|after:start_date',
            ]);
        }
        $employment = EmploymentHistory::findOrFail($request->id);
        $employment->user_id = auth()->user()->id;
        $employment->company_name = $request->company_name;
        $employment->designation = $request->designation;
        $employment->department = $request->department;
        $employment->start_date = $request->start_date;
        $employment->end_date = $request->end_date;
        $employment->responsibilities = $request->responsibilities;
        $employment->save();
        $notify[] = ['success', 'Employment history has been updated'];
        return back()->withNotify($notify);
    }


    public function employmentDelete(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:employment_histories,id'
        ]);
        $user = Auth::user();
        $employment = EmploymentHistory::where('id', $request->id)->where('user_id', $user->id)->firstOrFail();
        $employment->delete();
        $notify[] = ['success', 'Employment history has been deleted'];
        return back()->withNotify($notify);
    }

    public function favoriteItem($id)
    {
        $user = Auth::user();
        $featureItem = new FavoriteItem();
        $featureItem->user_id = $user->id;
        $featureItem->job_id = $id;
        $featureItem->save();
        $notify[] = ['success', 'Favorite job added'];
        return back()->withNotify($notify);
    }

    public function favoriteJob()
    {
        $pageTitle = "favorite Job List";
        $emptyMessage = "No data found";
        $user = Auth::user();
        $favorites = FavoriteItem::where('user_id', $user->id)->with('job')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.favorite_job', compact('pageTitle', 'emptyMessage', 'favorites'));
    }

    public function favoriteJobdelete(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:favorite_items,id'
        ]);
        $user = Auth::user();
        $favorite = FavoriteItem::where('user_id', $user->id)->where('id', $request->id)->delete();
        $notify[] = ['success', 'Item has been removed'];
        return back()->withNotify($notify);
    }

    public function applyJob(Request $request)
    {
        $request->validate([
            'job_id' => 'required|exists:jobs,id'
        ]);
        $user = Auth::user();
        $job = jobApply::where('job_id', $request->job_id)->where('user_id', $user->id)->first();
        if($job){
            $notify[] = ['error', 'Already applied this job'];
            return back()->withNotify($notify);
        }
        $jobApply = new JobApply();
        $jobApply->job_id = $request->job_id;
        $jobApply->user_id = $user->id;
        $jobApply->save();
        $notify[]  = ['success', 'Applied successfully'];
        return back()->withNotify($notify);
    }

    public function jobApplication()
    {
        $pageTitle = "Job application list";
        $emptyMessage = "No data found";
        $user = Auth::user();
        $jobApplys = JobApply::where('user_id', $user->id)->orderBy('id', 'DESC')->with('job', 'job.employer')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.job_apply', compact('pageTitle', 'emptyMessage', 'jobApplys'));
    }

    public function changePassword()
    {
        $pageTitle = 'Change password';
        return view($this->activeTemplate . 'user.password', compact('pageTitle'));
    }

    public function submitPassword(Request $request)
    {
        $password_validation = Password::min(6);
        $general = GeneralSetting::first();
        if ($general->secure_password) {
            $password_validation = $password_validation->mixedCase()->numbers()->symbols()->uncompromised();
        }
        $this->validate($request, [
            'current_password' => 'required',
            'password' => ['required','confirmed',$password_validation]
        ]);
        try {
            $user = auth()->user();
            if (Hash::check($request->current_password, $user->password)) {
                $password = Hash::make($request->password);
                $user->password = $password;
                $user->save();
                $notify[] = ['success', 'Password changes successfully.'];
                return back()->withNotify($notify);
            } else {
                $notify[] = ['error', 'The password doesn\'t match!'];
                return back()->withNotify($notify);
            }
        } catch (\PDOException $e) {
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify);
        }
    }


    public function show2faForm()
    {
        $general = GeneralSetting::first();
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . $general->sitename, $secret);
        $pageTitle = 'Two Factor';
        return view($this->activeTemplate.'user.twofactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    public function create2fa(Request $request)
    {
        $user = auth()->user();
        $this->validate($request, [
            'key' => 'required',
            'code' => 'required',
        ]);
        $response = verifyG2fa($user,$request->code,$request->key);
        if ($response) {
            $user->tsc = $request->key;
            $user->ts = 1;
            $user->save();
            $userAgent = getIpInfo();
            $osBrowser = osBrowser();
            notify($user, '2FA_ENABLE', [
                'operating_system' => @$osBrowser['os_platform'],
                'browser' => @$osBrowser['browser'],
                'ip' => @$userAgent['ip'],
                'time' => @$userAgent['time']
            ]);
            $notify[] = ['success', 'Google authenticator enabled successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'Wrong verification code'];
            return back()->withNotify($notify);
        }
    }


    public function disable2fa(Request $request)
    {
        $this->validate($request, [
            'code' => 'required',
        ]);

        $user = auth()->user();
        $response = verifyG2fa($user,$request->code);
        if ($response) {
            $user->tsc = null;
            $user->ts = 0;
            $user->save();
            $userAgent = getIpInfo();
            $osBrowser = osBrowser();
            notify($user, '2FA_DISABLE', [
                'operating_system' => @$osBrowser['os_platform'],
                'browser' => @$osBrowser['browser'],
                'ip' => @$userAgent['ip'],
                'time' => @$userAgent['time']
            ]);
            $notify[] = ['success', 'Two factor authenticator disable successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }


}
