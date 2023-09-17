<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Astrotomic\Translatable\Contracts\Translatable as TranslatableContract;
use Astrotomic\Translatable\Translatable;

class JobRole extends Model implements TranslatableContract
{
    use HasFactory, Translatable;

    public $translatedAttributes = ['name'];

    public function jobs()
    {
        return $this->hasMany(Job::class, 'role_id');
    }

    public function candidates()
    {
        return $this->hasMany(Candidate::class, 'role_id');
    }
}
