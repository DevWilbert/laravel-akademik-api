<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');


Route::post('/login', [App\Http\Controllers\AuthController::class, 'login']);
Route::post('/logout', [App\Http\Controllers\AuthController::class, 'logout'])->middleware('auth:sanctum');


Route::middleware(['auth:sanctum', 'is_admin'])->group(function () {
    Route::apiResource('mahasiswa', App\Http\Controllers\MahasiswaController::class);
    Route::apiResource('dosen', App\Http\Controllers\DosenController::class);
    Route::apiResource('matakuliah', App\Http\Controllers\MataKuliahController::class);
});

Route::apiResource('mahasiswa-mata-kuliah', App\Http\Controllers\MahasiswaMataKuliahController::class);