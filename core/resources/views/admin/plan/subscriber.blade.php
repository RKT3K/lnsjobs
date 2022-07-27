@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10 ">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('Employer')</th>
                                    <th>@lang('Plan')</th>
                                    <th>@lang('Amount')</th>
                                    <th>@lang('Order Number')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Joined At')</th>
                                </tr>
                            </thead>
                            <tbody>
                            @forelse($orders as $order)
                                <tr>
                                    <td data-label="@lang('Employer')">
                                        <span class="font-weight-bold">{{ $order->employer->company_name }}</span>
                                        <br>
                                        <span class="small">
                                        <a href="{{ route('admin.employers.detail', $order->employer_id) }}"><span>@</span>{{$order->employer->username }}</a>
                                        </span>
                                    </td>
                                    <td data-label="@lang('Plan')">
                                       {{$order->plan->name}}
                                    </td>
                                    <td data-label="@lang('Amount')">
                                       {{ getAmount($order->amount) }} {{$general->cur_text}}
                                    </td>
                                    <td data-label="@lang('Order Number')">
                                       {{$order->order_number}}
                                    </td>

                                    <td data-label="@lang('Status')">
                                        @if($order->status == 1)
                                            <span class="badge badge--success">@lang('Paid')</span>
                                        @elseif($order->status == 2)
                                            <span class="badge badge--danger">@lang('Expired')</span>
                                        @endif
                                    </td>
                                    <td data-label="@lang('Joined At')">{{showDateTime($order->created_at) }} <br> {{ diffForHumans($order->created_at) }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%">{{__($emptyMessage) }}</td>
                                </tr>
                            @endforelse

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer py-4">
                    {{ paginateLinks($orders) }}
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
<form action="{{route('admin.plan.subscriber.search')}}" method="GET" class="form-inline float-sm-right bg--white mb-2 ml-0 ml-xl-2 ml-lg-0">
    <div class="input-group has_append  ">
        <input type="text" name="search" class="form-control" placeholder="@lang('Order Number')" value="{{ $search ?? '' }}">
        <div class="input-group-append">
            <button class="btn btn--primary" type="submit"><i class="fa fa-search"></i></button>
        </div>
    </div>
</form>
@endpush


