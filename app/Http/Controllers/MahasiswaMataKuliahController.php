<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mahasiswa;

use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class MahasiswaMataKuliahController extends Controller
{
    public function index()
    {

        $mahasiswa = Mahasiswa::with('mataKuliah.dosen')->get();

        // Format hasil sesuai dengan yang diinginkan
        $result = $mahasiswa->map(function ($mhs) {
            return [
                'id_mahasiswa' => $mhs->id,
                'nama_mahasiswa' => $mhs->nama,
                'mata_kuliah' => $mhs->mataKuliah->map(function ($mk) {
                    return [
                        'id_mata_kuliah' => $mk->id,
                        'kode_mk' => $mk->kode_matakuliah,
                        'nama_mk' => $mk->nama,
                        'dosen' => $mk->dosen->nama ?? 'Tidak ada dosen', // Jika dosen tidak ada
                    ];
                })
            ];
        });

        // Return the formatted result
        return response()->json($result);
    }

    public function store(Request $request)
    {
        try {
            // Validasi input mahasiswa dan mata kuliah
            $validated = $request->validate([
                'mahasiswa_id' => 'required|exists:mahasiswa,id',
                'mata_kuliah_ids' => 'required|array',
                'mata_kuliah_ids.*' => 'exists:mata_kuliah,id',
            ]);

            // Ambil mahasiswa berdasarkan ID
            $mahasiswa = Mahasiswa::findOrFail($validated['mahasiswa_id']);

            // Menambahkan mata kuliah baru tanpa menghapus yang lama
            $mahasiswa->mataKuliah()->sync($validated['mata_kuliah_ids'], false);

            return response()->json([
                'message' => 'Mata kuliah berhasil ditambahkan untuk mahasiswa',
                'mahasiswa' => $mahasiswa->load('mataKuliah.dosen'),
            ], 200);
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan saat menambahkan mata kuliah',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function show($id)
    {
        try {
            $mahasiswa = Mahasiswa::with('mataKuliah.dosen')->findOrFail($id);

            $result = [
                'id_mahasiswa' => $mahasiswa->id,
                'nama_mahasiswa' => $mahasiswa->nama,
                'mata_kuliah' => $mahasiswa->mataKuliah->map(function ($mk) {
                    return [
                        'id_mata_kuliah' => $mk->id,
                        'kode_mk' => $mk->kode_matakuliah,
                        'nama_mk' => $mk->nama,
                        'dosen' => $mk->dosen->nama ?? 'Tidak ada dosen',
                    ];
                }),
            ];

            return response()->json($result, 200);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Data mahasiswa tidak ditemukan.',
                'error' => $e->getMessage()
            ], 404);
        }
    }


    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'mata_kuliah_ids' => 'required|array',
                'mata_kuliah_ids.*' => 'exists:mata_kuliah,id',
            ]);

            $mahasiswa = Mahasiswa::findOrFail($id);

            // Sinkronisasi relasi mata kuliah
            $mahasiswa->mataKuliah()->sync($request->mata_kuliah_ids);

            return response()->json([
                'message' => 'Relasi mata kuliah berhasil diperbarui.',
                'mahasiswa' => $mahasiswa->load('mataKuliah.dosen')
            ], 200);

        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal.',
                'errors' => $e->errors()
            ], 422);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan.',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function destroy(Request $request, $id)
    {
        try {
            $request->validate([
                'mata_kuliah_id' => 'required|exists:mata_kuliah,id',
            ]);

            $mahasiswa = Mahasiswa::findOrFail($id);

            // Hapus relasi dengan mata kuliah tertentu
            $mahasiswa->mataKuliah()->detach($request->mata_kuliah_id);

            return response()->json([
                'message' => 'Mata kuliah berhasil dihapus dari mahasiswa.'
            ], 200);

        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal.',
                'errors' => $e->errors()
            ], 422);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan.',
                'error' => $e->getMessage()
            ], 500);
        }
    }


}
