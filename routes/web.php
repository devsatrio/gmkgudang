<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
Auth::routes(['register'=>false]);

// Auth::routes();

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
Route::get('/data-laporantrx','backend\TrxController@listdatalaporanTrx');
Route::prefix('import-data')->group(function(){
    Route::get('v-shopee','backend\TrxController@importshopee')->name('im.shopee');
    Route::post('import-shopee','backend\TrxController@actimportshopee')->name('importshopee');
    Route::get('data-shopee/{jns}','backend\TrxController@dataShopee')->name('sp.data');
    Route::get('export-nonstok-shopee/{jns}','backend\TrxController@exportNonStokSP')->name('exp.nostok.shopee');
    Route::post('acc-shopee','backend\TrxController@accShopee');
    // import lazada
    Route::get('v-lazada','backend\TrxController@importLazada')->name('im.lazada');
    Route::post('import-lazada','backend\TrxController@actimportlazada')->name('importlazada');
    Route::get('data-lazada/{jns}','backend\TrxController@datalazada')->name('datalazada');
    Route::post('acc-lazada','backend\TrxController@acclazada');
    // export barang non stok
    Route::get('export-nonstok-lazada/{jns}','backend\TrxController@exportNonStok')->name('exp.nostok.lazada');
    // barang Tidak lengkap
    Route::get('barang-nonlengkap','backend\TrxController@NonLengkap')->name('brgnonlengkap');
    Route::post('import-nonlengkap','backend\TrxController@importNonLengkap')->name('importnonlengkap');
    Route::get('nonlengkap-nonstok','backend\TrxController@NonLengkapNonStok')->name('nnst');
    Route::post('acc-nonlengkap','backend\TrxController@accNonlengkap');
    Route::get('export-nostoknolengkap','backend\TrxController@expnsnl')->name('exp.nsnl');
    // laporan TRX
    Route::get('list-trx','backend\TrxController@ListTrx')->name('list.trx');
    Route::get('cari-list-trx/{tgl1}/{tgl2}','backend\TrxController@cariListTrx');
    Route::get('data-trx','backend\TrxController@DataTrx')->name('data.trx');
    Route::get('cari-trx','backend\TrxController@CariTrx')->name('cari.data.trx');
    Route::post('batal-trx','backend\TrxController@batalTrx');
    Route::get('cari-noresi/{norm}','backend\TrxController@cariNoresi');
    // Scaner paket
    Route::get('sc-view','backend\TrxController@scView')->name('sc.view');
    Route::get('get-scan-data/{jns}','backend\TrxController@scData');
    Route::get('batal-scan/{noresi}','backend\TrxController@batalscData');
    Route::post('simpan-scan','backend\TrxController@scSimpan');
    Route::get('lap-scan','backend\TrxController@lapscan')->name('lap.sc');
    // hapus temp_barang
    Route::post('hapus-temp','backend\TrxController@hapusTemp')->name('del.temp');
});
Route::get('/data-barang-masuk','backend\BarangMasukController@listdata');
Route::get('/barang-masuk/laporan','backend\BarangMasukController@laporan');
Route::post('/import-barang-masuk','backend\BarangMasukController@importbarangmasuk');
Route::resource('/barang-masuk','backend\BarangMasukController');

Route::get('/data-barang-keluar','backend\BarangKeluarController@listdata');
Route::get('/barang-keluar/laporan','backend\BarangKeluarController@laporan');
Route::post('/import-barang-keluar','backend\BarangKeluarController@importbarangmasuk');
Route::resource('/barang-keluar','backend\BarangKeluarController');
