<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Imports\ShopeeImport;
use App\models\Barang;
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
        
    }
    public function importshopee()
    {
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid'])->get();
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
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid'])->whereIn('sku')->get();
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
    public function importToped()
    {
        
    }
}
