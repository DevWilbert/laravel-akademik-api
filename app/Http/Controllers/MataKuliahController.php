<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use App\Models\Dosen;
use Illuminate\Http\Request;

class MataKuliahController extends Controller
{
    public function index()
    {
        $matakuliah = MataKuliah::with('dosen')->get();

        return response()->json($matakuliah);
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'kode_matakuliah' => 'required|unique:mata_kuliah,kode_matakuliah',
                'nama'            => 'required|string',
                'sks'             => 'required|integer|min:1|max:20',
                'semester'        => 'required|integer|min:1|max:14',
                'dosen_id'        => 'nullable|exists:dosen,id',
            ]);

            $matakuliah = MataKuliah::create([
                'kode_matakuliah' => $request->kode_matakuliah,
                'nama'            => $request->nama,
                'sks'             => $request->sks,
                'semester'        => $request->semester,
                'dosen_id'        => $request->dosen_id,
            ]);

            return response()->json([
                'message'     => 'Data mata kuliah berhasil ditambahkan',
                'matakuliah'  => $matakuliah->fresh('dosen')
            ], 201);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors'  => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error'   => $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        $matakuliah = MataKuliah::with('dosen')->find($id);

        if (!$matakuliah) {
            return response()->json([
                'message' => 'Mata kuliah tidak ditemukan'
            ], 404);
        }

        return response()->json($matakuliah);
    }

    public function update(Request $request, $id)
    {
        try {
            $matakuliah = MataKuliah::find($id);

            if (!$matakuliah) {
                return response()->json([
                    'message' => 'Mata kuliah tidak ditemukan'
                ], 404);
            }

            $request->validate([
                'kode_matakuliah' => 'required|unique:mata_kuliah,kode_matakuliah,' . $id,
                'nama'            => 'required|string',
                'sks'             => 'required|integer|min:1|max:20',
                'semester'        => 'required|integer|min:1|max:14',
                'dosen_id'        => 'nullable|exists:dosen,id',
            ]);

            $matakuliah->update([
                'kode_matakuliah' => $request->kode_matakuliah,
                'nama'            => $request->nama,
                'sks'             => $request->sks,
                'semester'        => $request->semester,
                'dosen_id'        => $request->dosen_id,
            ]);

            return response()->json([
                'message'    => 'Data mata kuliah berhasil diupdate',
                'matakuliah' => $matakuliah->fresh('dosen')
            ]);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors'  => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error'   => $e->getMessage()
            ], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $matakuliah = MataKuliah::find($id);

            if (!$matakuliah) {
                return response()->json([
                    'message' => 'Mata kuliah tidak ditemukan'
                ], 404);
            }

            $matakuliah->delete();

            return response()->json([
                'message' => 'Data mata kuliah berhasil dihapus'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error'   => $e->getMessage()
            ], 500);
        }
    }
}
