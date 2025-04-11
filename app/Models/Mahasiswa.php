<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Mahasiswa extends Model
{
    use HasFactory;

    protected $table = 'mahasiswa';

    protected $fillable = ['user_id','nim','nama','alamat','no_hp'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
