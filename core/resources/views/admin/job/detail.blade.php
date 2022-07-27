@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30">
        <div class="col-xl-3 col-lg-5 col-md-5 col-sm-12">
            <div class="card b-radius--10 overflow-hidden mt-30 box--shadow1">
                <div class="card-body">
                    <h5 class="mb-20 text-muted">@lang('Emplyer Information')</h5>
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Username')
                            <span class="font-weight-bold">{{__($job->employer->username)}}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Status')
                            @if($job->employer->status == 1)
                                <span class="badge badge-pill bg--success">@lang('Active')</span>
                            @elseif($job->employer->status == 0)
                                <span class="badge badge-pill bg--danger">@lang('Banned')</span>
                            @endif
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Balance')
                            <span class="font-weight-bold">{{getAmount($job->employer->balance)}}  {{__($general->cur_text)}}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-xl-9 col-lg-7 col-md-7 col-sm-12 mt-10">
            <div class="row mb-30 mt-4">
                <div class="col-lg-6">
                    <div class="card border--dark">
                        <h5 class="card-header bg--dark">{{__($job->title)}}</h5>
                        <div class="card-body">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Category')
                                    <span>{{__($job->category->name)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                  @lang('Type')
                                    <span>{{$job->type->name}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Shift')
                                    <span>{{__($job->shift->name)}}</span>
                                </li>

                                 <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Vacancy')
                                    <span>{{__($job->vacancy)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Salary')
                                    <span>
                                        @if($job->salary_type == 1)
                                            <span>@lang('Negotiation')</span>
                                        @elseif($job->salary_type == 2)
                                            {{getAmount($job->salary_from)}} - {{getAmount($job->salary_to)}} {{$general->cur_text}}
                                        @endif
                                    </span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Salary Period')
                                    <span>{{__($job->salaryPeriod->name)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Application Deadline')
                                    <span>{{showDateTime($job->deadline, 'd M Y')}}</span>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card border--dark">
                        <h5 class="card-header bg--dark">@lang('Job Information')</h5>
                        <div class="card-body">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Job Experience')
                                    <span>{{__($job->experience->name)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('City')
                                    <span>{{__($job->city->name)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Location')
                                    <span>{{__($job->location->name)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Gender')
                                    <span>
                                        @if($job->gender == 1)
                                            @lang('Male')
                                        @elseif($job->gender == 2)
                                            @lang('Female')
                                        @elseif($job->gender == 3)
                                            @lang('Both')
                                        @endif
                                    </span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('age')
                                    <span>{{__($job->age)}}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center font-weight-bold">
                                    @lang('Status')
                                    @if($job->status == 0)
                                        <span class="badge badge--primary">@lang('Pending')</span>
                                    @elseif($job->status == 1)
                                        <span class="badge badge--success">@lang('Approved')</span>
                                    @elseif($job->status == 2)
                                        <span class="badge badge--danger">@lang('Cancel')</span>
                                    @elseif($job->status == 3)
                                        <span class="badge badge--warning">@lang('Expired')</span>
                                    @endif
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-30">
                <div class="col-lg-6">
                    <div class="card border--dark">
                        <h5 class="card-header bg--dark">@lang('Requirements')</h5>
                        <div class="card-body">
                            @php echo $job->requirements @endphp
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card border--dark">
                        <h5 class="card-header bg--dark">@lang('Responsibilities')</h5>
                        <div class="card-body">
                            @php echo $job->responsibilities @endphp
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-30">
                <div class="col-lg-12">
                    <div class="card border--dark">
                        <h5 class="card-header bg--dark">@lang('Description')</h5>
                        <div class="card-body">
                            @php echo $job->description @endphp
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.manage.job.index') }}" class="btn btn-sm btn--primary box--shadow1 text--small"><i class="la la-fw la-backward"></i>@lang('Go Back')</a>
@endpush