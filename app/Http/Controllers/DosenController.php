<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dosen;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DosenController extends Controller
{
    public function index()
    {
        $data = Dosen::with('user')->get();
        return response()->json($data);
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'nama' => 'required|string',
                'email' => 'required|email|unique:users,email',
                'nidn' => 'required|unique:dosen,nidn',
                'alamat' => 'nullable|string',
                'no_hp' => 'nullable|string',
            ]);

            $plainPassword = Str::random(8);

            $user = User::create([
                'name' => $request->nama,
                'email' => $request->email,
                'password' => Hash::make($plainPassword),
                'plain_password' => $plainPassword,
                'role' => 'dosen',
            ]);

            $dosen = Dosen::create([
                'nama' => $request->nama,
                'user_id' => $user->id,
                'nidn' => $request->nidn,
                'alamat' => $request->alamat,
                'no_hp' => $request->no_hp,
            ]);

            return response()->json([
                'message' => 'Data dosen ditambahkan',
                'dosen' => $dosen->fresh('user')
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
        $dosen = Dosen::with('user')->find($id);

        if (!$dosen) {
            return response()->json([
                'message' => 'Dosen tidak ditemukan'
            ], 404);
        }

        return response()->json($dosen);
    }

    public function update(Request $request, int $id)
    {
        try {
            $dosen = Dosen::find($id);

            if (!$dosen) {
                return response()->json([
                    'message' => 'Dosen tidak ditemukan'
                ], 404);
            }

            $request->validate([
                'nama' => 'required|string',
                'email' => 'required|email|unique:users,email,' . $dosen->user_id,
                'nidn' => 'required|unique:dosen,nidn,' . $id,
                'alamat' => 'nullable|string',
                'no_hp' => 'nullable|string',
            ]);

            $user = $dosen->user;
            $user->update([
                'name' => $request->nama,
                'email' => $request->email,
            ]);

            $dosen->update([
                'nama' => $request->nama,
                'nidn' => $request->nidn,
                'alamat' => $request->alamat,
                'no_hp' => $request->no_hp,
            ]);

            return response()->json([
                'message' => 'Data dosen berhasil diupdate',
                'dosen' => $dosen->fresh('user')
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
            $dosen = Dosen::find($id);

            if (!$dosen) {
                return response()->json([
                    'message' => 'Dosen tidak ditemukan'
                ], 404);
            }

            $user = $dosen->user;
            $dosen->delete();
            if ($user) $user->delete();

            return response()->json([
                'message' => 'Data dosen berhasil dihapus'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}