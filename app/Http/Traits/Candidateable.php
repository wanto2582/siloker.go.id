<?php

namespace App\Http\Traits;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Skill;
use App\Models\Candidate;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Profession;
use App\Models\CandidateLanguage;

trait Candidateable
{
    private function getCandidates($request)
    {
        if (auth()->user() ? auth()->user()->role == 'company' : '') {
            $query = Candidate::with(array('user' => function ($query) {
                $query->where('role', 'candidate');
            }))
                ->latest()
                ->with('user.contactInfo')
                ->withCount(['bookmarkCandidates as bookmarked' => function ($q) {
                    $q->where('company_id', auth('user')->user()->company->id);
                }])
                ->withCount(['already_views as already_view' => function ($q) {
                    $q->where('company_id', auth('user')->user()->company->id);
                }])
                ->withCasts(['already_view' => 'boolean'])
                ->with(['already_views' => function ($q) {
                    $q->where('company_id', auth('user')->user()->company->id)->select(['candidate_id', 'company_id', 'view_date']);
                }])
                ->withCasts(['bookmarked' => 'boolean'])
                ->where('visibility', 1);
        } else {

            $query = Candidate::with(array('user' => function ($query) {
                $query->where('role', 'candidate');
            }))
                ->with('user.contactInfo')
                ->latest()
                ->where('visibility', 1);
        }

        // status
        if ($request->has('status') && $request->status != null) {
            $query->where('status', $request->status);
        }else{
            $query->where('status', 'available');
            $request['status'] = 'available';
        }

        // keyword
        if ($request->has('keyword') && $request->keyword != null) {

            $query->whereHas('user', function ($q) use ($request) {
                $q->where('name', 'LIKE', "%$request->keyword%");
            });
        }

        // location
        if ($request->has('lat') && $request->has('long') && $request->lat != null && $request->long != null) {
            $ids = $this->candidate_location_filter($request->lat, $request->long);
            $query->whereIn('id', $ids)->orWhere('country', $request->location ? $request->location : '');
        }


        // profession
        if ($request->has('profession') && $request->profession != null) {
            $query->where('profession_id', $request->profession);
            // $profession_id = Profession::where('name', $request->profession)->value('id');
            // $query->where('profession_id', $profession_id);
        }

        // experience
        if ($request->has('experience') && $request->experience != null && $request->experience != 'all') {
            $experience_id = Experience::whereName($request->experience)->value('id');
            $query->where('experience_id', $experience_id);
        }

        // education
        if ($request->has('education') && $request->education != null && $request->education != 'all') {
            $education_id = Education::whereName($request->education)->value('id');
            $query->where('education_id', $education_id);
        }

        // gender
        if ($request->has('gender') && $request->gender != null) {
            $query->where('gender', request('gender'));
        }

        //  sortBy search
        if ($request->has('sortby') && $request->sortby) {
            if ($request->sortby == 'latest') {
                $query->latest();
            } else {
                $query->oldest();
            }
        }

         // languages filter
         if ($request->has('language') && $request->language != null) {
            $query->whereHas('languages', function($q) use ($request){
                $q->where('candidate_language.candidate_language_id', $request->language);
            });
        }

         // skills filter
         if ($request->has('skills') && $request->skills != null) {
            $skills = $request->skills;

            if($skills){
                $query->whereHas('skills', function($q) use ($skills){
                    $q->whereIn('candidate_skill.skill_id', $skills);
                });
            }
        }

        // perpage
        $candidates = $query->with('user', 'profession', 'experience:id,name');
        // $candidates = $query->with(['user' => function ($query) {
        //     $query->where('status', 1);
        // }], 'profession', 'experience:id,name');
        // dd($candidates->get());

        return $candidates->paginate(12)->withQueryString();
    }

    private function getRelatedCandidate($candidate)
    {

        $query = User::query();

        //  Gender
        if ($candidate->candidate->gender != null) {

            $query->whereHas('candidate', function ($q) use ($candidate) {
                $q->where('gender', $candidate->candidate->gender);
            });
        }
        //  education
        if ($candidate->candidate->education != null) {

            $query->whereHas('candidate', function ($q) use ($candidate) {
                $q->where('education', $candidate->candidate->education);
            });
        }

        //  visibility
        $query->whereHas('candidate', function ($q) {
            $q->where('visibility', 1);
        });

        $candidates = $query->where('role', 'candidate')->where('id', '!=', $candidate->id)->latest()->with('candidate')->get();

        return $candidates;
    }

    public function candidate_location_filter($latitude, $longitude)
    {
        // $latitude = -58.7699;
        // $longitude = 40.283499;
        $distance = 50;

        $haversine = "(
                    6371 * acos(
                        cos(radians(" . $latitude . "))
                        * cos(radians(`lat`))
                        * cos(radians(`long`) - radians(" . $longitude . "))
                        + sin(radians(" . $latitude . ")) * sin(radians(`lat`))
                    )
                )";

        $data = Candidate::select('id')->selectRaw("$haversine AS distance")
            ->having("distance", "<=", $distance)->get();

        $ids = [];

        foreach ($data as $id) {
            array_push($ids, $id->id);
        }

        return $ids;
    }
}
