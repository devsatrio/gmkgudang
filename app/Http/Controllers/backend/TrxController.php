<?php

namespace App\Http\Controllers\backend;

use App\Exports\TempEExport;
use App\Exports\TempExport_NonLengkap;
use App\Http\Controllers\Controller;
use App\Imports\ShopeeImport;
use App\Imports\LazadaImport;
use App\models\Barang;
use App\models\BarangKey;
use App\models\temp_import;
use Illuminate\Http\Request;
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
    // =========================================================================================================
    public function importshopee()
    {
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'shopee'])->get();
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.import_shopee',$sed);
    }
    public function spnonstok()
    {
        $dbar=Barang::get();
        foreach ($dbar as $key => $value) {
            $keyvar[]=$value->kode_barang;
        }
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'shopee'])->whereIn('sku')->get();
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.import_shopee',$sed);
    }
    public function actimportshopee(Request $request)
    {
        // $pathi=public_path('data_excel/');
        // $this->validate($request,[
        //     'file'=>'required|mimes:csv,xls,xlsx'
        // ]);

            // $file=$request->file('file');
            // $nama_file=$file->hashName().date('Y-m-d H:i:s');
            // $path=$file->storeAs($pathi,$nama_file);
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
    // barang non lengkap====================================================================================
    public function NonLengkap()
    {
        $data=BarangKey::join('temp_import','barangkey.skuinduk','=')
    }

}
