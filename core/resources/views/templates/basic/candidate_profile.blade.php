@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="candidate-header">
    <div class="container">
        <div class="row align-items-center gy-4">
            <div class="col-xxl-10 col-lg-9">
                <div class="candidate">
                    <div class="candidate__thumb">
                        <img src="{{getImage(imagePath()['profile']['user']['path'].'/'.@$candidate->image)}}" alt="@lang('candidate image')">
                    </div>
                    <div class="candidate__content">
                        <h4 class="candidate__name text-white">{{__($candidate->fullname)}}</h4>
                        <span class="text--base">{{__($candidate->designation)}}</span>
                        <ul class="candidate__info-list mt-1">
                            <li><i class="las la-map-marker-alt"></i> {{@$candidate->address->address}}, {{@$candidate->address->country}}</li>
                            <li><i class="las la-clock"></i> @lang('Member since') {{showDateTime($candidate->created_at, 'd M Y')}}</li>
                        </ul>
                        
                        <ul class="social-link-list d-flex align-items-center">
                            <li><a href="{{@json_decode($candidate->socialMedia)->facebook}}" target="_blank" class="text-white fs--18px"><i class="lab la-facebook-f"></i></a></li>
                            <li><a href="{{@json_decode($candidate->socialMedia)->twitter}}" target="_blank" class="text-white fs--18px"><i class="lab la-twitter"></i></a></li>
                            <li><a href="{{@json_decode($candidate->socialMedia)->linkedin}}" target="_blank" class="text-white fs--18px"><i class="lab la-linkedin-in"></i></a></li>
                            <li><a href="{{@json_decode($candidate->socialMedia)->pinterest}}" target="_blank" class="text-white fs--18px"><i class="lab la-pinterest-p"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xxl-2 col-lg-3 text-lg-end">
                <a href="{{route('candidate.cv.download', encrypt($candidate->id))}}" class="btn btn--base"><i class="las la-download fs--18px"></i> @lang('Download CV')</a>
            </div>
        </div>
    </div>
</div>
<section class="pt-50 pb-50 section--bg">
    <div class="container">
        <div class="row gy-4">
            <div class="col-lg-8 pe-lg-4">
                <div class="candidate-details">
                    <h4>@lang('Candidate Details')</h4>
                    <p class="mt-2">{{__($candidate->details)}}</p>

                    <h4 class="mt-5">@lang('Work Experience')</h4>
                    <div class="experience-area mt-3">
                        @foreach($candidate->employment as $employment)
                            <div class="single-experience">
                                <div class="d-flex align-items-baseline">
                                    <h6 class="me-3">{{__($employment->designation)}}</h6>
                                    <span class="badge badge--base">{{showDateTime($employment->start_date, 'd M Y')}} - 
                                        @if($employment->currently_work == 1)
                                            @lang('Continue')
                                        @else
                                            {{showDateTime($employment->end_date, 'd M Y')}}
                                        @endif
                                    </span>
                                </div>
                                <span class="fs--14px fst-italic text--base">{{__($employment->company_name)}}.</span>
                                <p class="mt-2">{{$employment->responsibilities}}</p>
                            </div>
                        @endforeach
                    </div>

                    <h4 class="mt-5">@lang('Education History')</h4>
                    <div class="experience-area mt-3">
                        @foreach($candidate->education as $education)
                            <div class="single-experience">
                                <div class="d-flex align-items-baseline">
                                    <h6 class="me-3">{{$education->levelOfEducation->name}}</h6>
                                    <span class="badge badge--base">{{$education->passing_year}}</span>
                                </div>
                                <span class="fs--14px fst-italic text--base">{{$education->degree->name}}</span>
                                <p class="mt-2">{{$education->institute}}</p>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="candidate-sidebar-area">
                    <div class="candidate-sidebar">
                        <h4 class="candidate-sidebar__title">@lang('Profile Overview')</h4>
                        <div class="candidate-sidebar__body">
                            <ul class="caption-list">
                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-fingerprint fs--18px text--base me-2"></i> @lang('Email')</span>
                                    <span class="value">{{__($candidate->email)}}</span>
                                </li>

                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-fingerprint fs--18px text--base me-2"></i> @lang('Phone')</span>
                                    <span class="value">{{__($candidate->mobile)}}</span>
                                </li>

                                 <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-fingerprint fs--18px text--base me-2"></i> @lang('Date Of Birth')</span>
                                    <span class="value">{{showDateTime($candidate->birth_date, 'd M Y')}}</span>
                                </li>

                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-fingerprint fs--18px text--base me-2"></i> @lang('Age')</span>
                                    <span class="value">{{Carbon\Carbon::parse($candidate->birth_date)->age}} @lang('Years')</span>
                                </li>
                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-wallet fs--18px text--base me-2"></i> @lang('National Id')</span>
                                    <span class="value">{{$candidate->national_id}}</span>
                                </li>
                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-user fs--18px text--base me-2"></i> @lang('Gender')</span>
                                    <span class="value">
                                        @if($candidate->gender == 1)
                                            @lang('Male')
                                        @elseif($candidate->gender == 2)
                                            @lang('Female')
                                        @endif
                                    </span>
                                </li>

                                 <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-user fs--18px text--base me-2"></i> @lang('Married Status')</span>
                                    <span class="value">
                                        @if($candidate->married == 1)
                                            @lang('Devorced ')
                                        @elseif($candidate->married == 2)
                                            @lang('Married ')
                                        @elseif($candidate->married == 3)
                                            @lang('Separated ')
                                        @elseif($candidate->married == 4)
                                            @lang('Single') 
                                        @endif
                                    </span>
                                </li>

                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-language fs--18px text--base me-2"></i> @lang('Skill')</span>
                                    <span class="value">
                                        @foreach($candidate->skill as $value)
                                            @php 
                                                $skill = App\Models\JobSkill::findOrFail($value);
                                            @endphp
                                            {{$skill->name}},
                                        @endforeach
                                    </span>
                                </li>

                                <li>
                                    <span class="caption d-flex align-items-center"><i class="las la-language fs--18px text--base me-2"></i> @lang('Languages')</span>
                                    <span class="value">
                                        @foreach($candidate->language as $value)
                                            {{$value}},
                                        @endforeach
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div><!-- candidate-sidebar end -->
                    <div class="candidate-sidebar mt-4">
                        <h4 class="candidate-sidebar__title">@lang('Contact with '){{$candidate->fullname}}</h4>
                        <div class="candidate-sidebar__body">
                            <form class="candidate-form" action="{{route('contact.with.employer')}}" method="POST">
                                @csrf
                                <input type="hidden" name="candidate_id" value="{{$candidate->id}}">
                                <div class="form-group">
                                    <input type="text" name="name" class="form--control form-control-md" placeholder="@lang('Enter name')" required="">
                                </div>
                                 <div class="form-group">
                                    <input type="email" name="email" class="form--control form-control-md" placeholder="@lang('Enter email')" required="">
                                </div>
                                <div class="form-group">
                                    <textarea name="message" class="form--control" placeholder="@lang('Message')"></textarea>
                                </div>
                                <button type="submit" class="btn btn--base w-100">@lang('Message Now')</button>
                            </form>
                        </div>
                    </div><!-- candidate-sidebar end -->
                </div><!-- candidate-sidebar-area end -->
            </div>
        </div>
    </div>
</section>
@endsection
