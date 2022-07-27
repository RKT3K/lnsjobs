@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="pt-50 pb-50 section--bg">
	<div class="container">
		<div class="row justify-content-center gy-4">
			@include($activeTemplate . 'partials.employer_sidebar')
			<div class="col-xl-9 ps-xl-4">
				<form action="{{route('employer.job.update', $job->id)}}" method="POST" enctype="multipart/form-data" class="edit-profile-form">
					@csrf
				
					<div class="custom--card mt-4">
						<div class="card-header bg--dark">
							<h5 class="text-white">@lang('Basic Information')</h5>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12 form-group">
									<label for="title">@lang('Title') <sup>*</sup></label>
									<input type="text" name="title" id="title" value="{{$job->title}}" class="form--control" maxlength="255" required="">
								</div>


								<div class="col-lg-6 form-group">
									<label for="category">@lang('Category') <sup>*</sup></label>
									<select class="form--control" name="category" id="category" required="">
										<option value="">@lang('Select Category')</option>
										@foreach($categorys as $category)
											<option value="{{$category->id}}" @if($job->category_id == $category->id) selected @endif>{{__($category->name)}}</option>
										@endforeach
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="type">@lang('Type') <sup>*</sup></label>
									<select class="form--control" name="type" id="type" required="">
										<option value="">@lang('Select Job Type')</option>
										@foreach($types as $type)
											<option value="{{$type->id}}" @if($job->type_id == $type->id) selected @endif>{{__($type->name)}}</option>
										@endforeach
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="city">@lang('City') <sup>*</sup></label>
									<select class="form--control" name="city" id="city" required="">
										<option value="" selected="">@lang('Select City')</option>
										@foreach($cities as $city)
											<option value="{{$city->id}}" data-locations="{{json_encode($city->location)}}" @if($job->city_id == $city->id) selected @endif>{{__($city->name)}}</option>
										@endforeach
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="location">@lang('Location') <sup>*</sup></label>
									<select class="form--control" name="location" id="location" required="">
										
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="shift">@lang('Shift') <sup>*</sup></label>
									<select class="form--control" name="shift" id="shift" required="">
										<option value="" selected="">@lang('Select Job Shift')</option>
										@foreach($shifts as $shift)
											<option value="{{$shift->id}}" @if($job->shift_id == $shift->id) selected @endif>{{__($shift->name)}}</option>
										@endforeach
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="vacancy">@lang('Vacancy') <sup>*</sup></label>
									<input type="text" name="vacancy" id="vacancy" value="{{$job->vacancy}}" class="form--control" placeholder="@lang('Enter Job vacancy')" required="">
								</div>
							</div>
						</div>
					</div>


					<div class="custom--card mt-4">
						<div class="card-header bg--dark">
							<h5 class="text-white">@lang('Job Information')</h5>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-6 form-group">
									<label for="job_experience">@lang('Experience') <sup>*</sup></label>
									<select class="form--control" name="job_experience" id="job_experience">
										<option value="">@lang('Select One')</option>
										@foreach($experiences as $experience)
											<option value="{{$experience->id}}"  @if($job->job_experience_id == $experience->id) selected @endif>{{__($experience->name)}}</option>
										@endforeach
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="gender">@lang('Select Gender') <sup>*</sup></label>
									<select class="form--control" name="gender" id="gender">
										<option value="">@lang('Select One')</option>
										<option value="1" @if($job->gender == 1) selected @endif>@lang('Male')</option>
										<option value="2" @if($job->gender == 2) selected @endif>@lang('Female')</option>
										<option value="3" @if($job->gender == 3) selected @endif>@lang('Both')</option>
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="salary_type">@lang('Salary Type') <sup>*</sup></label>
									<select class="form--control" name="salary_type" id="salary_type">
										<option value="">@lang('Select One')</option>
										<option value="1" @if($job->salary_type == 1) selected @endif>@lang('Negotiation')</option>
										<option value="2" @if($job->salary_type == 2) selected @endif>@lang('Range')</option>
									</select>
								</div>

								<div class="col-lg-6 form-group">
									<label for="salary_period">@lang('Salary Period') <sup>*</sup></label>
									<select class="form--control" name="salary_period" id="salary_period">
										<option value="">@lang('Select One')</option>
										@foreach($salaryPeriods as $salaryPeriod)
											<option value="{{$salaryPeriod->id}}" @if($job->salary_period == $salaryPeriod->id) selected @endif>{{__($salaryPeriod->name)}}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="row addSalaryField"></div>

							<div class="row">
								<div class="col-lg-6 form-group">
									<label for="deadline">@lang('Application Deadline') <sup>*</sup></label>
									<input type="date" name="deadline" value="{{showDateTime($job->deadline, 'Y-m-d')}}" id="deadline" class="form--control" autofocus="off">
								</div>

								<div class="col-lg-6 form-group">
									<label for="age">@lang('Age') <sup>*</sup></label>
									<input type="text" name="age" id="age" value="{{$job->age}}" placeholder="@lang('Enter age')" class="form--control" required="">
								</div>
							</div>
						</div>
					</div>
						

					<div class="custom--card mt-4">
						<div class="card-header bg--dark">
							<h5 class="text-white">@lang('Job Details')</h5>
						</div>
						<div class="card-body">
							<div class="row">

								<div class="col-lg-12 form-group">
									<label>@lang('Description') <sup>*</sup></label>
									<textarea class="form--control nicEdit" name="description" rows="8">@php echo $job->description @endphp</textarea>
								</div>

								<div class="col-lg-12 form-group">
									<label>@lang('Responsibilities') <sup>*</sup></label>
									<textarea class="form--control nicEdit" name="responsibilities" rows="8">@php echo $job->responsibilities @endphp</textarea>
								</div>

								<div class="col-lg-12 form-group">
									<label>@lang('Requirements') <sup>*</sup></label>
									<textarea class="form--control nicEdit" name="requirements" rows="8">@php echo $job->requirements @endphp</textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="text-end mt-4">
						<button type="submit" class="btn btn--base btn-block w-100"> @lang('Job Update')</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
