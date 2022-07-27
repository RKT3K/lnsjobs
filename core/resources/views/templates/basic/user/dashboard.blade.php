@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="pt-50 pb-50 section--bg">
    <div class="container">
        <div class="row justify-content-center gy-4">
            @include($activeTemplate . 'partials.user_sidebar')
            <div class="col-xl-9 ps-xl-4">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="d-widget style--two d-flex flex-wrap align-items-center">
                            <div class="d-widget__content">
                                <h3 class="d-number">{{$jobApplyCount}}</h3>
                                <span class="caption fs--14px">@lang('Total Jobs Apply')</span>
                            </div>
                            <div class="d-widget__icon border-radius--100">
                               <i class="las la-file-alt"></i>
                                <a href="{{route('user.job.application.list')}}" class="d-widget__btn mt-2">@lang('View all')</a>
                            </div>
                        </div><!-- d-widget end -->
                    </div>
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="d-widget style--two d-flex flex-wrap align-items-center">
                            <div class="d-widget__content">
                                <h3 class="d-number">{{$favoriteJobCount}}</h3>
                                <span class="caption fs--14px">@lang('Total Favourite Job')</span>
                            </div>
                            <div class="d-widget__icon border-radius--100">
                                <i class="lar la-heart"></i>
                                <a href="{{route('user.favorite.job.list')}}" class="d-widget__btn mt-2">@lang('View all')</a>
                            </div>
                        </div><!-- d-widget end -->
                    </div>
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="d-widget style--two d-flex flex-wrap align-items-center">
                            <div class="d-widget__content">
                                <h3 class="d-number">{{$totalTicketCount}}</h3>
                                <span class="caption fs--14px">@lang('Total Ticket')</span>
                            </div>
                            <div class="d-widget__icon border-radius--100">
                                <i class="las la-ticket-alt"></i>
                                <a href="{{route('ticket')}}" class="d-widget__btn mt-2">@lang('View all')</a>
                            </div>
                        </div><!-- d-widget end -->
                    </div>
                </div>

                <div class="row gy-4">
                    <div class="col-lg-12">
                        <div class="custom--card mt-4">
                            <div class="card-body px-4">
                                <div class="table-responsive--md">
                                    <table class="table custom--table ">
                                        <thead>
                                            <tr>
                                                <th>@lang('Job Title')</th>
                                                <th>@lang('Company Name')</th>
                                                <th>@lang('Deadline')</th>
                                                <th>@lang('Status')</th>
                                                <th>@lang('Action')</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            @forelse($jobApplys as $jobApply)
                                                @if($jobApply->job)
                                                <tr>
                                                    <td data-label="@lang('Job Title')">{{__($jobApply->job->title)}}</td>
                                                    <td data-label="@lang('Company Name')">{{__($jobApply->job->employer->company_name)}}</td>
                                                    <td data-label="@lang('Deadline')">{{showDateTime($jobApply->job->deadline, 'd M Y')}}</td>
                                                    <td data-label="@lang('Status')">
                                                        @if($jobApply->status == 0)
                                                            <span class="badge badge--primary">@lang('Pending')</span>
                                                        @elseif($jobApply->status == 1)
                                                            <span class="badge badge--success">@lang('Received')</span>
                                                        @elseif($jobApply->status == 2)
                                                            <span class="badge badge--warning">@lang('Rejected')</span>
                                                        @endif
                                                    </td>
                                                    <td data-label="@lang('Action')">
                                                        <a href="{{route('job.detail', $jobApply->job_id)}}" class="icon-btn bg--primary"><i class="las la-desktop"></i></a>
                                                    </td>
                                                </tr>
                                                @endif
                                            @empty
                                                <tr>
                                                    <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                    {{$jobApplys->links()}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


