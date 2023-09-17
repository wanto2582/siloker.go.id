<?php

namespace App\Services\Admin;


use DateTime;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class CandidateService
{

    public function __construct()
    {
    }

    public function getReportCandidate()
    {
        // $whereArea = '';

        // if ($startDate && $endDate) {
        //     $order_date_filter = ' AND DATE(a.created_at) between ' . "'$startDate'" . ' and ' . "'$endDate'" . '';
        // }

        $query = DB::select(
            "
            SELECT
                b.name AS name,
                c.phone,
                c.secondary_phone,
                c.email,
                c.secondary_email,
                a.gender AS kelamin,
                date(a.birth_date) as birth_date,
                a.address
            FROM
                candidates a
                LEFT JOIN users b ON a.user_id = b.id
                LEFT JOIN contact_infos c ON b.id = c.user_id
            "
        );

        return $query;
    }
}
