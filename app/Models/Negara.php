<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\Job;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Astrotomic\Translatable\Contracts\Translatable as TranslatableContract;
use Astrotomic\Translatable\Translatable;

class Negara extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'loc_negara';

    // public $translatedAttributes = ['name'];

    protected $fillable = [
        'id',
        'name',
    ];
    // protected $appends = ['image_url', 'open_jobs_count'];


    // public function getImageUrlAttribute()
    // {
    //     if (is_null($this->image)) {
    //         return asset('backend/image/default.png');
    //     }

    //     return asset($this->image);
    // }

    // public function getOpenJobsCountAttribute()
    // {
    //     return $this->jobs()
    //         ->where('status', 'active')
    //         ->where('deadline', '>=', Carbon::now()->toDateString())
    //         ->count();
    // }

    // public function jobs()
    // {
    //     return $this->hasMany(Job::class, 'category_id');
    // }
}
