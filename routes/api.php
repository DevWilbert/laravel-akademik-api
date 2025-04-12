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

Route::middleware(['auth:sanctum', 'is_admin'])->group(function () {
    // Hanya admin yang bisa mengakses index()
    Route::get('mahasiswa-mata-kuliah', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'index']);

    // Admin juga bisa mengakses show()
    Route::get('mahasiswa-mata-kuliah/{id}', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'show']);
});

Route::middleware(['auth:sanctum', 'is_mahasiswa'])->group(function () {
    // Mahasiswa bisa mengakses fungsi selain index()
    Route::apiResource('mahasiswa-mata-kuliah', App\Http\Controllers\MahasiswaMataKuliahController::class)->except('index');

    // Mahasiswa juga bisa mengakses show()
    Route::get('mahasiswa-mata-kuliah/{id}', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'show']);
});
