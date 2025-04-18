<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IsMahasiswa
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): mixed
    {
        if ($request->user()?->role !== 'mahasiswa') {
            return response()->json(['message' => 'Hanya mahasiswa yang boleh mengakses.'], 403);
        }

        return $next($request);
    }
}
