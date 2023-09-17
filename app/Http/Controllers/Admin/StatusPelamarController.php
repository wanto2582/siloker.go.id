<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Skill;
use App\Models\JobRole;
use App\Models\Candidate;
use App\Models\StatusPelamar;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Profession;
use App\Models\ContactInfo;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\SkillTranslation;
use App\Models\CandidateLanguage;
use Illuminate\Support\Facades\DB;
use Modules\Location\Entities\City;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Modules\Location\Entities\State;
use Modules\Location\Entities\Country;
use App\Http\Requests\CandidateRequest;
use Modules\Language\Entities\Language;
use App\Models\Setting;
use App\Notifications\CandidateCreateApprovalPendingNotification;
use Illuminate\Support\Facades\Notification;
use App\Notifications\CandidateCreateNotification;
use App\Notifications\UpdateCompanyPassNotification;
use App\Services\Admin\CandidateService;
use App\Exports\ReportStatusPelamar;
use Maatwebsite\Excel\Facades\Excel;

class StatusPelamarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $candidateService;

    public function __construct(CandidateService $candidateService)
    {
        $this->candidateService = $candidateService;
    }

    public function index(Request $request)
    {
        abort_if(!userCan('status_pelamar.view'), 403);

        // $query = StatusPelamar::withCount('appliedJobs')->with('user','jobRole');
        // $query = StatusPelamar::withCount('appliedJobs')->with('user','jobRole');
        $query = DB::table('applied_jobs AS a')
                ->select([
                    'b.id',
                    'e.id as company_id',
                    'd.id as jobs_id',
                    'd.title',
                    'd.min_salary',
                    'd.max_salary',
                    'd.deadline',
                    'd.status as job_status',
                    'c.name',
                    'c.email',
                    'c.no_hp',
                    'f.name as company',
                    'h.name as status',
                ])
                ->leftJoin('candidates AS b', 'a.candidate_id', '=', 'b.id')
                ->leftJoin('users AS c', 'b.user_id', '=', 'c.id')
                ->leftJoin('jobs AS d', 'a.job_id', '=', 'd.id')
                ->leftJoin('companies AS e', 'd.company_id', '=', 'e.id')
                ->leftJoin('users AS f', function ($join) {
                    $join->on('e.user_id', '=', 'f.id')
                        ->where('f.role', '=', 'company');
                })
                ->leftJoin('applied_jobs AS g', 'd.id', '=', 'g.job_id')
                ->leftJoin('application_groups AS h', 'g.application_group_id', '=', 'h.id');

        // verified status
        if ($request->has('ev_status') && $request->ev_status != null) {
            $ev_status = null;
            if ($request->ev_status == 'true') {
                $query->whereHas('user', function ($q) use ($ev_status) {
                    $q->whereNotNull('email_verified_at');
                });
            } else {
                $query->whereHas('user', function ($q) use ($ev_status) {
                    $q->whereNull('email_verified_at');
                });
            }
        }

        if ($request->nama_pelamar && $request->nama_pelamar != null) {
            $query->where('c.name', 'LIKE', "%$request->nama_pelamar%")
            ->orWhere('c.email', 'LIKE', "%$request->nama_pelamar%");
        }

        if ($request->perusahaan && $request->perusahaan != null) {
            $query->where('f.name', 'LIKE', "%$request->perusahaan%");
        }

        // sortby
        if ($request->sort_by !== "Pilih Status") {
            // Apply the query based on the selected option
            if ($request->sort_by == 'Diterima') {
                // $query->latest();
                $query->where('h.name', 'LIKE', "%$request->sort_by%");
            } elseif ($request->sort_by == 'Ditolak') {
                // $query->latest();
                $query->where('h.name', 'LIKE', "%$request->sort_by%");
            }  elseif ($request->sort_by == 'Interview') {
                // $query->latest();
                $query->where('h.name', 'LIKE', "%$request->sort_by%");
            } else {
                // $query->oldest();
            }
        }

        $candidates = $query->paginate(10)->withQueryString();
        // dd($candidates);

        return view('admin.status_pelamar.index', compact('candidates'));
    }

    public function downloadReportStatusPelamar(Request $request)
    {
        $filter = [
            'nama_pelamar' => $request->get('nama_pelamar'),
            'perusahaan' => $request->get('perusahaan'),
            'sort_by' => $request->get('sort_by')
        ];
        // dd($filter);

        // $dataReport = $this->candidateService->getReportCandidate();
        $query = DB::table('applied_jobs AS a')
                ->select([
                    'b.id',
                    'e.id as company_id',
                    'd.id as jobs_id',
                    'd.title',
                    'd.min_salary',
                    'd.max_salary',
                    'd.deadline',
                    'd.status as job_status',
                    'c.name',
                    'c.email',
                    'c.no_hp',
                    'f.name as company',
                    'h.name as status',
                ])
                ->leftJoin('candidates AS b', 'a.candidate_id', '=', 'b.id')
                ->leftJoin('users AS c', 'b.user_id', '=', 'c.id')
                ->leftJoin('jobs AS d', 'a.job_id', '=', 'd.id')
                ->leftJoin('companies AS e', 'd.company_id', '=', 'e.id')
                ->leftJoin('users AS f', function ($join) {
                    $join->on('e.user_id', '=', 'f.id')
                        ->where('f.role', '=', 'company');
                })
                ->leftJoin('applied_jobs AS g', 'd.id', '=', 'g.job_id')
                ->leftJoin('application_groups AS h', 'g.application_group_id', '=', 'h.id');

        if (isset($filter) && $filter['nama_pelamar']) {
            $query->where('c.name', 'LIKE', "%$request->nama_pelamar%")
            ->orWhere('c.email', 'LIKE', "%".$filter['nama_pelamar']."%");
        }

        if (isset($filter) && $filter['perusahaan']) {
            $query->where('f.name', 'LIKE', "%".$filter['perusahaan']."%");
        }

        // sortby
        if (isset($filter) && $filter['sort_by'] !== "Pilih Status") {
            if ($filter['sort_by'] == 'Diterima') {
                $query->where('h.name', 'LIKE', "%".$filter['sort_by']."%");
            } elseif ($filter['sort_by'] == 'Ditolak') {
                $query->where('h.name', 'LIKE', "%".$filter['sort_by']."%");
            } elseif ($filter['sort_by'] == 'Interview') {
                $query->where('h.name', 'LIKE', "%".$filter['sort_by']."%");
            } else {
                // $query->oldest();
            }
        }
        // dd($query->get());
        $filename = 'report_status_pelamar';
        return Excel::download(new ReportStatusPelamar($query, [] ), "$filename.xlsx");

//        $this->reportorderService->generateReportUsage($dataReport);
//        return Excel::download(new ReportLimitUsage($dataReport), "$filename.xlsx");



    }

    public function state(Request $request)
    {
        $states = State::where('country_id', $request->country_id)->get();
        return response()->json($states);
    }

    public function city(Request $request)
    {
        $cities = City::where('state_id', $request->state_id)->get();
        return response()->json($cities);
    }
}
