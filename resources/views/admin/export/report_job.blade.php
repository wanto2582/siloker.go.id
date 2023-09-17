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
        <td rowspan="2" colspan="12" style="text-align: center; font-weight: bold; font-size: 20pt">
            <h1>LIST - PEKERJAAN</h1>
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
            <th class="">Name Pekerjaan</th>
            <th class="">Name Perusahaan</th>
            <th class="">No. Tlp Perusahaan</th>
            <th class="">No. Tlp Perusahaan 2</th>
            <th class="">Email</th>
            <th class="">Email 2</th>
            <th class="">Gaji Minimal</th>
            <th class="">Gaji Maximal</th>
            <th class="">Deadline</th>
            <th class="">Tempat</th>
            <th class="">Alamat</th>
        </tr>
    </thead>

    <tbody>
        @foreach($data as $item => $value)
        <tr>
            <td>{{($item+1)}}</td>
            <td>{{$value->title}}</td>
            <td>{{$value->name}}</td>
            <td>{{$value->phone}}</td>
            <td>{{($value->secondary_phone ? $value->secondary_phone : '-')}}</td>
            <td>{{$value->email}}</td>
            <td>{{($value->secondary_email ? $value->secondary_email : '-')}}</td>
            <td>{{$value->min_salary}}</td>
            <td>{{$value->max_salary}}</td>
            <td>{{$value->deadline}}</td>
            <td>{{$value->place}}</td>
            <td>{{$value->address}}</td>
        </tr>
        @endforeach
    </tbody>
</table>

</html>