@endsection

@push('script-lib')
 	<script src="{{asset($activeTemplateTrue.'js/nicEdit.js')}}"></script>
@endpush

@push('script')
<script>
	"use strict";
	bkLib.onDomLoaded(function() {
        $( ".nicEdit" ).each(function( index ) {
            $(this).attr("id","nicEditor"+index);
            new nicEditor({fullPanel : true}).panelInstance('nicEditor'+index,{hasPanel : true});
        });
    });

    $('select[name=city]').on('change',function() {
        $('select[name=location]').html('<option value="" selected="" disabled="">@lang('Select One')</option>');
        var locations = $('select[name=city] :selected').data('locations');
        var html = '';
        locations.forEach(function myFunction(item, index) {
            if (item.id == {{ $job->location_id }}) {
                html += `<option value="${item.id}" selected>${item.name}</option>`
            }else{
                html += `<option value="${item.id}">${item.name}</option>`
            }
        });
        $('select[name=location]').append(html);
    }).change();

 
    $('#salary_type').on('change', function(){
    	var value = $('#salary_type').val();
    	if(value == 2){
    		var html = `<div class="col-lg-6">
							<div class="form-group">
								<label for="salary_from">@lang('Salary From') <sup class="text--danger">*</sup></label>
								 <div class="input-group">
		                            <input id="salary_from" type="text" class="form--control" name="salary_from"  value="{{getAmount($job->salary_from)}}" placeholder="@lang('Enter Amount')" required>
		                            <span class="input-group-text">{{__($general->cur_text)}}</span>
		                        </div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label for="salary_to">@lang('Salary To') <sup class="text--danger">*</sup></label>
								<div class="input-group">
		                            <input id="salary_to" type="text" class="form--control" name="salary_to"  value="{{getAmount($job->salary_to)}}" placeholder="@lang('Enter Amount')" required>
		                            <span class="input-group-text">{{__($general->cur_text)}}</span>
		                        </div>
							</div>
						</div>`;
    		$(".addSalaryField").append(html);
    	}else{
    		$(".addSalaryField").empty();
    	}
    }).change();
</script>
@endpush
