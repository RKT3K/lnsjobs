@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="pt-50 pb-50 section--bg">
	<div class="container">
		<div class="row justify-content-center gy-4">
			@include($activeTemplate . 'partials.employer_sidebar')
			<div class="col-xl-9 ps-xl-4">
				<div class="row gy-4">
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="d-widget style--two d-flex flex-wrap align-items-center">
                            <div class="d-widget__content">
                                <h3 class="d-number">{{$jobCount}}</h3>
                                <span class="caption fs--14px">@lang('Total Jobs')</span>
                            </div>
                            <div class="d-widget__icon border-radius--100">
                                <i class="las la-tasks"></i>
                                <a href="{{route('employer.job.index')}}" class="d-widget__btn mt-2">@lang('View all')</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="d-widget style--two d-flex flex-wrap align-items-center">
                            <div class="d-widget__content">
                                <h3 class="d-number">{{$general->cur_sym}}{{getAmount($totalDeposit)}}</h3>
                                <span class="caption fs--14px">@lang('Total Deposit')</span>
                            </div>
                            <div class="d-widget__icon border-radius--100">
                                <i class="las la-wallet"></i>
                                <a href="{{route('employer.deposit.history')}}" class="d-widget__btn mt-2">@lang('View all')</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="d-widget style--two d-flex flex-wrap align-items-center">
                            <div class="d-widget__content">
                                <h3 class="d-number">{{$general->cur_sym}}{{getAmount($employer->balance)}}</h3>
                                <span class="caption fs--14px">@lang('Employer Balance')</span>
                            </div>
                            <div class="d-widget__icon border-radius--100">
                                <i class="lar la-credit-card"></i>
                                <a href="{{route('employer.transaction.history')}}" class="d-widget__btn mt-2">@lang('View all')</a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row justify-content-center gy-4">
	                <div class="col-lg-12">
	                    <div class="custom--card mt-4">
	                        <div class="card-body px-4">
	                            <div class="table-responsive--md">
	                                <table class="table custom--table">
	                                    <thead>
	                                        <tr>
	                                            <th>@lang('Plan Name')</th>
	                                            <th>@lang('Order Number')</th>
	                                            <th>@lang('Amount')</th>
	                                            <th>@lang('Total Job Post')</th>
	                                            <th>@lang('Expired Date')</th>
	                                            <th>@lang('Status')</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        @forelse($planOrders as $planOrder)
	                                            <tr>
	                                                <td data-label="@lang('Plan Name')">
	                                                    {{__($planOrder->plan->name)}}
	                                                </td>
	                                                <td data-label="@lang('Order Number')">{{$planOrder->order_number}}</td>
	                                                <td data-label="@lang('Amount')">{{getAmount($planOrder->amount)}} {{$general->cur_text}}</td>
	                                                <td data-label="@lang('Total Post')">{{$planOrder->plan->job_post}}</td>
	                                                <td data-label="@lang('Expired Date')">{{showDateTime($planOrder->created_at->addMonths($planOrder->plan->duration), 'd M Y')}}</td>
	                                                <td data-label="@lang('Status')">
	                                                	@if($planOrder->status == 1)
				                                            <span class="badge badge--success">@lang('Paid')</span>
				                                        @elseif($planOrder->status == 2)
				                                             <span class="badge badge--danger">@lang('Expired')</span>
				                                        @endif
	                                                </td>
	                                            </tr>
	                                        @empty
	                                            <tr>
	                                                <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
	                                            </tr>
	                                        @endforelse
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
            	</div>


				<div class="row gy-4 justify-content-center mt-4">
					<h5 class="text-center">@lang('You can create '){{$employer->job_post_count}} @lang('job post')</h5>
					@foreach($plans as $plan)
	                    <div class="col-md-6">
	                        <div class="package-card">
	                            <div class="package-card__top">
	                                <div class="icon">
	                                    @php echo $plan->icon @endphp
	                                </div>
	                                <div class="content">
	                                    <h3 class="package-card__name">{{__($plan->name)}}</h3>
	                                    <div class="package-card__price">{{$general->cur_sym}}{{getAmount($plan->amount)}} <sub>/ {{__($plan->duration)}} @lang('month')</sub></div>
	                                </div>
	                            </div>
	                            <div class="package-card__content">
	                                <ul class="package-card__feature-list">
	                                	<li>@lang('You can create') <span class="badge badge--base">{{$plan->job_post}} @lang('job posts')</span></li>
	                                	@foreach($plan->services as $value)
	                                		@php 
	                                			$service = App\Models\Service::find($value) 
	                                		@endphp
	                                    	<li>{{__($service->name)}}</li>
	                                    @endforeach
	                                </ul>
	                            </div>
	                            <div class="package-card__footer">
	                                <a href="javascript:void(0)" data-bs-toggle="modal" data-plan_id="{{$plan->id}}" data-bs-target="#exampleModal" class="btn btn--dark w-100 mt-4 planSubscribe">@lang('Choose Plan')</a>
	                            </div>  
	                        </div>
	                    </div>
                    @endforeach
                </div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade custom--modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="POST" action="{{route('employer.plan.subscribe')}}">
				@csrf
				<input type="hidden" name="plan_id">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">@lang('Subscribe Plan')</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					@lang('Are you sure you want to subscribe this plan?')
					<div class="form-group mt-3">
						<select class="form--control" name="payment" required="">
							<option value="">@lang('Select One')</option>
							<option value="1">{{__($general->sitename)}} @lang('Wallet')</option>
							<option value="2">@lang('Checkout')</option>
						</select>	
					</div>
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


@push('script')
<script>
	'use strict';
	$('.planSubscribe').on('click', function(){
		var modal = $('#exampleModal');
		modal.find('input[name=plan_id]').val($(this).data('plan_id'));
	})
</script>
@endpush

