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
                'password' => Hash::make($request->password),
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
                'mahasiswa' => $mahasiswa
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


    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
