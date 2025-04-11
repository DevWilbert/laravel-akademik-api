<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mahasiswa;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class MahasiswaController extends Controller
{

    public function index()
    {
        $data = Mahasiswa::with('user')->get();
        return response()->json($data);
    }


    public function store(Request $request)
    {
        try {
            $request->validate([
                'nama' => 'required|string',
                'email' => 'required|email|unique:users,email',
                'nim' => 'required|unique:mahasiswa,nim',
                'alamat' => 'nullable|string',
                'no_hp' => 'nullable|string',
            ]);

            $plainPassword = Str::random(8);

            $user = User::create([
                'name' => $request->nama,
                'email' => $request->email,
                'password' => Hash::make($plainPassword),
                'plain_password' => $plainPassword,
                'role' => 'mahasiswa',
            ]);

            $mahasiswa = Mahasiswa::create([
                'nama' => $request->nama,
                'user_id' => $user->id,
                'nim' => $request->nim,
                'alamat' => $request->alamat,
                'no_hp' => $request->no_hp,
            ]);

            return response()->json([
                'message' => 'Data mahasiswa ditambahkan',
                'mahasiswa' => $mahasiswa->fresh('user')
            ], 201);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function show(int $id)
    {
        $mahasiswa = Mahasiswa::with('user')->find($id);
    
        if (!$mahasiswa) {
            return response()->json([
                'message' => 'Mahasiswa tidak ditemukan'
            ], 404);
        }
    
        return response()->json($mahasiswa);
    }

    public function update(Request $request, int $id)
    {
        try {
            $mahasiswa = Mahasiswa::find($id);
    
            if (!$mahasiswa) {
                return response()->json([
                    'message' => 'Mahasiswa tidak ditemukan'
                ], 404);
            }
    
            $request->validate([
                'nama' => 'required|string',
                'email' => 'required|email|unique:users,email,' . $mahasiswa->user_id,
                'nim' => 'required|unique:mahasiswa,nim,' . $id,
                'alamat' => 'nullable|string',
                'no_hp' => 'nullable|string',
            ]);
    
            // Update user
            $user = $mahasiswa->user;
            $user->update([
                'name' => $request->nama,
                'email' => $request->email,
            ]);
    
            // Update mahasiswa
            $mahasiswa->update([
                'nama' => $request->nama,
                'nim' => $request->nim,
                'alamat' => $request->alamat,
                'no_hp' => $request->no_hp,
            ]);
    
            return response()->json([
                'message' => 'Data mahasiswa berhasil diupdate',
                'mahasiswa' => $mahasiswa->fresh('user')
            ]);
    
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    

    public function destroy($id)
    {
        try {
            $mahasiswa = Mahasiswa::find($id);
    
            if (!$mahasiswa) {
                return response()->json([
                    'message' => 'Mahasiswa tidak ditemukan'
                ], 404);
            }
    
            // Hapus user terkait juga
            $user = $mahasiswa->user;
            $mahasiswa->delete();
            if ($user) $user->delete();
    
            return response()->json([
                'message' => 'Data mahasiswa berhasil dihapus'
            ]);
    
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
}
