@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="pt-50 pb-50 section--bg">
    <div class="container">
        <div class="row justify-content-center gy-4">
            @include($activeTemplate . 'partials.user_sidebar')
            <div class="col-xl-9 ps-xl-4"> 
                <div class="custom--card mt-4">
                    <div class="card-body">
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
                                        <tr>
                                            <td data-label="@lang('Job Title')">{{__($jobApply->job->title)}}</td>
                                            <td data-label="@lang('Company Name')">{{__($jobApply->job->employer->company_name)}}</td>
                                            <td data-label="@lang('Deadline')">{{showDateTime($jobApply->job->deadline, 'd M Y')}}</td>
                                            <td data-label="@lang('Status')">
                                                @if($jobApply->status == 0)
                                                    <span class="badge badge--primary">@lang('Pending')</span>
                                                @elseif($jobApply->status == 1)
                                                    <span class="badge badge--success">@lang('Recived')</span>
                                                @elseif($jobApply->status == 2)
                                                    <span class="badge badge--warning">@lang('Rejected')</span>
                                                @endif
                                            </td>
                                            <td data-label="@lang('Action')">
                                                <a href="{{route('job.detail', $jobApply->job_id)}}" class="icon-btn bg--primary"><i class="las la-desktop"></i></a>
                                            </td>
                                        </tr>
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
@endsection
