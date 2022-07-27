@php
    $footer = getContent('footer.content', true);
    $policys = getContent('policy_pages.element', false);
    $socialIcons = getContent('social_icon.element', false);
    $cookie = App\Models\Frontend::where('data_keys','cookie.data')->first();
@endphp


@if(@$cookie->data_values->status && !session('cookie_accepted'))
    <div class="cookie__wrapper ">
        <div class="container">
          <div class="d-flex flex-wrap align-items-center justify-content-between">
            <p class="txt my-2">
               @php echo @$cookie->data_values->description @endphp
              <a href="{{ @$cookie->data_values->link }}" target="_blank">@lang('Read Policy')</a>
            </p>
              <a href="javascript:void(0)" class="btn btn--base my-2 policy">@lang('Accept')</a>
          </div>
        </div>
    </div>
 @endif


<footer class="footer-section">
    <div class="footer-section__top">
        <div class="container">
            <div class="row gy-5">
                <div class="col-lg-4 col-sm-8 order-lg-1 order-1">
                    <a href="{{route('home')}}" class="footer-logo"><img src="{{getImage(imagePath()['logoIcon']['path'] .'/logo.png')}}" alt="@lang('logo')"></a>
                    <p class="mt-4">{{__(@$footer->data_values->title)}}</p>
                </div>
                <div class="col-lg-2 col-sm-4 order-lg-2 order-3">
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">@lang('Short Links')</h3>
                        <ul class="footer-widget__list">
                            @foreach($pages as $k => $data)
                                <li><a href="{{route('pages',[$data->slug])}}">{{__($data->name)}}</a></li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-4 order-lg-3 order-4">
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">@lang('Information')</h3>
                        <ul class="footer-widget__list">
                            <li><a href="{{route('contact')}}">@lang('Support')</a></li>
                            <li><a href="{{route('login')}}">@lang('Login')</a></li>
                            <li><a href="{{route('register')}}">@lang('Join With Us')</a></li>
                            
                        </ul>
                    </div><!-- footer-widget end -->
                </div>
                <div class="col-lg-2 col-sm-4 order-lg-4 order-5">
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">@lang('Support')</h3>
                        <ul class="footer-widget__list">
                            @foreach($policys as $policy)
                                <li><a href="{{route('footer.menu', [slug($policy->data_values->title), $policy->id])}}">{{__($policy->data_values->title)}}</a></li>
                            @endforeach
                        </ul>
                    </div><!-- footer-widget end -->
                </div>
                <div class="col-lg-2 col-sm-4 order-lg-5 order-2">
                    <div class="footer-widget">
                        <div class="overview-item">
                            <div class="overview-item__number text--base">{{__(@$footer->data_values->job_post)}}</div>
                            <p class="caption">@lang('Job posts')</p>
                        </div>
                        <div class="overview-item">
                            <div class="overview-item__number text--base">{{__(@$footer->data_values->candidate)}}</div>
                            <p class="caption">@lang('Total Condidates')</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-section__bottom">
        <div class="container">
            <div class="row gy-4">
                <div class="col-md-6 text-md-start text-center">
                    <p>@lang('Copyright') © {{Carbon\Carbon::now()->format('Y')}} {{__($general->sitename)}} @lang('All Right Reserved')</p>
                </div>
                <div class="col-md-6">
                    <ul class="social-link d-flex flex-wrap align-items-center justify-content-md-end justify-content-center">
                        @foreach($socialIcons as $socialIcon)
                            <li><a href="{{$socialIcon->data_values->url}}" target="_blank">@php echo $socialIcon->data_values->social_icon @endphp</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>


@push('script')
<script>
'use strict';
$('.policy').on('click',function(){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.get('{{route('cookie.accept')}}', function(response){
        $('.cookie__wrapper').addClass('d-none');
         notify('success', response.success);
    
    });
});

</script>
@endpush