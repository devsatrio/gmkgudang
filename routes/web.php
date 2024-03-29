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

Route::get('/data-barang-masuk','backend\BarangMasukController@listdata');
Route::get('/barang-masuk/laporan','backend\BarangMasukController@laporan');
Route::post('/import-barang-masuk','backend\BarangMasukController@importbarangmasuk');
Route::resource('/barang-masuk','backend\BarangMasukController');

Route::get('/data-barang-keluar','backend\BarangKeluarController@listdata');
Route::get('/barang-keluar/laporan','backend\BarangKeluarController@laporan');
Route::post('/import-barang-keluar','backend\BarangKeluarController@importbarangmasuk');
Route::resource('/barang-keluar','backend\BarangKeluarController');

Route::get('/transaksi-manual','backend\TransaksiManualController@index');
Route::post('/transaksi-manual','backend\TransaksiManualController@store');
Route::get('/transaksi-manual/cari-detail','backend\TransaksiManualController@caridetail');
Route::get('/transaksi-manual/cari-detail-barang/{kode}','backend\TransaksiManualController@caribarang');
Route::get('/transaksi-manual/hapus-detail/{kode}','backend\TransaksiManualController@hapusdetail');
Route::post('/transaksi-manual/tambah-detail','backend\TransaksiManualController@storedetail');

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
    // import tiktok
    Route::get('v-tiktok','backend\TrxController@importtiktok')->name('im.tiktok');
    Route::post('import-tiktok','backend\TrxController@actimporttiktok')->name('importtiktok');
    Route::get('data-tiktok/{jns}','backend\TrxController@datatiktok')->name('tk.data');
    Route::get('export-nonstok-tiktok/{jns}','backend\TrxController@exportNonStokTK')->name('exp.nostok.tiktok');
    Route::post('acc-tiktok','backend\TrxController@accTiktok');
    // import tiktok2
    Route::get('v-tiktok2','backend\TrxController@importtiktok2')->name('im.tiktok2');
    Route::post('import-tiktok2','backend\TrxController@actimporttiktok2')->name('importtiktok2');
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
    Route::get('get-scan-data/{jns}/{tgl1}/{tgl2}','backend\TrxController@scData');
    Route::get('cari-scan-data/{cari}','backend\TrxController@CariscData');
    Route::get('up-scan-admin/{ids}/{adm}','backend\TrxController@upScAdmin');
    Route::get('batal-scan/{noresi}','backend\TrxController@batalscData');
    Route::get('retur-scan/{noresi}','backend\TrxController@returscData');
    Route::post('simpan-scan','backend\TrxController@scSimpan');
    Route::get('lap-scan','backend\TrxController@lapscan')->name('lap.sc');
    Route::get('cari-list-scan/{tgl1}/{tgl2}/{pil}','backend\TrxController@cariLscan')->name('clistscan');
    // Route::get('dn-list-scan/{tgl1}/{tgl2}','backend\TrxController@DnSckirim')->name('dn.sckirim');
    // acc scan
    Route::get('data-acc-scan','backend\TrxController@dataAccScan')->name('data.acc.sc');
    Route::get('data-barang-scan/{jenis}/{tgl1}/{tgl2}','backend\TrxController@dataBarangScan');
    Route::get('hitung-barang-scan/{tgl1}/{tgl2}','backend\TrxController@hitungByExp');
    Route::post('acc-scanan','backend\TrxController@accScan');
    // hapus temp_barang
    Route::post('hapus-temp','backend\TrxController@hapusTemp')->name('del.temp');
});

