<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Matakuliah extends Model
{
    use HasFactory;

    protected $fillable = [
        'kode_matakuliah',
        'nama',
        'sks',
        'semester',
        'dosen_id',
    ];

    public function dosen()
    {
        return $this->belongsTo(Dosen::class);
    }
}