<header class="header">
    <div class="header__bottom"> 
        <div class="container">
            <nav class="navbar navbar-expand-xl p-0 align-items-center">
                <a class="site-logo site-title" href="{{route('home')}}"><img src="{{getImage(imagePath()['logoIcon']['path'] .'/logo.png')}}" alt="@lang('logo')"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="menu-toggle"></span>
                </button>
                <div class="collapse navbar-collapse mt-lg-0 mt-3" id="navbarSupportedContent">
                    <ul class="navbar-nav main-menu m-auto">
                        <li><a href="{{route('home')}}">@lang('Home')</a></li>
                        @foreach($pages as $k => $data)
                            <li><a href="{{route('pages',[$data->slug])}}">{{__($data->name)}}</a></li>
                        @endforeach
                    </ul>
                    <div class="nav-right">
                        <select class="language-select me-3 langSel">
                            @foreach($language as $item)
                                <option value="{{$item->code}}" @if(session('lang') == $item->code) selected  @endif>{{ __($item->name) }}</option>
                            @endforeach
                        </select>

                        @if(auth()->guard('employer')->user())
                            <a href="{{route('employer.home')}}" class="btn btn-md btn--base d-flex align-items-center"><i class="lab la-dashcube fs--18px me-2"></i> @lang('Dashboard')</a>
                        @endif

                        @if(auth()->user())
                             <a href="{{route('user.home')}}" class="btn btn-md btn--base d-flex align-items-center"><i class="lab la-dashcube fs--18px me-2"></i> @lang('Dashboard')</a>
                        @endif

                        @if(!auth()->user() && !auth()->guard('employer')->user())
                            <a href="{{route('login')}}" class="btn btn-md btn--base d-flex align-items-center"><i class="las la-user fs--18px me-2"></i> @lang('Login')</a>
                        @endif
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>

