<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\Job;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Astrotomic\Translatable\Contracts\Translatable as TranslatableContract;
use Astrotomic\Translatable\Translatable;

class Kecamatan extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'loc_kecamatan';

    // public $translatedAttributes = ['name'];

    protected $fillable = [
        'id',
        'id_negara',
        'id_kabupaten',
        'name',
    ];

    public function negara()
    {
        return $this->belongsTo(Negara::class, 'id_negara', 'id'); // Assuming 'negara_id' is the foreign key column in the 'loc_kabupaten' table
    }

    public function kabupaten()
    {
        return $this->belongsTo(Kabupaten::class, 'id_kabupaten', 'id'); // Assuming 'negara_id' is the foreign key column in the 'loc_kabupaten' table
    }
}
