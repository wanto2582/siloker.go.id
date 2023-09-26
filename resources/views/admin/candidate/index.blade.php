@extends('admin.layouts.app')
@section('title')
    {{ __('candidate_list') }}
@endsection
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <h3 class="card-title line-height-36">{{ __('candidate_list') }}</h3>
                        <div>
                            @if (userCan('candidate.create'))
                                <a href="{{ route('candidate.create') }}" class="btn bg-primary"><i
                                        class="fas fa-plus mr-1"></i> {{ __('create') }}
                                </a>
                            @endif
                            @if (request('keyword') || request('ev_status') || request('sort_by'))
                                <a href="{{ route('candidate.index') }}" class="btn bg-danger"><i
                                        class="fas fa-times"></i>&nbsp; {{ __('clear') }}
                                </a>
                            @endif
                        </div>
                        <div class="col-sm-9">
                            <button type="button" class="btn btn-rounded btn-success text-bold submit-download" style="float: right !important;">
                                <span>Download</span>
                            </button>
                        </div>
                    </div>
                </div>

                {{-- Filter  --}}
                <form id="formSubmit" action="{{ route('candidate.index') }}" method="GET" onchange="this.submit();">
                    <div class="card-body border-bottom row">
                        <div class="col-4">
                            <label>{{ __('search') }}</label>
                            <input name="nama_pelamar" id="nama_pelamar" type="text" placeholder="{{ __('search') }}" class="form-control"
                                value="{{ request('nama_pelamar') }}">
                        </div>
                        <div class="col-4">
                            <label>{{ __('email_verification') }}</label>
                            <select name="ev_status" id="ev_status" class="form-control w-100-p">
                                <option selected value="">
                                    Pilih Status
                                </option>
                                <option {{ request('ev_status') == 'true' ? 'selected' : '' }} value="true">
                                    verified
                                </option>
                                <option {{ request('ev_status') == 'false' ? 'selected' : '' }} value="false">
                                    not_verified
                                </option>
                            </select>
                        </div>
                        <div class="col-4">
                            <label>{{ __('sort_by') }}</label>
                            <select name="sort_by" class="form-control w-100-p">
                                <option {{ !request('sort_by') || request('sort_by') == 'latest' ? 'selected' : '' }}
                                    value="latest" selected>
                                    {{ __('latest') }}
                                </option>
                                <option {{ request('sort_by') == 'oldest' ? 'selected' : '' }} value="oldest">
                                    {{ __('oldest') }}
                                </option>
                            </select>
                        </div>
                        <div class="col-4">
                            <label>{{ __('Kecamatan') }}</label>
                            <select name="kecamatan_filter" id="kecamatan_filter" class="form-control w-100-p">
                                <option value="">Pilih Kecamatan</option>
                                @foreach($kecamatan as $item)
                                    <option value="{{ $item->id }}" {{ request('kecamatan_filter') == $item->id ? 'selected' : '' }}>
                                        {{ $item->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-4">
                            <label>{{ __('Kabupaten') }}</label>
                            <select name="kabupaten_filter" id="kabupaten_filter" class="form-control w-100-p">
                                <option value="">Pilih Kabupaten</option>
                                @foreach($kabupaten as $item)
                                    <option value="{{ $item->id }}" {{ request('kabupaten_filter') == $item->id ? 'selected' : '' }}>
                                        {{ $item->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-4">
                            <label>{{ __('Provinsi') }}</label>
                            <select name="provinsi_filter" id="provinsi_filter" class="form-control w-100-p">
                                <option value="">Pilih Provinsi</option>
                                @foreach($provinsi as $item)
                                    <option value="{{ $item->id }}" {{ request('provinsi_filter') == $item->id ? 'selected' : '' }}>
                                        {{ $item->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                </form>

                {{-- Table  --}}
                <div class="card-body table-responsive p-0">
                    <table class="ll-table table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>{{ __('candidate') }}</th>
                                <th>{{ __('role') }}/{{ __('position') }}</th>
                                <th>{{ __('applied_jobs') }}</th>
                                @if (userCan('candidate.update'))
                                <th width="10%">{{ __('account') }} {{ __('status') }}</th>
                                @endif
                                @if (userCan('candidate.update'))
                                <th>{{ __('email_verification') }}</th>
                                <th>{{ __('status') }}</th>
                                @endif
                                <th>{{ __('joined_date') }}</th>
                                <th>Kabupaten</th>
                                <th>Kecamatan</th>
                                <th>Provinsi</th>
                                @if (userCan('candidate.update') || userCan('candidate.delete'))
                                    <th width="12%">{{ __('action') }}</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @if ($candidates->count() > 0)
                                @foreach ($candidates as $candidate)
                                    <tr>
                                        <td tabindex="0">
                                            <a href="{{ route('candidate.show', $candidate->id) }}"  class="company">
                                                <img src="{{ $candidate->photo }}" alt="image">

                                                    <h2>{{ $candidate->user->name }}</h2>
                                                    <div><p>{{ $candidate->user->email }}</p>
                                                    <p><a href="https://api.whatsapp.com/send?phone=62{{ $candidate->user->no_hp }}&text=Halooo... {{ $candidate->user->name }}%0AKami%20dari%20DisNaker%20TapSel%20%0A"><x-svg.details-phone-call />{{ $candidate->user->no_hp }}</a>
                                                    </p>

                                                </div>
                                            </a>
                                        </td>
                                        <td tabindex="0">
                                            <p class="job-role">{{ $candidate->jobRole->name }}</p>
                                        </td>
                                        <td tabindex="0">
                                            {{ $candidate->applied_jobs_count }} {{ __('applied_jobs') }}
                                        </td>
                                        @if (userCan('candidate.update'))
                                            <td tabindex="0">
                                                <a href="javascript:void(0)" class="active-status">
                                                    <label class="switch ">
                                                        <input data-id="{{ $candidate->user_id }}" type="checkbox"
                                                            class="success status-switch change-active-status"
                                                            {{ $candidate->user->status == 1 ? 'checked' : '' }}>
                                                        <span class="slider round"></span>
                                                    </label>
                                                    <p class="{{ $candidate->user->status == 1 ? 'active' : '' }}" id="status_{{ $candidate->user_id }}">
                                                        {{ $candidate->user->status == 1 ? __('activated') : __('deactivated') }}</p>
                                                </a>
                                            </td>
                                        @endif
                                        @if (userCan('candidate.update'))
                                            <td tabindex="0">
                                                <a href="javascript:void(0)" class="active-status">
                                                    <label class="switch ">
                                                        <input data-userid="{{ $candidate->user_id }}" type="checkbox"
                                                            class="success email-verification-switch"
                                                            {{ $candidate->user->email_verified_at ? 'checked' : '' }}>
                                                        <span class="slider round"></span>
                                                    </label>
                                                    <p class="{{ $candidate->user->email_verified_at ? 'active' : '' }}" id="verification_status_{{ $candidate->user_id }}">
                                                        {{ $candidate->user->email_verified_at ? __('verified') : __('unverified') }}</p>
                                                </a>
                                            </td>
                                        @endif
                                        @if (userCan('candidate.update'))
                                            <td tabindex="0">
                                                <a href="javascript:void(0)" class="active-status">
                                                    <label class="switch ">
                                                        <input data-userid="{{ $candidate->user_id }}" type="checkbox"
                                                            class="success available-switch"
                                                            {{ $candidate->status == 'available' ? 'checked' : '' }}>
                                                        <span class="slider round"></span>
                                                    </label>
                                                    <p class="{{ $candidate->status == 'available' ? 'active' : '' }}" id="available_status_{{ $candidate->user_id }}">
                                                        {{ $candidate->status == 'available' ? __('availabe') : __('not_available') }}</p>
                                                </a>
                                            </td>
                                        @endif
                                        <td tabindex="0">
                                            {{ Carbon\Carbon::parse($candidate->created_at)->format('d M, Y') }}
                                        </td>
                                        <td tabindex="0">
                                            <p>{{ $candidate->contactInfo->kecamatan->name }}</p>
                                        </td>
                                        <td tabindex="0">
                                            <p>{{ $candidate->contactInfo->kabupaten->name }}</p>
                                        </td>
                                        <td tabindex="0">
                                            <p>{{ $candidate->contactInfo->provinsi->name }}</p>
                                        </td>
                                        @if (userCan('candidate.update') || userCan('candidate.delete'))
                                            <td>
                                                @if (userCan('candidate.view'))
                                                    <a href="{{ route('candidate.show', $candidate->id) }}"
                                                        class="btn ll-btn ll-border-none">
                                                        {{__('Lihat profile')}}
                                                        <x-svg.table-btn-arrow />
                                                    </a>
                                                @endif
                                                @if (userCan('candidate.update'))
                                                    <a href="{{ route('candidate.edit', $candidate->id) }}"
                                                        class="btn ll-mr-4 ll-p-0">
                                                        <x-svg.table-edit />
                                                    </a>
                                                @endif
                                                @if (userCan('candidate.delete'))
                                                    <form action="{{ route('candidate.destroy', $candidate->id) }}"
                                                        method="POST" class="d-inline">
                                                        @method('DELETE')
                                                        @csrf
                                                        <button
                                                            onclick="return confirm('{{ __('are_you_sure_you_want_to_delete_this_item') }}');"
                                                            class="btn ll-p-0">
                                                            <x-svg.table-delete />
                                                        </button>
                                                    </form>
                                                @endif
                                            </td>
                                        @endif
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="8">
                                        {{ __('no_data_found') }}
                                    </td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                    @if ($candidates->count())
                        <div class="mt-3 d-flex justify-content-center">
                            {{ $candidates->onEachSide(1)->links() }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection

@section('style')
    <link rel="stylesheet" href="{{ asset('backend') }}/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 35px;
            height: 19px;
        }

        /* Hide default HTML checkbox */
        .switch input {
            display: none;
        }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 15px;
            width: 15px;
            left: 3px;
            bottom: 2px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input.success:checked+.slider {
            background-color: #28a745;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(15px);
            -ms-transform: translateX(15px);
            transform: translateX(15px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>
@endsection

@section('script')
    <script src="{{ asset('backend') }}/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <script>
        var url = {
            download: "{{route('download_report_candidate')}}"
        };
        $(document).on('click', '.submit-download', function(e) {

            let
            nama_pelamar = $('#nama_pelamar').val(),
                ev_status = $('#ev_status').val(),
                kecamatan_filter = $('#kecamatan_filter').val(),
                kabupaten_filter = $('#kabupaten_filter').val(),
                provinsi_filter = $('#provinsi_filter').val(),
                sort_by = $('#sort_by').val();
                // console.log(kecamatan);
            let urlDownload = [];

            let finalUrl = url.download;
            finalUrl = finalUrl + '?';
            console.log(nama_pelamar);

            if (nama_pelamar) {
                finalUrl = finalUrl + `&&nama_pelamar=${nama_pelamar}`;
            }

            if (ev_status) {
                finalUrl = finalUrl + `&&ev_status=${ev_status}`;
            }

            if (sort_by) {
                finalUrl = finalUrl + `&&sort_by=${sort_by}`;
            }

            if (kecamatan_filter) {
                finalUrl = finalUrl + `&&kecamatan_filter=${kecamatan_filter}`;
            }

            if (kabupaten_filter) {
                finalUrl = finalUrl + `&&kabupaten_filter=${kabupaten_filter}`;
            }

            if (provinsi_filter) {
                finalUrl = finalUrl + `&&provinsi_filter=${provinsi_filter}`;
            }
            window.open(finalUrl);

            // console.log(finalUrl);
            // $('#formFilter').submit();
        });
        $('.status-switch').on('change', function() {
            var status = $(this).prop('checked') == true ? 1 : 0;
            var id = $(this).data('id');
            $.ajax({
                type: "GET",
                dataType: "json",
                url: '{{ route('candidate.status.change') }}',
                data: {
                    'status': status,
                    'id': id
                },
                success: function(response) {
                    toastr.success(response.message, 'Success');
                }
            });

            if (status == 1) {
                $(`#status_${id}`).text("{{ __('activated') }}")
            }else{
                $(`#status_${id}`).text("{{ __('deactivated') }}")
            }
        });

        $('.email-verification-switch').on('change', function() {
            var status = $(this).prop('checked') == true ? 1 : 0;
            var id = $(this).data('userid');

            $.ajax({
                type: "GET",
                dataType: "json",
                url: '{{ route('company.verify.change') }}',
                data: {
                    'status': status,
                    'id': id
                },
                success: function(response) {
                    toastr.success(response.message, 'Success');
                }
            });

            if (status == 1) {
                $(`#verification_status_${id}`).text("{{ __('verified') }}")
            }else{
                $(`#verification_status_${id}`).text("{{ __('unverified') }}")
            }
        });

        $('.available-switch').on('change', function() {
            var status = $(this).prop('checked') == true ? 1 : 0;
            var id = $(this).data('userid');

            $.ajax({
                type: "GET",
                dataType: "json",
                url: '{{ route('company.available.change') }}',
                data: {
                    'status': status,
                    'id': id
                },
                success: function(response) {
                    toastr.success(response.message, 'Success');
                }
            });

            if (status == 1) {
                $(`#available_status_${id}`).text("{{ __('available') }}")
            }else{
                $(`#available_status_${id}`).text("{{ __('not_available') }}")
            }
        });
    </script>
    <script>
        $(document).ready(function() {
            validate();
            $('#title').keyup(validate);
        });

        function validate() {
            if (
                $('#title').val().length > 0) {
                $('#crossB').removeClass('d-none');
            } else {
                $('#crossB').addClass('d-none');
            }
        }

        $('#formSubmit').on('change', function() {
            $(this).submit();
        });

        function RemoveFilter(id) {
            $('#' + id).val('');
            $('#formSubmit').submit();
        }
    </script>
@endsection
