<?php

namespace App\Models;

use App\Models\CandidateLanguage;
use App\Models\CandidateExperience;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Candidate extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $appends = ['full_address'];

    protected $casts = [
        'date_of_birth'     =>  'datetime',
        'allow_in_search'   =>  'boolean'
    ];

    protected static function booted()
    {
        static::creating(function ($model) {
            if (!app()->runningInConsole() && !$model->photo) {
                $model->photo = createAvatar($model->user->name, 'uploads/images/candidate');
            }
        });
    }

    // accessor
    public function getPhotoAttribute($photo)
    {
        if ($photo == null) {
            return asset('backend/image/default.png');
        } else {
            return asset($photo);
        }
    }

    public function getFullAddressAttribute()
    {
        $country = $this->country;
        $region = $this->region;
        $extra = $region != null ? ' , ' : '';
        return $region . $extra . $country;
    }

    public function getCvUrlAttribute($photo)
    {
        if ($this->cv == null) {
            return '';
        } else {
            return route('website.candidate.download.cv', $this->id);
        }
    }

    public function scopeActive($query)
    {
        return $query->where('visibility', 1)->whereHas('user', function ($q) {
            $q->whereStatus(1);
        });
    }

    public function scopeInactive($query)
    {
        return $query->where('visibility', 0)->whereHas('user', function ($q) {
            $q->whereStatus(0);
        });
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function bookmarkJobs()
    {
        return $this->belongsToMany(Job::class, 'bookmark_candidate_job')->with('company', 'category', 'job_type:id,name');
    }

    public function bookmarkCompanies()
    {
        return $this->belongsToMany(Company::class, 'bookmark_candidate_company');
    }

    public function bookmarkCandidates()
    {
        return $this->belongsToMany(Company::class, 'bookmark_company')->withTimestamps();
    }

    public function appliedJobs()
    {
        return $this->belongsToMany(Job::class, 'applied_jobs')->with('company', 'job_type:id,name')->withTimestamps();
    }

    public function jobRole()
    {
        return $this->belongsTo(JobRole::class, 'role_id');
    }

    public function experience()
    {
        return $this->belongsTo(Experience::class, 'experience_id');
    }

    public function education()
    {
        return $this->belongsTo(Education::class, 'education_id');
    }

    public function profession()
    {
        return $this->belongsTo(Profession::class, 'profession_id');
    }

    public function resumes()
    {
        return $this->hasMany(CandidateResume::class, 'candidate_id');
    }


    public function skills()
    {
        return $this->belongsToMany(Skill::class, 'candidate_skill');
    }

    public function languages()
    {
        return $this->belongsToMany(CandidateLanguage::class, 'candidate_language');
    }

    public function experiences()
    {
        return $this->hasMany(CandidateExperience::class, 'candidate_id');
    }

    public function educations()
    {
        return $this->hasMany(CandidateEducation::class, 'candidate_id');
    }

    public function already_views()
    {
        return $this->hasMany(CandidateCvView::class, 'candidate_id', 'id');
    }
}
