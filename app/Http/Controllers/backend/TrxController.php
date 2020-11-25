<?php

namespace App\Http\Controllers\backend;

use App\Exports\TempEExport;
use App\Exports\TempExport_NonLengkap;
use App\Exports\TempExportSp;
use App\Exports\TempExportSp_Non_Lengkap;
use App\Http\Controllers\Controller;
use App\Imports\BarangNonLengkap;
use App\Imports\ShopeeImport;
use App\Imports\LazadaImport;
use App\models\Barang;
use App\models\BarangKey;
use App\models\temp_import;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\File;

class TrxController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function importLazada()
    {
        // cari kolom data barang
        $br=Barang::get();
        foreach ($br as  $item) {
            $kode[]=$item->kode_barang;
        }

        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'lazada'])
            ->whereIn('skuindex',$kode)
            ->get();
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.import_lazada',$sed);
    }
    public function actimportlazada(Request $request)
    {
        if($request->hasFile('file')){
            $import=Excel::import(new LazadaImport(), request()->file('file'));
            if($import){
                return redirect()->route('im.lazada', ['status' => 'Data Berhasil Diimport']);
            }else{
                return redirect()->route('im.lazada', ['status' => 'Data Gagal Diimport']);
            }
        }
    }
    public function datalazada($pram)
    {
         // cari kolom data barang
         $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
         if($pram=="Non-Stok"){
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'lazada'])
             ->whereNotIn('skuindex',$kode)
             ->get();
         }else{
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'lazada'])
            ->get();
         }

         $sed=[
             'data'=>$data,
         ];
         return view('backend.import_barang.data_lazada',$sed);
    }
    public function exportNonStok($pram)
    {
        if ($pram=="Non-Stok") {
            $namafile = "Data_Barang_Lazada_non-stok.xls";
            return Excel::download(new TempEExport(), $namafile);
        }else{
            $namafile = "Data_Barang_Lazada_non-Lengkap.xls";
            return Excel::download(new TempExport_NonLengkap(), $namafile);
        }
    }
    public function acclazada(Request $request)
    {
        $ids=$request->ids;
        $arr=explode(',',$ids);
        // for($i=0;$i<count($arr);$i++){
        // $select=temp_import::whereIn('id',$arr)->select(array('noresi','sku','skuindex','barang','tgl','jumlah','harga','total','admin'));
        // // }
        // // insert to trx
        // $in=DB::table('barang_trx')->insertUsing(['noresi','sku','skuindex','barang','tgl','jumlah','harga','total','admin'],$select);
        // // update stts kirim

        for($i=0;$i<count($arr);$i++){
            // get data barang_temp
            $dtr=temp_import::where('id',$arr[$i])->first();
            $data[]=[
                'noresi'=>$dtr->noresi,
                'sku'=>$dtr->sku,
                'skuindex'=>$dtr->skuindex,
                'barang'=>$dtr->barang,
                'tgl'=>$dtr->tgl,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
            ];
            // kurangi stok
            $upstk=DB::update("Update barang set stok=stok - ". $dtr->jumlah ." where kode_barang = '".$dtr->skuindex."'");
        }
        $in=DB::table('barang_trx')->insert($data);
        if($in){
            $kr=temp_import::whereIn('id',$arr)->update([
                'sts_kirim'=>'sudah'
            ]);
            // update Stok

            $print=[
                'sts'=>'1',
                'msg'=>'Berhasil Disimpan'
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Gagal Disimpan'
            ];
        }
        return response()->json($print);

    }
    // =========================================================================================================
    public function importshopee()
    {
        $br=Barang::get();
        foreach ($br as  $item) {
            $kode[]=$item->kode_barang;
        }
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'shopee'])
            ->whereIn('skuindex',$kode)
            ->get();
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.import_shopee',$sed);
    }
    public function dataShopee($jn)
    {

        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
        if($jn=="Non-Stok"){
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'shopee'])
                ->whereIn('skuindex',$kode)
                ->get();
        }else{
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'shopee'])
            ->get();
        }
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.data_shopee',$sed);
    }
    public function actimportshopee(Request $request)
    {
        if($request->hasFile('file')){
            $import=Excel::import(new ShopeeImport(), request()->file('file'));
            // delete file
            // File::delete($pathi,$nama_file);
            if($import){
                return redirect()->route('im.shopee', ['status' => 'Data Berhasil Diimport']);
            }else{
                return redirect()->route('im.shopee', ['status' => 'Data Gagal Diimport']);
            }
        }

    }
    public function exportNonStokSP($pram)
    {
        if ($pram=="Non-Stok") {
            $namafile = "Data_Barang_Shopee_non-stok.xls";
            return Excel::download(new TempExportSp(), $namafile);
        }else{
            $namafile = "Data_Barang_Shopee_non-Lengkap.xls";
            return Excel::download(new TempExportSp_Non_Lengkap(), $namafile);
        }
    }


    // barang non lengkap====================================================================================
    public function NonLengkap()
    {
        // $data=BarangKey::join('temp_import','barangkey.skuinduk','=');
        // $tgl=date('Y-m-d');
        $br=BarangKey::get();
         foreach ($br as  $item) {
             $barkey[]=$item->key_barang;
             $sku[]=$item->sku;
             $skuinduk[]=$item->skuinduk;
         }
        //  cek apa ada di stok
        $cst=Barang::get();
        foreach ($cst as $key => $value) {
            $kbar[]=$value->kode_barang;
        }
        $data=temp_import::
            // leftjoin('barangkey','barangkey.key_barang','=','temp_import.barang')
            // ->select(DB::raw('barangkey.kode_barang,temp_import.*'))
            whereIn('barang',$barkey)
            // ->whereIn('barangkey.kode_barang',$kbar)
            // ->whereIn('temp_import.skuindex',$skuinduk)
            // ->whereIn('temp_import.sku',$sku)
            ->where('sts_valid','belum')
            ->get();
        $print=[
            'data'=>$data,
            'judul'=>'Barang Telah Diperbaiki'
        ];
        return view('backend.import_barang.import_nonlengkap',$print);
    }
    public function importNonLengkap(Request $request)
    {
        if($request->hasFile('file')){
            $import=Excel::import(new BarangNonLengkap(), request()->file('file'));
            if($import){
                return redirect()->route('brgnonlengkap', ['status' => 'Data Berhasil Diimport']);
            }else{
                return redirect()->route('brgnonlengkap', ['status' => 'Data Gagal Diimport']);
            }
        }
    }
    public function NonLengkapNonStok()
    {
        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
        $data=BarangKey::
            whereNotIn('kode_barang',$kode)
            ->get();
        $print=[
            'data'=>$data,
            'judul'=>'Barang Telah Diperbaiki NON STOK'
        ];
        return view('backend.import_barang.import_nonlengkap',$print);
    }
    public function accNonlengkap(Request $request)
    {
        $ids=$request->ids;
        $arr=explode(',',$ids);

        for($i=0;$i<count($arr);$i++){

            // get data barang_temp
            $dtr=temp_import::where('id',$arr[$i])->first();
            // get barang key
            $bkey=BarangKey::where([
                // 'sku'=>$dtr->sku,
                // 'skuinduk'=>$dtr->skuindex,
                'key_barang'=>$dtr->barang,
                ])
                ->first();
            // dd($bkey->kode_barang);
            $data[]=[
                'noresi'=>$dtr->noresi,
                'sku'=>$dtr->sku,
                'skuindex'=>$dtr->skuindex,
                'barang'=>$dtr->barang,
                'tgl'=>$dtr->tgl,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
            ];
            // kurangi stok
            $upstk=DB::update("Update barang set stok=stok - ". $dtr->jumlah ." where kode_barang = '". $bkey->kode_barang ."'");
        }
        $in=DB::table('barang_trx')->insert($data);
        if($in){
            $kr=temp_import::whereIn('id',$arr)->update([
                'sts_kirim'=>'sudah',
                'sts_valid'=>'valid'
            ]);
            // update Stok

            $print=[
                'sts'=>'1',
                'msg'=>'Berhasil Disimpan'
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Gagal Disimpan'
            ];
        }
        return response()->json($print);
    }

    // Laporan TRX
    public function LaporanTrx()
    {
        $data=DB::table('barang_trx')->paginate(20);
        $print=[
            'data'=>$data
        ];
        return view('backend.import_barang.laporantrx',$data);
    }

}
