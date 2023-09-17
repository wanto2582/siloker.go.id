<?php

namespace App\Services\Admin;


use DateTime;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class JobService
{

    public function __construct()
    {
    }

    public function getReportJob()
    {
        // $whereArea = '';

        // if ($startDate && $endDate) {
        //     $order_date_filter = ' AND DATE(a.created_at) between ' . "'$startDate'" . ' and ' . "'$endDate'" . '';
        // }

        $query = DB::select(
            "
            SELECT
                a.title,
                c.`name`,
                d.phone,
                d.secondary_phone,
                d.email,
                d.secondary_email,
                a.min_salary,
                a.max_salary,
                a.deadline,
                a.place,
                a.address
            FROM
                jobs a
                LEFT JOIN companies b ON a.company_id = b.id
                LEFT JOIN users c ON b.user_id = c.id
                LEFT JOIN contact_infos d ON c.id = d.user_id
            "
        );

        return $query;
    }
}
