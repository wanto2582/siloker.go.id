@extends('admin.layouts.app')
@section('title')
    Status Pelamar
@endsection
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <h3 class="card-title line-height-36">Status Pelamar</h3>
                        <div>
                            <!-- @if (userCan('candidate.create'))
                                <a href="{{ route('candidate.create') }}" class="btn bg-primary"><i
                                        class="fas fa-plus mr-1"></i> {{ __('create') }}
                                </a>
                            @endif -->
                            @if (request('keyword') || request('ev_status') || request('sort_by'))
                                <a href="{{ route('status_pelamar.index') }}" class="btn bg-danger"><i
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
                <form id="formSubmit" action="{{ route('status_pelamar.index') }}" method="GET" onchange="this.submit();">
                    <div class="card-body border-bottom row">
                        <div class="col-4">
                            <label>{{ __('search') }}</label>
                            <input name="nama_pelamar" id="nama_pelamar" type="text" placeholder="{{ __('search') }}" class="form-control"
                                value="{{ request('nama_pelamar') }}">
                        </div>
                        <div class="col-4">
                            <label>Perusahaan</label>
                            <input name="perusahaan" id="perusahaan" type="text" placeholder="{{ __('search') }}" class="form-control"
                                value="{{ request('perusahaan') }}">
                        </div>
                        <div class="col-4">
                            <label>{{ __('status') }}</label>
                            <select name="sort_by" id="sort_by" class="form-control w-100-p">
                                <option selected>
                                    Pilih Status
                                </option>
                                <option {{ request('sort_by') == 'Diterima' ? 'selected' : '' }} value="Diterima">
                                    Diterima
                                </option>
                                <option {{ request('sort_by') == 'Ditolak' ? 'selected' : '' }} value="Ditolak">
                                    Ditolak
                                </option>
                                <option {{ request('sort_by') == 'Interview' ? 'selected' : '' }} value="Interview">
                                    Interview
                                </option>
                            </select>
                        </div>
                    </div>
                </form>

                {{-- Table  --}}
                <div class="card-body table-responsive p-0">
                    <table class="ll-table table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>{{ __('name') }}</th>
                                <th>{{ __('applied_jobs') }}</th>
                                <th>{{ __('company') }}</th>
                                <th>{{ __('job_status') }}</th>
                                <th>{{ __('status') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($candidates->count() > 0)
                                @foreach ($candidates as $candidate)
                                    <tr>
                                        <td tabindex="0">
                                            <a href="{{ route('candidate.show', $candidate->id) }}"  class="company">

                                                    <h2>{{ $candidate->name }}</h2>

                                                </div>
                                            </a>
                                        </td>
                                        <td tabindex="0">
                                            <p class="job-role">{{ $candidate->title }}</p>
                                        </td>
                                        <td tabindex="0">
                                            <p class="company">{{ $candidate->company }}</p>
                                        </td>
                                        <td tabindex="0">
                                            <p class="job_status">{{ $candidate->job_status }}</p>
                                        </td>
                                        <td tabindex="0">
                                            <p class="status">{{ $candidate->status }}</p>
                                        </td>

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
            download: "{{route('download_report_status_pelamar')}}"
        };
        // $(document).on('click', '.submit-download', function(e) {
        //     let urlDownload = [];


        //     let finalUrl = url.download;
        //     window.open(finalUrl);
        // });
        $(document).on('click', '.submit-download', function(e) {

            let
                nama_pelamar = $('#nama_pelamar').val(),
                perusahaan = $('#perusahaan').val(),
                sort_by = $('#sort_by').val()
                // console.log(sort_by);
            let urlDownload = [];

            let finalUrl = url.download;
            finalUrl = finalUrl + '?';

            if (nama_pelamar) {
                finalUrl = finalUrl + `&&nama_pelamar=${nama_pelamar}`;
            }

            if (perusahaan) {
                finalUrl = finalUrl + `&&perusahaan=${perusahaan}`;
            }

            if (sort_by) {
                finalUrl = finalUrl + `&&sort_by=${sort_by}`;
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
                $(`#verification_status_${id}`).text("{{ __('available') }}")
            }else{
                $(`#verification_status_${id}`).text("{{ __('not_available') }}")
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
