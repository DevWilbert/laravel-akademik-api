<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    $user = $request->user();

    // Jika user adalah mahasiswa, muat relasi mahasiswa
    if ($user->role === 'mahasiswa') {
        return $user->load('mahasiswa.mataKuliah');
    }

    // Jika user adalah dosen, muat relasi dosen
    if ($user->role === 'dosen') {
        return $user->load('dosen.mataKuliah');  // Asumsikan ada relasi dosen pada model
    }

    // Kembalikan user dengan data standar jika tidak ada relasi yang ditemukan
    return $user;
})->middleware('auth:sanctum');


Route::post('/login', [App\Http\Controllers\AuthController::class, 'login']);
Route::post('/logout', [App\Http\Controllers\AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::get('matakuliah', [App\Http\Controllers\MataKuliahController::class, 'index'])->middleware('auth:sanctum');
Route::get('matakuliah/{id}', [App\Http\Controllers\MataKuliahController::class, 'show'])->middleware('auth:sanctum');

Route::middleware(['auth:sanctum', 'is_admin'])->group(function () {
    Route::apiResource('mahasiswa', App\Http\Controllers\MahasiswaController::class);
    Route::apiResource('dosen', App\Http\Controllers\DosenController::class);
    
    // Untuk admin: bisa create, update, delete matakuliah
    Route::post('matakuliah', [App\Http\Controllers\MataKuliahController::class, 'store']);
    Route::put('matakuliah/{id}', [App\Http\Controllers\MataKuliahController::class, 'update']);
    Route::delete('matakuliah/{id}', [App\Http\Controllers\MataKuliahController::class, 'destroy']);
});

Route::middleware(['auth:sanctum', 'is_admin'])->prefix('admin')->group(function () {
    Route::get('mahasiswa-mata-kuliah', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'index']);
    Route::get('mahasiswa-mata-kuliah/{id}', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'show']);
    Route::post('mahasiswa-mata-kuliah', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'store']);
    Route::delete('mahasiswa-mata-kuliah/{id}', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'destroy']);
});

Route::middleware(['auth:sanctum', 'is_mahasiswa'])->prefix('mahasiswa')->group(function () {
    Route::get('mahasiswa-mata-kuliah/{id}', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'show']);
    Route::post('mahasiswa-mata-kuliah', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'store']);
    Route::delete('mahasiswa-mata-kuliah/{id}', [App\Http\Controllers\MahasiswaMataKuliahController::class, 'destroy']);
});