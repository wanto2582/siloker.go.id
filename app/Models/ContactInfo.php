<?php

namespace App\Models;

use Modules\Location\Entities\City;
use Modules\Location\Entities\Country;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Location\Entities\State;

class ContactInfo extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'no_hp',
        'phone',
        'secondary_phone',
        'email',
        'secondary_email',
        'address',
        'id_negara',
        'id_provinsi',
        'id_kecamatan',
        'id_kabupaten'
    ];

    public function kecamatan()
    {
        return $this->belongsTo(Kecamatan::class, 'id_kecamatan');
    }

    public function kabupaten()
    {
        return $this->belongsTo(Kabupaten::class, 'id_kabupaten');
    }

    public function provinsi()
    {
        return $this->belongsTo(Provinsi::class, 'id_provinsi');
    }

    public function negara()
    {
        return $this->belongsTo(Negara::class, 'id_negara');
    }
}
