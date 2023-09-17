@extends('website.layouts.app')

@section('title')
    {{ __('post_job') }}
@endsection

@section('main')
    <div class="dashboard-wrapper">
        <div class="container">
            <div class="row">
                {{-- Sidebar --}}
                <x-website.company.sidebar />
                <div class="col-lg-9">
                    <div class="dashboard-right">
                        <div class="dashboard-right-header rt-mb-32">
                            <span class="sidebar-open-nav">
                                <i class="ph-list"></i>
                            </span>
                        </div>
                        <form action="{{ route('company.payperjob.store') }}" method="POST" class="rt-from">
                            @csrf
                            <div class="post-job-item rt-mb-15">
                                <div class="row">
                                    <div class="col-lg-8 rt-mb-20">
                                        <x-forms.label name="job_title" :required="true" class="tw-text-sm tw-mb-2" />
                                        <input value="{{ old('title') }}" name="title"
                                            class="form-control @error('title') is-invalid @enderror" type="text"
                                            placeholder="{{ __('job_title') }}" id="m">
                                        @error('title')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-4 rt-mb-20 col-md-4">
                                        <x-forms.label name="job_category" :required="true" />
                                        <select
                                            class="w-100-p select2-taggable select2-search form-control @error('category_id') is-invalid @enderror"
                                            name="category_id">
                                            @foreach ($jobCategories as $category)
                                                <option {{ old('category_id') == $category->id ? 'selected' : '' }}
                                                    value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('category_id')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-8 rt-mb-20 col-md-8">
                                        <x-forms.label name="tags" class="tw-text-sm tw-mb-2" :required="false"/>
                                        <select class="w-100-p rt-selectactive select2-taggable form-control @error('tags') is-invalid @enderror" name="tags[]" multiple>
                                                @foreach ($tags as $tag)
                                                    <option {{ old('tags') ? in_array($tag->id, old('tags')) ? 'selected':'':'' }} value="{{ $tag->id }}">{{ $tag->name }}</option>
                                                @endforeach
                                        </select>
                                        @error('tags')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-4 rt-mb-20 col-md-4">
                                        <x-forms.label name="job_role" :required="true" class="tw-text-sm tw-mb-2" />
                                        <select
                                            class="w-100-p select2-taggable select2-search form-control @error('role_id') is-invalid @enderror"
                                            name="role_id">
                                            @foreach ($roles as $role)
                                                <option {{ old('role_id') == $role->id ? 'selected' : '' }}
                                                    value="{{ $role->id }}">{{ $role->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('role_id')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="post-job-item rt-mb-15">
                                <h4 class="f-size-18 ft-wt-5 rt-mb-20 lh-1">{{ __('salary') }}</h4>
                                <div class="tw-flex tw-gap-5 mb-3">
                                    <div class="tw-flex tw-items-center tw-pl-4 tw-border tw-border-gray-200 tw-rounded dark:tw-border-gray-700">
                                        <input checked onclick="salaryModeChange('range')" id="salary_rangee" type="radio" value="range" name="salary_mode" class="tw-w-4 tw-h-4 tw-text-blue-600 tw-bg-gray-100 tw-border-gray-300 focus:tw-ring-blue-500 dark:focus:tw-ring-blue-600 dark:tw-ring-offset-gray-800 focus:tw-ring-2 dark:tw-bg-gray-700 dark:tw-border-gray-600">
                                        <label for="salary_rangee" class="tw-w-full tw-py-4 tw-ml-2 tw-text-sm tw-font-medium tw-text-gray-900 dark:tw-text-gray-300">{{ __('salary_range') }}</label>
                                    </div>
                                    <div class="tw-flex tw-items-center tw-pl-4 tw-border tw-border-gray-200 tw-rounded dark:tw-border-gray-700">
                                        <input onclick="salaryModeChange('custom')" id="custom_salary" type="radio" value="custom" name="salary_mode" class="tw-w-4 tw-h-4 tw-text-blue-600 tw-bg-gray-100 tw-border-gray-300 focus:tw-ring-blue-500 dark:focus:tw-ring-blue-600 dark:tw-ring-offset-gray-800 focus:tw-ring-2 dark:tw-bg-gray-700 dark:tw-border-gray-600">
                                        <label for="custom_salary" class="tw-w-full tw-py-4 tw-ml-2 tw-text-sm tw-font-medium tw-text-gray-900 dark:tw-text-gray-300">{{ __('custom_salary') }}</label>
                                    </div>
                                </div>
                                <div class="row">
                                     <div class="rt-mb-20 col-md-8 d-none" id="custom_salary_part">
                                        <x-forms.label name="custom_salary" :required="true" class="tw-text-sm tw-mb-2"/>
                                        <div class="position-relative">
                                            <input value="{{ old('custom_salary','Competitive') }}" name="custom_salary" class="form-control @error('custom_salary') is-invalid @enderror" type="text" id="m">
                                            @error('custom_salary')
                                                <span class="error invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="rt-mb-20 col-md-4 salary_range_part">
                                        <x-forms.label name="min_salary" :required="false" class="tw-text-sm tw-mb-2"/>
                                        <div class="position-relative">
                                            <input step="0.01" value="{{ old('min_salary', '50.00') }}"
                                                class="form-control @error('min_salary') is-invalid @enderror"
                                                name="min_salary" type="number" placeholder="{{ __('min_salary') }}"
                                                id="m">
                                            <div class="usd">{{ $currency_symbol }}</div>
                                            @error('min_salary')
                                                <span class="error invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="rt-mb-20 col-md-4 salary_range_part">
                                        <x-forms.label name="max_salary" :required="false" class="tw-text-sm tw-mb-2"/>
                                        <div class="position-relative">
                                            <input step="0.01" value="{{ old('max_salary', '100.00') }}"
                                                class="form-control @error('max_salary') is-invalid @enderror"
                                                name="max_salary" type="number" placeholder="{{ __('max_salary') }}"
                                                id="m">
                                            <div class="usd">{{ $currency_symbol }}</div>
                                            @error('max_salary')
                                                <span class="error invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-lg-4 rt-mb-20 col-md-6">
                                        <x-forms.label name="{{ __('salary_type') }}" :required="true" class="tw-text-sm tw-mb-2"/>
                                        <select
                                            class="rt-selectactive form-control @error('salary_type') is-invalid @enderror w-100-p"
                                            name="salary_type">
                                            @foreach ($salary_types as $type)
                                                <option {{ old('salary_type') == $type->id ? 'selected' : '' }}
                                                    value="{{ $type->id }}">
                                                    {{ $type->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('salary_type')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="post-job-item rt-mb-15">
                                <h4 class="f-size-18 ft-wt-5 rt-mb-20 lh-1">{{ __('advance_information') }}</h4>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 rt-mb-20">
                                        <x-forms.label name="education" :required="true" class="tw-text-sm tw-mb-2" />
                                        <select
                                            class="select2-taggable form-control @error('education') is-invalid @enderror w-100-p"
                                            name="education">
                                            @foreach ($educations as $education)
                                                <option {{ old('education') == $education->id ? 'selected' : '' }}
                                                    value="{{ $education->id }}">
                                                    {{ $education->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('education')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-4 col-md-6 rt-mb-20">
                                        <x-forms.label name="experience" :required="true" class="tw-text-sm tw-mb-2" />
                                        <select
                                            class="select2-taggable form-control @error('experience') is-invalid @enderror w-100-p"
                                            name="experience">
                                            @foreach ($experiences as $experience)
                                                <option {{ old('experience') == $experience->id ? 'selected' : '' }}
                                                    value="{{ $experience->id }}">
                                                    {{ $experience->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('experience')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-4 col-md-6 rt-mb-20">
                                        <x-forms.label name="job_type" :required="true" class="tw-text-sm tw-mb-2" />
                                        <select
                                            class="rt-selectactive form-control @error('job_type') is-invalid @enderror w-100-p"
                                            name="job_type">
                                            @foreach ($job_types as $job_type)
                                                <option {{ old('job_type') == $job_type->id ? 'selected' : '' }}
                                                    value="{{ $job_type->id }}">
                                                    {{ $job_type->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('job_type')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-6 col-md-6 rt-mb-20">
                                        <x-forms.label name="vacancies" :required="true" class="tw-text-sm tw-mb-2" />
                                        <input value="{{ old('vacancies', 1) }}" name="vacancies" type="text"
                                            placeholder="{{ __('vacancies') }}"
                                            class="form-control @error('vacancies') is-invalid @enderror" id="vacancies">
                                        @error('vacancies')
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-lg-6 col-md-6 rt-mb-20">
                                        <x-forms.label name="deadline_expired" :required="true" class="tw-text-sm tw-mb-2" />
                                        <div class="fromGroup">
                                            <div class="form-control-icon date datepicker">
                                                <input value="{{ old('deadline') }}" name="deadline"
                                                    class="form-control @error('deadline') is-invalid @enderror"
                                                    type="text" value="{{ old('deadline') ? old('deadline') : '' }}"
                                                    id="date" placeholder="d/m/y">
                                                <span class="input-group-addon has-badge">
                                                    <span @error('deadline') rt-mr-12 @enderror>
                                                        <x-svg.calendar-icon />
                                                    </span>
                                                </span>
                                                @error('deadline')
                                                    <span class="error invalid-feedback d-block">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="tw-text-sm tw-font-medium tw-text-red-500">
                                            {{ __('maximum_deadline_limit') }}: {{ $setting->job_deadline_expiration_limit }} {{ __('days') }}
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-12 rt-mb-15">
                                    @php
                                        $map = setting('default_map');
                                    @endphp
                                    <div class="location-wrapper">
                                        <div class="row">
                                            <div class="col-12">
                                                <h2>
                                                    {{ __('location') }} <span class="text-danger">*</span>
                                                    <small class="h6">
                                                        ({{ __('click_to_add_a_pointer') }})
                                                    </small>
                                                </h2>
                                            </div>
                                            <div class="col-md-12 col-sm-12 rt-mb-24">
                                                <x-website.map.map-warning />

                                                <div class="map mymap {{ $map == 'map-box' ? '' : 'd-none' }}" id='map-box'>
                                                </div>
                                                <div id="google-map-div" class="{{ $map == 'google-map' ? '' : 'd-none' }}">
                                                    <input id="searchInput" class="mapClass" type="text"
                                                        placeholder="{{ __('enter_location') }}">
                                                    <div class="map mymap" id="google-map"></div>
                                                </div>
                                                <div id="google-map-div" class="{{ $map == 'google-map' ? '' : 'd-none' }}">
                                                    <input id="searchInput" class="mapClass" type="text"
                                                        placeholder="{{ __('enter_location') }}">
                                                    <div class="map mymap" id="google-map"></div>
                                                </div>
                                                <div class="{{ $map == 'leaflet' ? '' : 'd-none' }}">
                                                    <input type="text" autocomplete="off" id="leaflet_search" placeholder="{{ __('enter_city_name') }}" class="full-width"/> <br>
                                                    <div id="leaflet-map"></div>
                                                </div>
                                                @error('location')
                                                    <span class="ml-3 text-md text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                            <div class="col-12 mt-4 custom-checkbox-wrap">
                                                <label class="main tw-text-sm" for="remoteWork">{{ __('fully_remote_position') }}-<span class="tw-font-medium">{{ __('worldwide') }}</span>
                                                    <input type="checkbox" name="is_remote" id="remoteWork" value="1" {{ old('is_remote') ? 'checked' : '' }}>
                                                    <span class="custom-checkbox"></span>
                                                </label>
                                                <input type="checkbox" name="is_remote" id="remoteWork" value="1" {{ old('is_remote') ? 'checked' : '' }}>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post-job-item rt-mb-32">
                                <h4 class="f-size-18 ft-wt-5 rt-mb-20 lh-1">{{ __('benefits') }}</h4>
                                <div class="benefits-tags">
                                    @foreach ($benefits as $benefit)
                                        <label for="benefit_{{ $benefit->id }}">
                                            <input {{ old('benefits') ? in_array($benefit->id, old('benefits')) ? 'checked':'':'' }} type="checkbox" id="benefit_{{ $benefit->id }}" name="benefits[]" value="{{ $benefit->id }}">
                                            <span>{{ $benefit->name }}</span>
                                        </label>
                                    @endforeach
                                </div>
                                @error('benefits')
                                    <span class="error invalid-feedback d-block">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="post-job-item rt-mb-32">
                                <h4 class="f-size-18 ft-wt-5 tw-mb-3 lh-1">
                                    {{ __('job_description') }}
                                    <span class="form-label-required text-danger">*</span>
                                </h4>
                                <div class="col-md-12">
                                    <textarea id="default" class="form-control @error('description') is-invalid @enderror" name="description">{{ old('description') }}</textarea>
                                    @error('description')
                                        <span class="error invalid-feedback">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row tw-mb-8">
                                <div class="col-12">
                                    <div class="applied-job-on">
                                        <div class="row">
                                            <h2>{{ __('apply_job_on') }}:</h2>
                                            <!-- apply_on -->
                                            <div id="applied_on_app"
                                                class="radio-check col-lg-4 d-flex {{ old('apply_on') === 'app' ? 'checked' : '' }}"
                                                onclick="RadioChecked('app')">
                                                <input type="radio" {{ old('apply_on') === 'app' ? 'checked' : '' }}
                                                    checked name="apply_on" value="app" id="app-app">
                                                <label for="app-app">
                                                    <h4 class="d-inline-block">{{ __('onn') }}
                                                        {{ config('app.name') }}</h4>
                                                    <p class="tw-mb-0">{{ __('candidate_will_apply_job_using') }}
                                                        {{ config('app.name') }} &
                                                        {{ __('all_application_will_show_on_your_dashboard') }}.</p>
                                                </label>
                                            </div>
                                            <div id="applied_on_custom_url"
                                                class="radio-check col-lg-4 d-flex {{ old('apply_on') === 'custom_url' ? 'checked' : '' }}"
                                                onclick="RadioChecked('custom_url')">
                                                <input type="radio"
                                                    {{ old('apply_on') === 'custom_url' ? 'checked' : '' }}
                                                    name="apply_on" value="custom_url" id="app-custom_url">
                                                <label for="app-custom_url">
                                                    <h4 class="d-inline-block">{{ __('external_platform') }}</h4>
                                                    <p class="tw-mb-0">
                                                        {{ __('candidate_apply_job_on_your_website_all_application_on_your_own_website') }}.
                                                    </p>
                                                </label>
                                            </div>
                                            <div id="applied_on_email"
                                                class="radio-check col-lg-4 d-flex {{ old('apply_on') === 'email' ? 'checked' : '' }}"
                                                onclick="RadioChecked('email')">
                                                <input type="radio" {{ old('apply_on') === 'email' ? 'checked' : '' }}
                                                    name="apply_on" value="email" id="app-email">
                                                <label for="app-email">
                                                    <h4 class="d-inline-block">{{ __('on_your_email') }}</h4>
                                                    <p class="tw-mb-0">
                                                        {{ __('candidate_apply_job_on_your_email_address_and_all_application_in_your_email') }}.
                                                    </p>
                                                </label>
                                            </div>
                                            <!-- apply_on end-->
                                            <div class="col-12 d-none" id="apply_on_custom_url">
                                                <x-forms.label name="website_url" :required="true" />
                                                <div class="fromGroup has-icon2">
                                                    <div class="form-control-icon">
                                                        <input value="{{ old('apply_url') }}" name="apply_url"
                                                            class="form-control @error('apply_url') is-invalid @enderror"
                                                            type="url" placeholder="{{ __('website') }}">
                                                        <div class="icon-badge-2 @error('apply_url') mt-n-11 @enderror">
                                                            <x-svg.link-icon />
                                                        </div>
                                                        @error('apply_url')
                                                            <span class="error invalid-feedback">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 d-none" id="apply_on_email">
                                                <x-forms.label name="email_address" :required="true" />
                                                <div class="fromGroup has-icon2">
                                                    <div class="form-control-icon">
                                                        <input value="{{ old('apply_email') }}" name="apply_email"
                                                            class="form-control @error('apply_email') is-invalid @enderror"
                                                            type="email" placeholder="{{ __('email_address') }}">
                                                        <div class="icon-badge-2 @error('apply_email') mt-n-11 @enderror">
                                                            <x-svg.envelope-icon />
                                                        </div>
                                                        @error('apply_email')
                                                            <span class="error invalid-feedback">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="promote-form-wrapper">
                                <p>
                                    {{ __('highlight_jobs_or_show_them_on_the_home_page_as_a_feature') }}
                                </p>
                                <div class="input-wrapper tw-flex tw-flex-wrap tw-gap-6 rt-mb-32">
                                    <div class="form-check promote-form from-radio-custom tw-max-w-[384px]">
                                        <img src="{{ asset('frontend/assets/images/all-img/always-on-top.png') }}" alt="">
                                        <div class="tw-flex tw-items-center tw-ml-6 tw-mt-6">
                                            <input
                                                onclick="promoteJobPrice('{{ $setting->featured_job_price }}', '{{ $setting->per_job_price }}')"
                                                value="featured" class="form-check-input" type="radio" name="badge"
                                                id="flexRadioDefault1" value="featured">
                                            <label class="form-check-label f-size-14 pointer tw-mt-1" for="flexRadioDefault1">
                                                {{ __('featured') }} ({{ __('on_the_top') }})
                                                (+{{ $setting->featured_job_price }})
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-check promote-form from-radio-custom tw-max-w-[384px]">
                                        <img src="{{ asset('frontend/assets/images/all-img/highlight-job.png') }}" alt="">
                                        <div class="tw-flex tw-items-center tw-ml-6 tw-mt-6">
                                            <input
                                                onclick="promoteJobPrice('{{ $setting->highlight_job_price }}', '{{ $setting->per_job_price }}')"
                                                value="highlight" class="form-check-input" type="radio" name="badge"
                                                id="flexRadioDefault2">
                                            <label class="form-check-label f-size-14 pointer tw-mt-1" for="flexRadioDefault2">
                                                {{ __('highlight') }} (+{{ $setting->highlight_job_price }})
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="post-job-item rt-mb-15 mt-5">
                                <button type="submit" class="btn btn-primary rt-mr-10">
                                    <span class="button-content-wrapper ">
                                        <span class="button-icon align-icon-right">
                                            <i class="ph-arrow-right"></i>
                                        </span>
                                        <span class="button-text">
                                            {{ __('post_job') }} - <span
                                                id="per_job_price">{{ $setting->per_job_price }}</span>
                                            {{ currentCurrencyCode() }}
                                        </span>
                                        <input type="hidden" id="total_price_perjob" name="total_price_perjob"
                                            value="{{ $setting->per_job_price }}">
                                    </span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('css')
    <link rel="stylesheet" href="{{ asset('frontend') }}/assets/css/bootstrap-datepicker.min.css">
    <x-map.leaflet.map_links/>
    <x-map.leaflet.autocomplete_links/>
    <style>
        .ck-editor__editable_inline {
            min-height: 300px;
        }

        .mymap {
            border-radius: 12px;
        }

        .mt-n-11 {
            margin-top: -11px;
        }
        .custom-checkbox-wrap .main input:checked~.custom-checkbox:after {
            left: 8% !important;
        }
    </style>
    <!-- >=>Mapbox<=< -->
    @include('map::links')
    <!-- >=>Mapbox<=< -->
@endsection

@section('frontend_scripts')
    <script src="{{ asset('frontend/assets/js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('frontend') }}/assets/js/ckeditor.min.js"></script>
    @include('map::set-leafletmap')
    <script>
        var max_days = '{{ $setting->job_deadline_expiration_limit }}'

        $("#date").attr("autocomplete", "off");
        $('.datepicker').off('focus').datepicker({
            format: 'dd-mm-yyyy',
            startDate: '0d',
            endDate: `+${max_days}d`
        }).on('click',
            function() {
                $(this).datepicker('show');
            }
        );
    </script>
    <script>
        ClassicEditor
            .create(document.querySelector('#default'))
            .catch(error => {
                console.error(error);
            });
    </script>
    @include('map::set-googlemap')
    @include('map::set-mapbox')

    <script>
        var salary_mode = "{!! old('salary_mode') !!}";

        if (salary_mode) {
            salaryModeChange(salary_mode);
        }

        function salaryModeChange(param){
            var value = param;

            if (value === 'range') {
                $('#custom_salary_part').addClass('d-none');
                $('.salary_range_part').removeClass('d-none');
                $('#salary_rangee').prop('checked', true)
                $('#custom_salary').prop('checked', false)
            }else{
                $('#custom_salary_part').removeClass('d-none');
                $('.salary_range_part').addClass('d-none');
                $('#salary_rangee').prop('checked', false)
                $('#custom_salary').prop('checked', true)
            }
        }

        function RadioChecked(param) {
            var value = param;
            if (value === 'email') {
                $('#applied_on_email').addClass('checked');
                $('#apply_on_custom_url').addClass('d-none');
                $('#apply_on_email').removeClass('d-none');
                $('#applied_on_app').removeClass('checked');
                $('#applied_on_custom_url').removeClass('checked');
            }
            if (value === 'custom_url') {
                $('#applied_on_custom_url').addClass('checked');
                $('#apply_on_email').addClass('d-none');
                $('#apply_on_custom_url').removeClass('d-none');
                $('#applied_on_app').removeClass('checked');
                $('#applied_on_email').removeClass('checked');
            }
            if (value === 'app') {
                $('#applied_on_app').addClass('checked');
                $('#applied_on_email').removeClass('checked');
                $('#applied_on_custom_url').removeClass('checked');
                $('#apply_on_email').addClass('d-none');
                $('#apply_on_custom_url').addClass('d-none');
            }
        }
        $('.radio-check').on('click', function() {
            $('input:radio', this).prop('checked', true);
        });

        if ($('#app-app').is(':checked')) {
            $('#applied_on_app').addClass('checked');
        }
        if ($('#app-custom_url').is(':checked')) {
            $('#apply_on_custom_url').removeClass('d-none');
        }
        if ($('#app-email').is(':checked')) {
            $('#apply_on_email').removeClass('d-none');
        }

        var apply_url = "{!! $errors->first('apply_url') !!}";
        var apply_url1 = "{!! old('apply_email') !!}";
        var apply_email = "{!! $errors->first('apply_email') !!}";
        var apply_email1 = "{!! old('apply_email') !!}";

        if (apply_url) {
            $('#apply_on_custom_url').removeClass('d-none');
        }
        if (apply_url1) {
            $('#apply_on_custom_url').removeClass('d-none');
        }
        if (apply_email) {
            $('#apply_on_email').removeClass('d-none');
        }
        if (apply_email1) {
            $('#apply_on_email').removeClass('d-none');
        }

        function promoteJobPrice(promoteJob, jobPrice) {
            let totalPrice = parseInt(promoteJob) + parseInt(jobPrice)
            $('#per_job_price').html(totalPrice)
            $('#total_price_perjob').val(totalPrice)
        }
    </script>
@endsection
