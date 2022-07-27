@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="pt-50 pb-50 section--bg">
    <div class="container">
        <div class="row justify-content-center gy-4">
            @include($activeTemplate . 'partials.user_sidebar')
            <div class="col-xl-9 ps-xl-4">
                <form action="{{route('user.profile.setting')}}" method="POST" enctype="multipart/form-data" class="edit-profile-form">
                    @csrf
                    <div class="profile-thumb-wrapper">
                        <div class="profile-thumb">
                            <div class="avatar-preview">
                                <div class="profilePicPreview" style="background-image:url('{{getImage(imagePath()['profile']['user']['path'].'/'.@$user->image)}}');"></div>
                            </div>
                            <div class="avatar-edit ps-4">
                                <input type='file' name="image" class="profilePicUpload" id="profilePicUpload1" accept=".png, .jpg, .jpeg" />
                                <label for="profilePicUpload1" class="btn btn--base">@lang('Select Profile Image')</label>
                                <p class="fs--14px mb-3"> @lang('Supported files files are .jpg, .png, .jpeg')</p>
                            </div>
                        </div>
                    </div>

                    <div class="custom--card mt-4">
                        <div class="card-header bg--dark">
                            <h5 class="text-white">@lang('Basic Information')</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6 form-group">
                                    <label for="firstname">@lang('First Name') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-briefcase"></i>
                                        <input type="text" name="firstname" id="firstname" value="{{$user->firstname}}" class="form--control" placeholder="@lang('Enter First Name')" maxlength="40" required="">
                                    </div>
                                </div>
                                <div class="col-lg-6 form-group">
                                    <label for="lastname">@lang('Last Name') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-user"></i>
                                        <input type="text" name="lastname" id="lastname" value="{{$user->lastname}}" class="form--control" placeholder="@lang('Enter last name')" maxlength="40" required="">
                                    </div>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="email">@lang('Email') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-envelope"></i>
                                        <input type="email" name="email" id="email" class="form--control" value="{{$user->email}}" placeholder="@lang('Enter Email')" required="" maxlength="40">
                                    </div>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="mobile">@lang('Phone') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-phone"></i>
                                        <input type="text" name="mobile" id="mobile" class="form--control" value="{{$user->mobile}}" placeholder="@lang('Enter phone number')" required="">
                                    </div>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="designation">@lang('Designation') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-phone"></i>
                                        <input type="text" name="designation" id="designation" class="form--control" value="{{@$user->designation}}" placeholder="@lang('Enter your designation')" required="">
                                    </div>
                                </div>


                                <div class="col-lg-6 form-group">
                                    <label for="gender">@lang('Gender') <sup class="text--danger">*</sup></label>
                                    <select class="form--control" id="gender" name="gender" required="">
                                        <option value="">@lang('Select One')</option>
                                        <option value="1" @if($user->gender == 1) selected @endif>@lang('Male')</option>
                                        <option value="2" @if($user->gender == 2) selected @endif>@lang('Female')</option>
                                    </select>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="married">@lang('Martial Status') <sup class="text--danger">*</sup></label>
                                    <select class="form--control" name="married" id="married" required="">
                                        <option value="">@lang('Select One')</option>
                                        <option value="1" @if($user->married == 1) selected @endif>@lang('Devorced')</option>
                                        <option value="2" @if($user->married == 2) selected @endif>@lang('Married')</option>
                                        <option value="3" @if($user->married == 3) selected @endif>@lang('Separated')</option>
                                        <option value="4" @if($user->married == 4) selected @endif>@lang('Single')</option>
                                    </select>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="date_birth">@lang('Date Of Birth') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-calendar-plus"></i>
                                         <input type="date" id="date_birth" name="birth_date" value="{{showDateTime($user->birth_date, 'Y-m-d')}}"  placeholder="@lang('Enter Date Of Birth')" autofocus="off" class="form--control" required="">
                                    </div>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="national_id">@lang('National ID') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-qrcode"></i>
                                        <input type="text" name="national_id" id="national_id" class="form--control" value="{{@$user->national_id}}" placeholder="@lang('Enter National ID')" required="">
                                    </div>
                                </div>


                                <div class="col-lg-6 form-group">
                                    <label for="address">@lang('Address') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-map-marker-alt"></i>
                                        <input type="text" name="address" id="address" class="form--control" value="{{@$user->address->address}}" placeholder="@lang('Enter your address')" required="">
                                    </div>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="state">@lang('State') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-map-signs"></i>
                                        <input type="text" name="state" id="state" value="{{@$user->address->state}}" class="form--control" placeholder="@lang('Enter State')" required="">
                                    </div>
                                </div>
                                <div class="col-lg-6 form-group">
                                    <label for="city">@lang('City') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-map-pin"></i>
                                        <input type="text" name="city" id="city" value="{{@$user->address->city}}" class="form--control" placeholder="@lang('Enter City')" required="">
                                    </div>
                                </div>


                                <div class="col-lg-12 form-group">
                                    <label for="zip">@lang('Zip Code') <sup class="text--danger">*</sup></label>
                                    <div class="custom-icon-field">
                                        <i class="las la-location-arrow"></i>
                                        <input type="text" name="zip" id="zip" value="{{@$user->address->zip}}" class="form--control" placeholder="@lang('Enter Zip')" required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                     <div class="custom--card mt-4">
                        <div class="card-header bg--dark">
                            <h5 class="text-white">@lang('Skill And Language')</h5>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6 form-group">
                                    <label>@lang('Skill') <sup class="text--danger">*</sup></label>
                                    <select class="form--control select2" name="skill[]" multiple="multiple">
                                        @foreach($skills as $skill)
                                            <option value="{{$skill->id}}" @if(@in_array($skill->id, @$user->skill)) selected @endif>{{__($skill->name)}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label for="language">@lang('Language') <sup class="text--danger">*</sup></label>
                                    <select class="form--control select2" name="language[]" multiple="multiple">
                                        @if(!empty($user->language))
                                            @foreach ($user->language as  $value)
                                                <option value="{{$value}}" selected="true">{{ $value }}</option>
                                            @endforeach
                                        @endif
                                        @include('partials.language')
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="desciption">@lang('Career Summary') <sup class="text--danger">*</sup></label>
                                <textarea class="form--control" rows="5" name="detail" placeholder="@lang('Enter Career Summary')">{{$user->details}}</textarea>
                            </div>

                        </div>
                    </div>

                    <div class="custom--card mt-4">
                        <div class="card-header bg--dark">
                            <h5 class="text-white">@lang('Social Links')</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6 form-group">
                                    <label for="facebook">@lang('Facebook')</label>
                                    <div class="custom-icon-field">
                                        <i class="lab la-facebook-f"></i>
                                        <input type="url" name="facebook" class="form--control" value="{{@json_decode($user->socialMedia)->facebook}}" placeholder="@lang('https://facebook.com/demo')">
                                    </div>
                                </div>
                                <div class="col-lg-6 form-group">
                                    <label for="twitter">@lang('Twitter')</label>
                                    <div class="custom-icon-field">
                                        <i class="lab la-twitter"></i>
                                        <input type="url" name="twitter" class="form--control" value="{{@json_decode($user->socialMedia)->twitter}}" placeholder="@lang('https://twitter.com/demo')">
                                    </div>
                                </div>
                                <div class="col-lg-6 form-group">
                                    <label for="pinterest">@lang('Pinterest')</label>
                                    <div class="custom-icon-field">
                                        <i class="lab la-pinterest-p"></i>
                                        <input type="url" name="pinterest" class="form--control" value="{{@json_decode($user->socialMedia)->pinterest}}" placeholder="@lang('https://pinterest.com/demo')">
                                    </div>
                                </div>
                                <div class="col-lg-6 form-group">
                                    <label for="linkedin">@lang('Linkedin')</label>
                                    <div class="custom-icon-field">
                                        <i class="lab la-linkedin-in"></i>
                                        <input type="url" name="linkedin" class="form--control" value="{{@json_decode($user->socialMedia)->linkedin}}" placeholder="@lang('https://linkedin.com/in/demo')">
                                    </div>
                                </div>
                            </div><!-- row end -->
                        </div>
                    </div>

                    <div class="text-end mt-4">
                        <button type="submit" class="btn btn--base"><i class="las la-upload fs--18px"></i> @lang('Update Profile')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('style-lib')
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/select2.min.css')}}">
@endpush

@push('script-lib')
    <script src="{{asset($activeTemplateTrue.'js/nicEdit.js')}}"></script>
    <script src="{{asset($activeTemplateTrue.'js/select2.min.js') }}"></script>
@endpush
@push('script')
<script>
    'use strict';
    $('.select2').select2({
        tags: true,
        maximumSelectionLength : 15
    });

    function proPicURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var preview = $(input).parents('.profile-thumb').find('.profilePicPreview');
                $(preview).css('background-image', 'url(' + e.target.result + ')');
                $(preview).addClass('has-image');
                $(preview).hide();
                $(preview).fadeIn(650);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".profilePicUpload").on('change', function() {
        proPicURL(this);
    });

    $(".remove-image").on('click', function(){
        $(".profilePicPreview").css('background-image', 'none');
        $(".profilePicPreview").removeClass('has-image');
    });

    bkLib.onDomLoaded(function() {
        $( ".nicEdit" ).each(function( index ) {
            $(this).attr("id","nicEditor"+index);
            new nicEditor({fullPanel : true}).panelInstance('nicEditor'+index,{hasPanel : true});
        });
    });

    $( document ).on('mouseover ', '.nicEdit-main,.nicEdit-panelContain',function(){
        $('.nicEdit-main').focus();
    });
</script>
@endpush
