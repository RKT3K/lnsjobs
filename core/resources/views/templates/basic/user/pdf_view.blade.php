@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="pt-50 pb-50 section--bg">
    <div class="container">
        <div class="row justify-content-center gy-4">
            @include($activeTemplate . 'partials.user_sidebar')
            <div class="col-xl-9 ps-xl-4"> 
                <div class="custom--card mt-4">

                    <form action="{{route('user.upload.cv')}}" method="POST" enctype="multipart/form-data" class="edit-profile-form px-3 py-3">
                        @csrf
                      <div class="row align-items-center justify-content-end">
                            <div class="col-md-4 col-sm-6 offset-6">
                              <input class="form-control" name="cv" type="file" id="formFile">
                            </div>
                            <div class="col-md-4 col-sm-6 offset-6 text-end mt-2">
                                <button type="submit" class="btn btn-sm btn--base w-100"><i class="las la-upload fs--18px"></i> @lang('Update Cv')</button>
                            </div>
                        </div>
                    </form>

                    <div class="card-body">
                        @if($fullPath == null)
                            <h6 class="text-center">@lang('Please upload your cv')</h6>
                        @else
                            <iframe src="{{asset($fullPath)}}" frameborder="0" style="width:100%;min-height:640px;"></iframe>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


