<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('api-list-kirim/{id}/{user}','api@getket');
Route::get('cari-kiriman/{cari}/{user}','api@cariKiriman');
Route::post('up-kirim','api@upstat');
Route::post('up-tarik','api@uptarik');
Route::post('login','api@login');
Route::post('up-login','api@upakun');
Route::get("kiriman/{user}",'api@kiriman');
