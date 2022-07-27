@php 
    $latestJobs = App\Models\Job::where('status', 1)->orderBy('id', 'DESC')->with('employer')->limit(16)->get();
    $content = getContent('latest_job.content', true);
@endphp
<section class="pt-80 pb-80 section--bg">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-header text-center">
                    <h2 class="section-title">{{__($content->data_values->heading)}} <i class="lab la-hotjar text--base"></i></h2>
                </div>
            </div>
        </div>
        <div class="row g-3">
            @foreach($latestJobs as $latestJob)
                <div class="col-xl-3 col-lg-4 col-6">
                    <div class="short-job-card">
                        <div class="short-job-card__top">
                            <div class="short-job-card__thumb">
                                <img src="{{getImage(imagePath()['employerLogo']['path'].'/'.@$latestJob->employer->image)}}" alt="@lang('image')">
                            </div>
                            <div class="short-job-card__content">
                                <h6 class="short-job-card__title"><a href="{{route('job.detail', $latestJob->id)}}">{{$latestJob->title}}</a></h6>
                                <div class="short-job-card__bottom d-flex flex-wrap align-items-center justify-content-between mt-1">
                                    <p class="caption"><a href="{{route('profile', [slug($latestJob->employer->company_name), $latestJob->employer_id])}}" class="text--base">{{__($latestJob->employer->company_name)}}</a></p>
                                    <span class="fs--14px text--muted">{{diffforhumans($latestJob->created_at)}}</span>
                                </div>
                            </div>
                            <div class="short-job-card__action">
                                <a href="{{route('user.favorite.item', $latestJob->id)}}" class="bookmark-btn" >
                                    <span class="non-bookmark"><i class="far fa-bookmark"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div> 
    </div> 
</section>