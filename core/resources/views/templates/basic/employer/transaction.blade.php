@extends($activeTemplate.'layouts.frontend')
@section('content')
    <div class="pt-50 pb-50 section--bg">
        <div class="container">
            <div class="row justify-content-center gy-4">
                @include($activeTemplate . 'partials.employer_sidebar')
                <div class="col-xl-9 ps-xl-4">
                    <div class="custom--card mt-4">
                        <div class="card-body px-4">
                            <div class="table-responsive--md">
                                <table class="table custom--table">
                                    <thead>
                                        <tr>
                                            <th>@lang('Date')</th>
                                            <th>@lang('TRX')</th>
                                            <th>@lang('Amount')</th>
                                            <th>@lang('Post Balance')</th>
                                            <th>@lang('Detail')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($transactions as $transaction)
                                            <tr>
                                                <td data-label="@lang('Date')">
                                                    {{showDateTime($transaction->created_at)}}
                                                    <br>
                                                    {{diffforhumans($transaction->created_at)}}

                                                </td>
                                                <td data-label="@lang('TRX')">{{$transaction->trx}}</td>
                                                <td data-label="@lang('Amount')">
                                                    <strong
                                                        @if($transaction->trx_type == '+') class="text--success" @else class="text--danger" @endif> 
                                                        {{($transaction->trx_type == '+') ? '+':'-'}} 
                                                        {{getAmount($transaction->amount)}} {{$general->cur_text}}
                                                    </strong>
                                                </td>
                                                <td data-label="@lang('Post Balance')">{{getAmount($transaction->post_balance)}} {{$general->cur_text}}</td>
                                                <td data-label="@lang('Detail')">{{__($transaction->details)}}</td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                                {{$transactions->links()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection