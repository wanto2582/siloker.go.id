<html>

<style>
    .table th {
        border: 1px solid black;
    }

    .table tr td {
        border: 0.1px solid black;
    }

    .table thead tr th,
    .table tbody tr td {
        padding: 10px;
    }

    .table thead tr th,
    .table tbody tr td {
        padding: 10px;
    }

    .table thead tr th {
        text-align: center;
        background-color: #ccc;
    }

    table tbody tr td ol {
        margin: 5px;
        padding: 5px;
    }

    ol {
        margin: 0 0 0 10px;
        padding: 0;
    }
</style>

<table>
    <tr>
        <td rowspan="2" colspan="9" style="text-align: center; font-weight: bold; font-size: 20pt">
            <h1>LIST - PERUSAHAAN</h1>
        </td>
    </tr>

    <tr>
        <td></td>
    </tr>

    @if($filter)
    <!-- <tr>
        <td style="text-align: left; font-weight: bold; font-size: 10pt">
            <h1> {{strtoupper(array_keys($filter)[0])}} </h1>
        </td>
        <td style="text-align: center; font-weight: bold; font-size: 10pt">
            <h1>: </h1>
        </td>
        <td style="text-align: left; font-weight: bold; font-size: 10pt">
            <h1>{{strtoupper(array_values($filter)[0])}}</h1>
        </td>
    </tr> -->
    @else
    <tr>
        <td></td>
    </tr>
    @endif


</table>

<table class="table">
    <thead>
        <tr class="table100-head">
            <th width="3%" class="text-center">No</th>
            <th class="">Name</th>
            <th class="">Phone</th>
            <th class="">Second Phone</th>
            <th class="">Email</th>
            <th class="">Second Email</th>
            <th class="">Tanggal Pendirian</th>
            <th class="">Tempat</th>
            <th class="">Alamat</th>
        </tr>
    </thead>

    <tbody>
        @foreach($data as $item => $value)
        <tr>
            <td>{{($item+1)}}</td>
            <td>{{$value->user->name}}</td>
            <td>{{($value->contactInfo->phone ? $value->contactInfo->phone : '-')}}</td>
            <td>{{($value->contactInfo->secondary_phone ? $value->contactInfo->secondary_phone : '-')}}</td>
            <td>{{($value->contactInfo->email ? $value->contactInfo->email : '-')}}</td>
            <td>{{($value->contactInfo->secondary_email ? $value->contactInfo->secondary_email : '-')}}</td>
            <td>{{ date('Y-m-d', strtotime($value->establishment_date)) }}</td>
            <td>{{$value->place}}</td>
            <td>{{$value->contactInfo->address}}</td>
        </tr>
        @endforeach
    </tbody>
</table>

</html>
