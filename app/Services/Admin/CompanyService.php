<?php

namespace App\Services\Admin;


use DateTime;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class CompanyService
{

    public function __construct()
    {
    }

    public function getCompanyCandidate($id)
    {
        // $whereArea = '';

        // if ($startDate && $endDate) {
        //     $order_date_filter = ' AND DATE(a.created_at) between ' . "'$startDate'" . ' and ' . "'$endDate'" . '';
        // }

        $query = DB::select(
            "
            SELECT
                e.id as company_id, d.id as jobs_id, d.title, d.min_salary, d.max_salary, d.deadline, d.`status` as job_status, c.`name`, f.`name` as company
            FROM
                `applied_jobs` a
                LEFT JOIN candidates b ON a.candidate_id = b.id
                LEFT JOIN users c ON b.user_id = c.id
                LEFT JOIN jobs d on a.job_id = d.id
                LEFT JOIN companies e on d.company_id = e.id
                LEFT JOIN users f on e.user_id = f.id AND f.role = 'company'
            WHERE company_id = $id
            "
        );

        return $query;
    }

    public function getReportCompany()
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
                a.establishment_date,
                a.place,
                a.address
            FROM
                companies a
                LEFT JOIN users b ON a.user_id = b.id
                LEFT JOIN contact_infos c ON b.id = c.user_id
            "
        );

        return $query;
    }
}
