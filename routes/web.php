<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'backend\HomeController@index')->name('home');
Route::get('/edit-profile', 'backend\HomeController@editprofile')->name('editprofile');
Route::post('/edit-profile/{id}', 'backend\HomeController@aksieditprofile');

Route::get('/data-admin','backend\AdminController@listdata');
Route::resource('/admin','backend\AdminController');

Route::get('/data-barang','backend\BarangController@listdata');
Route::post('/import-barang','backend\BarangController@importbarang');
Route::get('/export-barang','backend\BarangController@exportbarang');
Route::resource('/barang','backend\BarangController');

Route::get('/data-barang-keyword','backend\BarangKeyController@listdata');
Route::post('/import-barang-keyword','backend\BarangKeyController@importbarangkey');
Route::resource('/barang-keyword','backend\BarangKeyController');