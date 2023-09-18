@extends('admin.layouts.app')
@section('title')
Kecamatan
@endsection
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title line-height-36">List Kecamatan ({{ count($kecamatanCategories) }})</h3>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>{{ __('country') }}</th>
                                <th>Kabupaten</th>
                                <th>{{ __('name') }}</th>
                                @if (userCan('kecamatan.update') || userCan('kecamatan.delete'))
                                <th width="10%">{{ __('action') }}</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($kecamatanCategories as $category)
                            <tr>
                                <td>
                                    <h5>{{ $category->negara->name }}</h5>
                                </td>
                                <td>
                                    <h5>{{ $category->kabupaten->name }}</h5>
                                </td>
                                <td>
                                    <h5>{{ $category->name }}</h5>
                                </td>
                                <td>
                                    @if (userCan('kecamatan.update'))
                                    <a href="{{ route('kecamatanCategory.edit', $category->id) }}" class="btn bg-info"><i class="fas fa-edit"></i></a>
                                    @endif
                                    @if (userCan('kecamatan.delete'))
                                    <form action="{{ route('kecamatanCategory.destroy', $category->id) }}" method="POST" class="d-inline">
                                        @method('DELETE')
                                        @csrf
                                        <button onclick="return confirm('{{ __('are_you_sure_you_want_to_delete_this_item') }}');" class="btn bg-danger"><i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                    @endif
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="10" class="text-center">
                                    {{ __('no_data_found') }}
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            @if (!empty($kecamatanEdit) && userCan('kecamatan.update'))
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title line-height-36">{{ __('edit') }} Kecamatan</h3>
                    <a href="{{ route('kecamatanCategory.index') }}" class="btn bg-primary float-right d-flex align-items-center justify-content-center"><i class="fas fa-plus mr-1"></i>{{ __('create') }}
                    </a>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('kecamatanCategory.update', $kecamatanEdit->id) }}" method="POST" enctype="multipart/form-data">
                        @method('PUT')
                        @csrf

                        <div class="form-group row col-12">
                            <label>{{ __('country') }} <x-forms.required /></label>
                            <select name="edit_negara" id="edit_negara" class="form-control w-100-p">
                                <option value="">Pilih Negara</option>
                                @foreach ($select2OptionsEdit as $value => $text)
                                <option value="{{ $value }}" {{ $value == $kecamatanEdit->id_negara ? 'selected' : '' }}>{{ $text }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group row">
                            <label for="edit_name">
                                {{ __('name') }} <x-forms.required />
                            </label>
                            <input id="edit_name" type="text" name="edit_name" value="{{ old('edit_name', $kecamatanEdit->name) }}" class="form-control @error('edit_name') is-invalid @enderror">
                            @error('edit_name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        <div class="form-group row m-auto">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-sync mr-1"></i>
                                {{ __('save') }}
                            </button>
                        </div>
                    </form>
                </div>

            </div>
            @endif
            @if (empty($kecamatanEdit) && userCan('kecamatan.create'))
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title line-height-36">{{ __('add') }} Kecamatan</h3>
                </div>
                <div class="card-body">
                    @if (userCan('kecamatan.create'))
                    <form class="form-horizontal" action="{{ route('kecamatanCategory.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- <div class="form-group row">
                            <label for="negara">
                                {{ __('country') }} <x-forms.required />
                            </label>
                            <select id="select2-dropdown" name="negara">
                                <option value="">Select an option</option>
                                @foreach ($select2Options as $value => $text)
                                <option value=" {{ $value }}">{{ $text }}</option>
                                @endforeach
                            </select>
                            @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div> -->
                        <div class="form-group row col-12">
                            <label>{{ __('country') }} <x-forms.required /></label>
                            <select name="negara" id="negara" class="form-control w-100-p">
                                <option value="">Pilih Negara</option>
                                @foreach ($select2Options as $value => $text)
                                <option value=" {{ $value }}">{{ $text }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group row col-12">
                            <label>Kabupaten <x-forms.required /></label>
                            <select name="kabupaten" id="kabupaten" class="form-control w-100-p">
                                <option value="">Pilih Kabupaten</option>
                                @foreach ($select2Options2 as $value => $text)
                                <option value=" {{ $value }}">{{ $text }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group row">
                            <label for="name">
                                {{ __('name') }} <x-forms.required />
                            </label>
                            <input id="name" type="text" name="name" placeholder="{{ __('name') }}" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror">
                            @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        <div class="form-group row m-auto">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-plus mr-1"></i>
                                {{ __('save') }}
                            </button>
                        </div>
                    </form>
                    @else
                    <p>{{ __('dont_have_permission') }}</p>
                    @endif
                </div>
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

@section('style')
<!-- Bootstrap-Iconpicker -->
<link rel="stylesheet" href="{{ asset('backend') }}/plugins/bootstrap-iconpicker/dist/css/bootstrap-iconpicker.min.css" />
@endsection

@section('script')
<!-- Bootstrap-Iconpicker Bundle -->
<script type="text/javascript" src="{{ asset('backend') }}/plugins/bootstrap-iconpicker/dist/js/bootstrap-iconpicker.bundle.min.js"></script>
<script type="text/javascript" src="{{ asset('backend') }}/plugins/bootstrap-iconpicker/dist/js/bootstrap-iconpicker.min.js"></script>

<script>
    $('#target').on('change', function(e) {
        $('#icon').val(e.icon)
    });
</script>
<script>
    $(document).ready(function() {
        $('#select2-dropdown').select2();
    });
</script>
@endsection