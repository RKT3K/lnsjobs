@extends($activeTemplate.'layouts.frontend')
@section('content')
<section class="pt-50 pb-50 section--bg">
    <div class="container">
        <div class="row gy-4">
            <div class="col-xl-9 col-lg-8 pe-lg-4">
                <div class="job-details bg-white">
                    <div class="row">
                        <div class="col-10">
                            <h2 class="job-details__title">{{__($job->title)}}</h2>
                            <p class="mt-1"><strong>{{$job->employer->company_name}}</strong></p>
                            <ul class="job-details__meta d-flex flex-wrap">
                                <li>{{__($job->shift->name)}}</li>
                                <li>{{__($job->type->name)}}</li>
                            </ul>
                            @if($applied)
                            <a href="javascript:void(0)" class="btn btn-md px-4 btn--base mt-4">@lang('Applied')</a>
                            @else
                            <a href="javascript:void(0)" class="btn btn-md px-4 btn--base mt-4" data-bs-toggle="modal" data-bs-target="#applyJobModal">@lang('Apply Now')</a>
                            @endif
                            
                        </div>
                        <div class="col-2 text-end">
                            <a href="{{route('user.favorite.item', $job->id)}}" class="bookmark-btn mt-2">
                                <span class="non-bookmark"><i class="far fa-bookmark"></i></span>
                            </a>
                        </div>
                    </div>
                    <hr>
                    <h3 class="mt-4 mb-2">@lang('Description')</h3>
                    @php echo $job->description @endphp
                    <hr>
                    <h3 class="mt-4 mb-2">@lang('Responsibilities')</h3>
                    @php echo $job->responsibilities @endphp
                    <hr>
                    <h3 class="mt-4 mb-2">@lang('Requirements')</h3>
                    @php echo $job->requirements @endphp
                    <hr>
                    
                    @if($applied)
                    <a href="javascript:void(0)" class="btn btn-md px-4 btn--base mt-4">@lang('Applied')</a>
                    @else
                    <a href="javascript:void(0)" class="btn btn--base mt-4" data-bs-toggle="modal" data-bs-target="#applyJobModal">@lang('Apply Now')</a>
                    @endif
                    
                    @if(!getUser())<p class="mt-2"><a href="{{route('login')}}" class="text--base"><strong class="fw-500">@lang('Have an account? Sign in')</strong></a></p>@endif
                </div>
            </div>
            <div class="col-xl-3 col-lg-4">
                <div class="job-details-sidebar">
                    <div class="job-summary">
                        <h4 class="job-summary__title">@lang('Job Summary')</h4>
                        <ul class="job-summary__list">
                            <li><strong>@lang('Published on'):</strong> {{showDateTime($job->created_at, 'd M Y')}}</li>
                            <li><strong>@lang('Vacancy'):</strong>  {{__($job->vacancy)}}</li>
                            <li><strong>@lang('Employment Status'):</strong> {{__($job->type->name)}}</li>
                            <li><strong>@lang('Experience'):</strong> {{__($job->experience->name)}}</li>
                            <li><strong>@lang('Gender'):</strong>
                                @if($job->gender == 1)
                                    @lang('Male')
                                @elseif($job->gender == 2)
                                    @lang('Female')
                                @elseif($job->gender == 3)
                                    @lang('Both')
                                @endif
                            </li>
                            <li><strong>@lang('Age'):</strong> {{__($job->age)}}</li>
                            <li><strong>@lang('Job Location'):</strong> {{__($job->city->name)}} ({{__($job->location->name)}})</li>
                            <li><strong>@lang('Salary'):</strong> 
                                @if($job->salary_type == 1) 
                                    @lang('Negotiation')
                                @elseif($job->salary_type == 2)
                                    {{getAmount($job->salary_from)}} - {{getAmount($job->salary_to)}} {{$general->cur_text}}
                                @endif
                            </li>
                            <li><strong>@lang('Salary Period'):</strong> {{__($job->salaryPeriod->name)}}</li>
                            <li><strong>@lang('Application Deadline'):</strong> {{showDateTime($job->deadline, 'd M Y')}}</li>
                        </ul>
                    </div>
                   
                    <div class="mt-4">
                        <h6>{{$job->employer->company_name}} @lang('job post')</h6>
                        @foreach($companyJobs as $companyJob)
                            <div class="short-job-card mt-2">
                                <div class="short-job-card__top">
                                    <div class="short-job-card__thumb">
                                        <img src="{{getImage(imagePath()['employerLogo']['path'].'/'.@$companyJob->employer->image)}}" alt="@lang('image')">
                                    </div>
                                    <div class="short-job-card__content">
                                        <h6 class="short-job-card__title"><a href="{{route('job.detail', $companyJob->id)}}">{{__($companyJob->title)}}</a></h6>
                                        <p class="caption"><a href="{{route('profile', [slug($companyJob->employer->company_name), $companyJob->employer_id])}}" class="text--base">{{__($companyJob->employer->company_name)}}</a></p>
                                        <span class="fs--14px text--muted">{{diffForHumans($companyJob->created_at)}}</span>
                                    </div>
                                    <div class="short-job-card__action">
                                        <a href="{{route('user.favorite.item', $companyJob->id)}}" class="bookmark-btn" >
                                            <span class="non-bookmark"><i class="far fa-bookmark"></i></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade custom--modal" id="applyJobModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="{{route('user.job.apply')}}">
                @csrf
                <input type="hidden" name="job_id" value="{{$job->id}}">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">@lang('Apply Job')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    @lang('Are you sure you want to apply this job?')
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--secondary btn-sm" data-bs-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn btn--primary btn-sm">@lang('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

