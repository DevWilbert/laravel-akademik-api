<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('mahasiswa', App\Http\Controllers\MahasiswaController::class);
Route::apiResource('dosen', App\Http\Controllers\DosenController::class);
Route::apiResource('matakuliah', App\Http\Controllers\MataKuliahController::class);