<?php

namespace App\Http\Controllers\backend;

use App\Exports\exportNonStokLengkap;
use App\Exports\exportScan;
use App\Exports\TempEExport;
use App\Exports\TempExport_NonLengkap;
use App\Exports\TempExportSp;
use App\Exports\TempExportSp_Non_Lengkap;
use App\Http\Controllers\Controller;
use App\Imports\BarangNonLengkap;
use App\Imports\ShopeeImport;
use App\Imports\LazadaImport;
use App\Imports\TiktokImport;
use App\Imports\TiktokImport2;
use App\models\Barang;
use App\models\barang_trx;
use App\models\BarangKey;
use App\models\model_barang_scan;
use App\models\temp_import;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\File;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables as FacadesDataTables;

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
                return redirect()->route('im.lazada')->with('status','Data Berhasil DiImport');
            }else{
                return redirect()->route('im.lazada')->with('status','Data Gagal DiImport');
            }
        }
    }
    public function datalazada($jn)
    {
        //  // cari kolom data barang
        //  $br=Barang::get();
        //  foreach ($br as  $item) {
        //      $kode[]=$item->kode_barang;
        //  }
        //  if($pram=="Non-Stok"){
        //     $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'lazada'])
        //      ->whereNotIn('skuindex',$kode)
        //      ->get();
        //  }else{
        //     $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'lazada'])
        //     ->get();
        //  }

        //  $sed=[
        //      'data'=>$data,
        //  ];
        $sku=[];
        $skuindex=[];
        $bar=[];
        $varian=[];
        $admin=Auth::user()->name;
        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
        if($jn=="Sudah-Lengkap"){
            $keb=BarangKey::get();
            foreach ($keb as $key => $val) {
                $sku[]=$val->sku;
                $skuindex[]=$val->skuindex;
                $bar[]=$val->barang;
                $varian[]=$val->varian;
            }
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'lazada'])
                // ->whereIn('varian',$varian)
                // ->orWhereIn('barang',$bar)
                ->whereExists(function($query){
                    $query->select(DB::raw(1))
                    ->from('barangkey')
                    ->whereColumn('barangkey.varian','temp_import.varian')
                    ->whereColumn('barangkey.key_barang','temp_import.barang');
                })
                ->where('admin',$admin)
                ->get();
            // $ktg="Lengkap";
        }else{
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'lazada'])
            ->whereNotExists(function($query){
                $query->select(DB::raw(1))
                ->from('barangkey')
                ->whereColumn('barangkey.varian','temp_import.varian')
                ->whereColumn('barangkey.key_barang','temp_import.barang');
            })
            ->where('admin',$admin)
            ->get();
            // $$ktg="NonLengkap";
        }
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
            'jn'=>$jn,
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
        $tglk=date('Y-m-d');
        // // update stts kirim

        for($i=0;$i<count($arr);$i++){
            // get data barang_temp
            $dtr=temp_import::where('id',$arr[$i])->first();
            // get barang key
            $bkey=BarangKey::where([
                // 'sku'=>$dtr->sku,
                // 'skuinduk'=>$dtr->skuindex,
                'varian'=>$dtr->varian,
                'key_barang'=>$dtr->barang,
                ])
                ->first();

            $data[]=[
                'noresi'=>$dtr->noresi,
                'nopesan'=>$dtr->nopesan,
                'kurir'=>$dtr->kurir,
                'varian'=>$dtr->varian,
                'sku'=>$dtr->sku,
                'skuindex'=>$bkey->kode_barang,
                'barang'=>$dtr->barang,
                'tgl'=>$tglk,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
                'jenis'=>$dtr->jenis,
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
        $sku=[];
        $skuindex=[];
        $bar=[];
        $varian=[];
        $admin=Auth::user()->name;
        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
        if($jn=="Sudah-Lengkap"){
            $keb=BarangKey::get();
            foreach ($keb as $key => $val) {
                $sku[]=$val->sku;
                $skuindex[]=$val->skuindex;
                $bar[]=$val->barang;
                $varian[]=$val->varian;
            }
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'shopee'])
                // ->whereIn('varian',$varian)
                // ->orWhereIn('barang',$bar)
                ->whereExists(function($query){
                    $query->select(DB::raw(1))
                    ->from('barangkey')
                    ->whereColumn('barangkey.varian','temp_import.varian')
                    ->whereColumn('barangkey.key_barang','temp_import.barang');
                })
                ->where('admin',$admin)
                ->get();
            // $ktg="Lengkap";
        }else{
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'shopee'])
            ->whereNotExists(function($query){
                $query->select(DB::raw(1))
                ->from('barangkey')
                ->whereColumn('barangkey.varian','temp_import.varian')
                ->whereColumn('barangkey.key_barang','temp_import.barang');
            })
            ->where('admin',$admin)
            ->get();
            // $$ktg="NonLengkap";
        }
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
            'jn'=>$jn,
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
                return redirect()->route('im.shopee')->with('status','Data Berhasil DiImport');
            }else{
                return redirect()->route('im.shopee')->with('status','Data Gagal DiImport');
            }
        }

    }
    public function accShopee(Request $request)
    {
        $jns=$request->jns;
        $ids=$request->ids;
        $arr=explode(',',$ids);
        $tglk=date('Y-m-d');

        if($jns=="fix"){
            // // update stts kirim

            for($i=0;$i<count($arr);$i++){
                // get data barang_temp
                $dtr=temp_import::where('id',$arr[$i])->first();
               // get barang key
            $bkey=BarangKey::where([
                // 'sku'=>$dtr->sku,
                // 'skuinduk'=>$dtr->skuindex,
                'varian'=>$dtr->varian,
                'key_barang'=>$dtr->barang,
                ])
                ->first();

            $data[]=[
                'noresi'=>$dtr->noresi,
                'nopesan'=>$dtr->nopesan,
                'kurir'=>$dtr->kurir,
                'varian'=>$dtr->varian,
                'sku'=>$dtr->sku,
                'skuindex'=>$bkey->kode_barang,
                'barang'=>$dtr->barang,
                'tgl'=>$tglk,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
                'jenis'=>$dtr->jenis,
            ];
            // kurangi stok
            $upstk=DB::update("Update barang set stok=stok - ". $dtr->jumlah ." where kode_barang = '". $bkey->kode_barang ."'");
            }
            //  validasi cek sudah input

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
        }elseif($jns=="keyword"){

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
                    'nopesan'=>$dtr->nopesan,
                    'kurir'=>$dtr->kurir,
                    'varian'=>$dtr->varian,
                    'sku'=>$dtr->sku,
                    'skuindex'=>$bkey->kode_barang,
                    'barang'=>$dtr->barang,
                    'tgl'=>$tglk,
                    'jumlah'=>$dtr->jumlah,
                    'harga'=>$dtr->harga,
                    'total'=>$dtr->total,
                    'admin'=>$dtr->admin,
                    'jenis'=>$dtr->jenis,
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
    // ======================= Tiktok ==================================================================================
    public function importtiktok()
    {
        $br=Barang::get();
        foreach ($br as  $item) {
            $kode[]=$item->kode_barang;
        }
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'tiktok'])
            ->whereIn('skuindex',$kode)
            ->get();
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.import_tiktok',$sed);
    }
    public function importtiktok2()
    {
        $br=Barang::get();
        foreach ($br as  $item) {
            $kode[]=$item->kode_barang;
        }
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'tiktok'])
            ->whereIn('skuindex',$kode)
            ->get();
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
        ];
        return view('backend.import_barang.import_tiktok_2',$sed);
    }
    public function datatiktok($jn)
    {
        $sku=[];
        $skuindex=[];
        $bar=[];
        $varian=[];
        $admin=Auth::user()->name;
        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
        if($jn=="Sudah-Lengkap"){
            $keb=BarangKey::get();
            foreach ($keb as $key => $val) {
                $sku[]=$val->sku;
                $skuindex[]=$val->skuindex;
                $bar[]=$val->barang;
                $varian[]=$val->varian;
            }
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'tiktok'])
                // ->whereIn('varian',$varian)
                // ->orWhereIn('barang',$bar)
                ->whereExists(function($query){
                    $query->select(DB::raw(1))
                    ->from('barangkey')
                    ->whereColumn('barangkey.varian','temp_import.varian')
                    ->whereColumn('barangkey.key_barang','temp_import.barang');
                })
                ->where('admin',$admin)
                ->get();
            // $ktg="Lengkap";
        }else{
            $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'tiktok'])
            ->whereNotExists(function($query){
                $query->select(DB::raw(1))
                ->from('barangkey')
                ->whereColumn('barangkey.varian','temp_import.varian')
                ->whereColumn('barangkey.key_barang','temp_import.barang');
            })
            ->where('admin',$admin)
            ->get();
            // $$ktg="NonLengkap";
        }
        $sed=[
            'data'=>$data,
            'desk'=>'Barang Sudah Fix',
            'jn'=>$jn,
        ];
        return view('backend.import_barang.data_tiktok',$sed);
    }
    public function actimporttiktok(Request $request)
    {
        if($request->hasFile('file')){
            $import=Excel::import(new TiktokImport(), request()->file('file'));
            // delete file
            // File::delete($pathi,$nama_file);
            if($import){
                return redirect()->route('im.tiktok')->with('status','Data Berhasil DiImport');
            }else{
                return redirect()->route('im.tiktok')->with('status','Data Gagal DiImport');
            }
        }

    }
    public function actimporttiktok2(Request $request)
    {
        if($request->hasFile('file')){
            $import=Excel::import(new TiktokImport2(), request()->file('file'));
            // delete file
            // File::delete($pathi,$nama_file);
            if($import){
                return redirect()->route('im.tiktok2')->with('status','Data Berhasil DiImport');
            }else{
                return redirect()->route('im.tiktok2')->with('status','Data Gagal DiImport');
            }
        }

    }
    public function acctiktok(Request $request)
    {
        $jns=$request->jns;
        $ids=$request->ids;
        $arr=explode(',',$ids);
        $tglk=date('Y-m-d');

        if($jns=="fix"){
            // // update stts kirim

            for($i=0;$i<count($arr);$i++){
                // get data barang_temp
                $dtr=temp_import::where('id',$arr[$i])->first();
               // get barang key
            $bkey=BarangKey::where([
                // 'sku'=>$dtr->sku,
                // 'skuinduk'=>$dtr->skuindex,
                'varian'=>$dtr->varian,
                'key_barang'=>$dtr->barang,
                ])
                ->first();

            $data[]=[
                'noresi'=>$dtr->noresi,
                'nopesan'=>$dtr->nopesan,
                'kurir'=>$dtr->kurir,
                'varian'=>$dtr->varian,
                'sku'=>$dtr->sku,
                'skuindex'=>$bkey->kode_barang,
                'barang'=>$dtr->barang,
                'tgl'=>$tglk,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
                'jenis'=>$dtr->jenis,
            ];
            // kurangi stok
            $upstk=DB::update("Update barang set stok=stok - ". $dtr->jumlah ." where kode_barang = '". $bkey->kode_barang ."'");
            }
            //  validasi cek sudah input

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
        }elseif($jns=="keyword"){

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
                    'nopesan'=>$dtr->nopesan,
                    'kurir'=>$dtr->kurir,
                    'varian'=>$dtr->varian,
                    'sku'=>$dtr->sku,
                    'skuindex'=>$bkey->kode_barang,
                    'barang'=>$dtr->barang,
                    'tgl'=>$tglk,
                    'jumlah'=>$dtr->jumlah,
                    'harga'=>$dtr->harga,
                    'total'=>$dtr->total,
                    'admin'=>$dtr->admin,
                    'jenis'=>$dtr->jenis,
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
    }
    public function exportNonStokTK($pram)
    {
        if ($pram=="Non-Stok") {
            $namafile = "Data_Barang_Tiktok_non-stok.xls";
            return Excel::download(new TempExportSp(), $namafile);
        }else{
            $namafile = "Data_Barang_Tiktok_non-Lengkap.xls";
            return Excel::download(new TempExportSp_Non_Lengkap(), $namafile);
        }
    }


    // barang non lengkap====================================================================================
    public function NonLengkap()
    {
        // $data=BarangKey::join('temp_import','barangkey.skuinduk','=');
        // $tgl=date('Y-m-d');
        $admin=Auth::user()->name;
        $sku=[];
        $skuindex=[];
        $barkey=[];
        $varian=[];
        $br=BarangKey::get();
         foreach ($br as  $item) {
             $barkey[]=$item->key_barang;
             $sku[]=$item->sku;
             $skuinduk[]=$item->skuinduk;
             $varian[]=$item->varian;
         }
        //  cek apa ada di stok
        $cst=Barang::get();
        foreach ($cst as $key => $value) {
            $kbar[]=$value->kode_barang;
        }
        if($admin=="Super Admin"){
            $data=temp_import::
            // leftjoin('barangkey','barangkey.key_barang','=','temp_import.barang')
            // ->select(DB::raw('barangkey.kode_barang,temp_import.*'))
            // whereIn('barang',$barkey)
            // ->orWhereIn('varian',$varian)
            // ->whereIn('barangkey.kode_barang',$kbar)
            whereExists(function($query){
                $query->select(DB::raw('temp_import.*'))
                ->from('barangkey')
                ->whereColumn('barangkey.varian','temp_import.varian')
                ->whereColumn('barangkey.key_barang','temp_import.barang');
            })
            // ->whereIn('temp_import.skuindex',$skuinduk)
            // ->whereIn('temp_import.sku',$sku)
            ->where('sts_valid','belum')
            // ->where('admin',$admin)
            ->get();
        }else{
            $data=temp_import::
            // leftjoin('barangkey','barangkey.key_barang','=','temp_import.barang')
            // ->select(DB::raw('barangkey.kode_barang,temp_import.*'))
            // whereIn('barang',$barkey)
            // ->orWhereIn('varian',$varian)
            whereExists(function($query){
                $query->select(DB::raw(1))
                ->from('barangkey')
                ->whereColumn('barangkey.varian','temp_import.varian')
                ->whereColumn('barangkey.key_barang','temp_import.barang');
            })
            // ->whereIn('barangkey.kode_barang',$kbar)
            // ->whereIn('temp_import.skuindex',$skuinduk)
            // ->whereIn('temp_import.sku',$sku)
            ->where('sts_valid','belum')
            ->where('admin',$admin)
            ->get();
        }

        $print=[
            'data'=>$data,
            'judul'=>'Barang Telah Diperbaiki',
            'jns'=>'fix',
        ];
        return view('backend.import_barang.import_nonlengkap',$print);
    }
    public function importNonLengkap(Request $request)
    {
        if($request->hasFile('file')){
            $import=Excel::import(new BarangNonLengkap(), request()->file('file'));
            if($import){
                return redirect()->route('brgnonlengkap')->with('status','Data Berhasil DiImport');;
            }else{
                return redirect()->route('brgnonlengkap')->with('status','Data Gagal DiImport');;
            }
        }
    }
    public function NonLengkapNonStok()
    {
        $admin=Auth::user()->name;
        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
        //  dd($kode);
        $data=BarangKey::
            // leftjoin('temp_import','temp_import.barang','=',"barangkey.key_barang")
            // leftjoin('temp_import',function($join){
            //     $join->on('temp_import.barang','=',"barangkey.key_barang")
            //         ->where('temp_import.varian','=','barangkey.varian');
            // })
            // // ->leftjoin('temp_import','temp_import.varian','=',"barangkey.varian")
            // ->select(DB::raw('temp_import.barang,temp_import.varian,temp_import.admin,barangkey.*'))
            // ->where('temp_import.admin',$admin)
            whereNotIn('kode_barang',$kode)
            ->get();
            // dd($data);
        $print=[
            'data'=>$data,
            'judul'=>'Barang Telah Diperbaiki NON STOK',
            'jns'=>'nostok',
        ];
        // dd($data);
        return view('backend.import_barang.import_nonlengkap',$print);
    }
    public function accNonlengkap(Request $request)
    {
        $ids=$request->ids;
        $arr=explode(',',$ids);

        $tglk=date('Y-m-d');
        for($i=0;$i<count($arr);$i++){
            // get data barang_temp
            $dtr=temp_import::where('id',$arr[$i])->first();
            // get barang key
            $bkey=BarangKey::where([
                // 'sku'=>$dtr->sku,
                // 'skuinduk'=>$dtr->skuindex,
                'varian'=>$dtr->varian,
                'key_barang'=>$dtr->barang,
                ])
                ->first();

            $data[]=[
                'noresi'=>$dtr->noresi,
                'nopesan'=>$dtr->nopesan,
                'kurir'=>$dtr->kurir,
                'varian'=>$dtr->varian,
                'sku'=>$dtr->sku,
                'skuindex'=>$bkey->kode_barang,
                'barang'=>$dtr->barang,
                'tgl'=>$tglk,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
                'jenis'=>$dtr->jenis,
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
    public function expnsnl()
    {
        $namafile = "Data_Barang_non-stok.xls";
        return Excel::download(new exportNonStokLengkap(), $namafile);
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
    public function DataTrx()
    {
        $tgl=date('Y-m-d');
        // $data=barang_trx::where('tgl',$tgl)->get();a
        $dataus=User::select(DB::raw('name'))->whereNotIn('id',['1','8'])->get();
        $data=User::select(DB::raw('name'))->whereNotIn('id',['1','8'])->get();
        $print=[
            'user'=>$dataus,
            'data'=>$data,
            'tgl1'=>$tgl,
            'tgl2'=>$tgl,
        ];
        return view('backend.import_barang.data_trx',$print);
    }
    public function CariTrx(Request $request)
    {
        $tgl1=$request->tgl1;
        $tgl2=$request->tgl2;
        $adm=$request->admin;
        $dataus=User::select(DB::raw('name'))->whereNotIn('id',['1','8'])->get();
        if ($adm=='all') {
            $data=User::select(DB::raw('name'))->whereNotIn('id',['1','8'])->get();
        }else{
            $data=User::select(DB::raw('name'))->where('name',$adm)->whereNotIn('id',['1','8'])->get();
        }
        $print=[
            'data'=>$data,
            'tgl1'=>$tgl1,
            'tgl2'=>$tgl2,
            'user'=>$dataus,
        ];
        return view('backend.import_barang.data_trx',$print);
    }

    //=================================================================
    public function listdatalaporanTrx(){
        return Datatables::of(DB::table('barang_trx')->get())->make(true);
    }
    // List Transaksi
    public function ListTrx()
    {
    $data=[];
    $print=[
        'data'=>$data,
    ];
     return view('backend.import_barang.laporantrx',$print);
    }
    public function cariListTrx($tgl1,$tgl2)
    {
        $data=barang_trx::whereBetween('tgl',[$tgl1,$tgl2])->where('stts','!=','batal')->get();
        $print=[
            'data'=>$data,
        ];
        return view('backend.import_barang.data_laporantrx',$print);
    }

    public function cariNoresi($norm)
    {
        $data=barang_trx::where('noresi','like','%'. $norm  .'%')->where('stts','!=','batal')->get();
        $print=[
            'data'=>$data,
        ];
        return view('backend.import_barang.data_laporantrx',$print);
    }
    public function batalTrx(Request $request)
    {
        $ids=$request->ids;
        $arr=explode(',',$ids);
        for($i=0;$i<count($arr);$i++){
            // get data barang_temp
            $dtr=barang_trx::where('id',$arr[$i])->first();
               $kd=$dtr->skuindex;
               $jum=$dtr->jumlah;
            // update
            barang_trx::where('id',$arr[$i])->update([
                'stts'=>'batal'
            ]);
            // tambah stok
            $upstk=DB::update("Update barang set stok=stok + ". $jum ." where kode_barang = '". $kd ."'");
            if($upstk){

                $print=[
                    'sts'=>'1',
                    'msg'=>'Data Berhasil Disimpan'
                ];
            }else{
                $print=[
                    'sts'=>'0',
                    'msg'=>'Data Gagal Disimpan'
                ];
            }
            return response()->json($print);
        }
    }
    // Scan Barang=====================================================================================================
    public function scView()
    {
        $data=[];
        $print=[
            'data'=>$data,
        ];
        return view('backend.import_barang.scan',$print);
    }
    public function scData($jn,$tg1,$tg2)
    {
        $admin=Auth::user()->name;
        $users=User::select(DB::raw('name'))->get();
        $tgl=date('Y-m-d');
        if($admin=="Super Admin"){
            if($jn=="scan"){
                $data=model_barang_scan::where('stts','!=','batal')->whereBetween('tgl',[$tg1,$tg2])->orderBy('id','DESC')->get();
            }elseif($jn=="terkirim"){
                $data=model_barang_scan::where(['stts'=>'terkirim'])->whereBetween('tgl',[$tg1,$tg2])->orderBy('id','DESC')->get();
            }elseif($jn=="batal"){
                $data=model_barang_scan::where(['stts'=>'batal'])->whereBetween('tgl',[$tg1,$tg2])->orderBy('id','DESC')->get();
            }elseif($jn=="pending"){
                $data=DB::table('temp_import')->where('sts_kirim','belum')->get();
            //     $resi=[];
            //     foreach($temp as $gl){
            //         $resi[]=$gl->noresi;
            //     }
            //     $data=model_barang_scan::whereBetween('tgl',[$tg1,$tg2])->whereIn('noresi',$resi)->get();
            }

            $print=[
                'data'=>$data,
                'jn'=>$jn,
                'adm'=>$users,
            ];
            return view('backend.import_barang.data_scaner',$print);
        }else{
            if($jn=="scan"){
                $data=model_barang_scan::where('stts','!=','batal')->whereBetween('tgl',[$tg1,$tg2])->where('admin',$admin)->orderBy('id','DESC')->get();
            }elseif($jn=="terkirim"){
                $data=model_barang_scan::where(['stts'=>'terkirim'])->whereBetween('tgl',[$tg1,$tg2])->where('admin',$admin)->orderBy('id','DESC')->get();
            }elseif($jn=="batal"){
                $data=model_barang_scan::where(['stts'=>'batal'])->whereBetween('tgl',[$tg1,$tg2])->where('admin',$admin)->orderBy('id','DESC')->get();
            }elseif($jn=="pending"){
                $data=DB::table('temp_import')->where('sts_kirim','belum')->get();
                // $resi=[];
                // foreach($temp as $gl){
                //     $resi[]=$gl->noresi;
                // }
                // $data=temp_import::whereBetween('tgl',[$tg1,$tg2])->where(['admin'=>$admin])->whereNotIn('noresi',$resi)->get();
            }

            $print=[
                'data'=>$data,
                'adm'=>$users,
                'jn'=>$jn
            ];
            return view('backend.import_barang.data_scaner',$print);
        }
    }
    // public function DnSckirim($tgl1,$tgl2)
    // {
    //     $namafile = "Data_Barang_Shopee_non-stok.xls";
    //     return Excel::download(new exportScan(), $namafile);
    // }
    public function upScAdmin($ids,$adm)
    {
        $ups=model_barang_scan::where('id',$ids)->update([
            'admin'=>$adm
        ]);
        if($ups){
            $print=[
                'sts'=>'1',
                'msg'=>'Berhasil Di Ubah',
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Gagal Di Ubah',
            ];
        }
        return response()->json($print);
    }
    public function CariscData($cari)
    {
        $users=User::select(DB::raw('name'))->get();
        $admin=Auth::user()->name;
        $data=model_barang_scan::where(['stts'=>'terkirim'])->where('noresi',$cari)->where('admin',$admin)->orderBy('id','DESC')->get();
        $print=[
            'data'=>$data,
            'adm'=>$users,
        ];
        return view('backend.import_barang.data_scaner',$print);
    }
    public function scSimpan(Request $request)
    {
        $nresi=$request->noresi;
        $admin=Auth::user()->name;
        $print=[];
        $dt=[];
        // cek barng ada
        $cb=temp_import::where('noresi',$nresi)->count();
        $mda=temp_import::where('noresi',$nresi)->first();
        if($cb>0){
        //    cek discan barang apa sudah ada
        $cscan=model_barang_scan::where('noresi',$nresi)->count();
            if($cscan>0){
                $print=[
                    'sts'=>'2',
                    'msg'=>'Data Barang Sudah Di scan',
                ];
            }else{
                // cek scan per admin
                if($mda->admin==$admin){
                    $data=temp_import::where('noresi',$nresi)->take(1)->get();
                    foreach($data as $item){
                        $dt[]=[
                            'noresi'=>$item->noresi,
                            'nopesan'=>$item->nopesan,
                            'kurir'=>$item->kurir,
                            'tgl'=>date('Y-m-d'),
                            'jam'=>date('H:i:s'),
                            'tgl_scan'=>date('Y-m-d H:i:s'),
                            'skuinduk'=>$item->skuindex,
                            'sku'=>$item->sku,
                            'barang'=>$item->barang,
                            'varian'=>$item->varian,
                            'jumlah'=>$item->jumlah,
                            'harga'=>$item->harga,
                            'total'=>$item->total,
                            'admin'=>$item->admin,
                            'penerima'=>$item->penerima,
                        ];
                    }
                    $sim=DB::table('barang_scan')->insert($dt);
                    if($sim){
                        $print=[
                            'sts'=>'1',
                            'msg'=>'Data Barang Berhasil Disimpan',
                        ];
                    }
                }else{
                    $print=[
                        'sts'=>'3',
                        'msg'=>'Anda Bukan Admin Paket Ini !',
                    ];
                }
            }
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Data Tidak Ditemukan',
            ];
        }
        return response()->json($print);
    }
    // batal barang
    public function batalscData($noresi)
    {
        $btl=model_barang_scan::where('noresi',$noresi)->update([
            'stts'=>'batal',
            'tgl_batal'=>date('Y-m-d H:i:s')

        ]);
        barang_trx::where('noresi',$noresi)->update([
            'stts'=>'batal',
        ]);
        if($btl){
            $print=[
                'sts'=>'1',
                'msg'=>'Data Berhasil Dibatalkan',
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Data Gagal Dibatalkan',
            ];
        }
        return response()->json($print);
    }
    public function returscData($noresi)
    {
        $btl=model_barang_scan::where('noresi',$noresi)->update([
            'stts'=>'retur',
            'tgl_retur'=>date('Y-m-d H:i:s')
        ]);
        // barang_trx::where('noresi',$noresi)->update([
        //     'stts'=>'batal',
        // ]);
        if($btl){
            $print=[
                'sts'=>'1',
                'msg'=>'Data Berhasil Diretur',
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Data Gagal Diretur',
            ];
        }
        return response()->json($print);
    }
    // lap scan
    public function lapscan()
    {
        $data=User::select(DB::raw('name'))->whereNotIn('id',['1','8'])->get();
        $print=[
            'data'=>$data,
            'tgl1'=>date('Y-m-d'),
            'tgl2'=>date('Y-m-d'),
            'pil'=>'Terkirim',
        ];
        return view('backend.import_barang.laporan_scan',$print);
    }
    public function cariLscan($tgl1,$tgl2,$pil)
    {
        // $admin=Auth::user()->name;
        // if($pil=="pending"){
        //     $temp=temp_import::get();
        //     $resi=[];
        //     foreach($temp as $gl){
        //         $resi[]=$gl->noresi;
        //     }
        //     // $data=model_barang_scan::whereBetween('tgl',[$tgl1,$tgl2])->where('stts',$pil)->whereIn('noresi',$resi)->get();
        // }else{
        //     // $data=model_barang_scan::whereBetween('tgl',[$tgl1,$tgl2])->where('stts',$pil)->get();
        // }
        $data=User::select(DB::raw('name'))->whereNotIn('id',['1','8'])->get();
        $print=[
            'data'=>$data,
            'tgl1'=>$tgl1,
            'tgl2'=>$tgl2,
            'pil'=>$pil,
        ];
        return view('backend.import_barang.data_scan',$print);
    }
    // hapus Temp -barang
    public function hapusTemp(Request $request)
    {
        $ids=$request->norawat;
        // return explode(',',$norawat);
        $listid=explode(',',$ids);
        $del=temp_import::whereIn('id',$listid)->delete();
        if($del){
            $print=[
                'sts'=>'1',
                'msg'=>'Data Behasil Dihapus',
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Data Gagal Dihapus',
            ];
        }
        return response()->json($print);
    }
    public function dataAccScan()
    {
        $admin=Auth::user()->name;
        $nores=[];
        // cari data scan
        $dcs=model_barang_scan::where(['stts'=>'terkirim','admin'=>$admin])->get();
        foreach ($dcs as $k) {
            $nores[]=$k->noresi;
        }
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum'])
        ->whereExists(function($query){
            $query->select(DB::raw(1))
            ->from('barangkey')
            ->whereColumn('barangkey.varian','temp_import.varian')
            ->whereColumn('barangkey.key_barang','temp_import.barang');
        })
        ->whereIn('temp_import.noresi',$nores)
        ->where('admin',$admin)
        ->get();
        $print=[
            'data'=>$data
        ];
        return view('backend.import_barang.acc_scan',$print);
    }
    public function accScan(Request $request)
    {
        $ids=$request->ids;
        $arr=explode(',',$ids);
        $tglk=date('Y-m-d');
        // // update stts kirim

        for($i=0;$i<count($arr);$i++){
            // get data barang_temp
            $dtr=temp_import::where('id',$arr[$i])->first();
            // get barang key
            $bkey=BarangKey::where([
                // 'sku'=>$dtr->sku,
                // 'skuinduk'=>$dtr->skuindex,
                'varian'=>$dtr->varian,
                'key_barang'=>$dtr->barang,
                ])
                ->first();

            $data[]=[
                'noresi'=>$dtr->noresi,
                'nopesan'=>$dtr->nopesan,
                'kurir'=>$dtr->kurir,
                'varian'=>$dtr->varian,
                'sku'=>$dtr->sku,
                'skuindex'=>$bkey->kode_barang,
                'barang'=>$dtr->barang,
                'tgl'=>$tglk,
                'jumlah'=>$dtr->jumlah,
                'harga'=>$dtr->harga,
                'total'=>$dtr->total,
                'admin'=>$dtr->admin,
                'jenis'=>$dtr->jenis,
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
    function dataBarangScan($jenis,$tgl1,$tgl2) {
        $admin=Auth::user()->name;
        if($jenis=="pending"){    
            $data=DB::table('temp_import')->where('admin',$admin)->whereBetween('tgl',[$tgl1,$tgl2])->where('sts_kirim','belum')->get();
        }else if($jenis=="belum"){
            // $data=model_barang_scan::where('stts','!=','batal')->whereBetween('tgl',[$tgl1,$tgl2])->where('admin',$admin)->orderBy('id','DESC')->get();
            $data=DB::table('temp_import')->where('admin',$admin)->where('sts_kirim','!=','batal')->whereBetween('tgl',[$tgl1,$tgl2])->orderBy('id','DESC')->get();
        }
        else{
            $data=model_barang_scan::select(DB::raw('tgl,tgl_scan,tgl_batal,tgl_retur,admin,stts,nopesan,noresi '))
            ->where('admin',$admin);
            // $data=model_barang_scan::where(['stts'=>$jenis]);
                $tgls1=$tgl1.' 00:00:00';
                $tgls2=$tgl2.' 23:59:59';
            if($jenis=="terkirim"){
                $data->where(['stts'=>$jenis])
                ->whereBetween('tgl',[$tgl1,$tgl2]);
            }
            else if($jenis=="batal"){
                $data->where(['stts'=>$jenis])
                ->whereBetween('tgl_batal',[$tgls1,$tgls2]);
            }
            else if($jenis=="retur"){
                $data->where(['stts'=>$jenis])
                ->whereBetween('tgl_retur',[$tgls1,$tgls2]);
            }
            $data->orderBy('id','DESC')->get();
            // $data->groupBy('noresi')->get();
        }
        return FacadesDataTables::of($data)->make(true);
    }
    function hitungByExp($tgl1,$tgl2) {
        $JNT=['JP','JX'];
        $SPE=['SPXID'];
        $JNE=['JT','CM'];
        $SCP=['00'];
        $NJA=['NLIDAP'];
        $admin=Auth::user()->name;
        $tgl1=$tgl1.' 00:00:00';
        $tgl2=$tgl2.' 23:59:59';
        $cjnt = model_barang_scan::Where(function ($query) use($JNT) {
             for ($i = 0; $i < count($JNT); $i++){
                $query->orwhere('noresi', 'like',  '%' . $JNT[$i] .'%');
             }      
        })
        ->whereBetween('tgl_scan',[$tgl1,$tgl2])
        ->where('admin',$admin)
        ->where('tgl_batal',null)
        ->where('tgl_retur',null)
        // ->groupBy('noresi')
        ->count();
       
        $cspe= model_barang_scan::Where(function ($query) use($SPE) {
             for ($i = 0; $i < count($SPE); $i++){
                $query->orwhere('noresi', 'like',  '%' . $SPE[$i] .'%');
             }      
        })
        ->whereBetween('tgl_scan',[$tgl1,$tgl2])
        ->where('admin',$admin)
        ->where('tgl_batal',null)
        ->where('tgl_retur',null)
        // ->groupBy('noresi')
        ->count();
        $cjne = model_barang_scan::Where(function ($query) use($JNE) {
             for ($i = 0; $i < count($JNE); $i++){
                $query->orwhere('noresi', 'like',  '%' . $JNE[$i] .'%');
             }      
        })
        ->whereBetween('tgl_scan',[$tgl1,$tgl2])
        ->where('admin',$admin)
        ->where('tgl_batal',null)
        ->where('tgl_retur',null)
        // ->groupBy('noresi')
        ->count();
        $cscp = model_barang_scan::Where(function ($query) use($SCP) {
             for ($i = 0; $i < count($SCP); $i++){
                $query->orwhere('noresi', 'like',  $SCP[$i] .'%');
             }      
        })
        ->whereBetween('tgl_scan',[$tgl1,$tgl2])
        ->where('admin',$admin)
        ->where('tgl_batal',null)
        ->where('tgl_retur',null)
        // ->groupBy('noresi')
        ->count();
        $cnja = model_barang_scan::Where(function ($query) use($NJA) {
            for ($i = 0; $i < count($NJA); $i++){
               $query->orwhere('noresi', 'like',  '%' . $NJA[$i] .'%');
            }      
       })
       ->whereBetween('tgl_scan',[$tgl1,$tgl2])
       ->where('admin',$admin)
       ->where('tgl_batal',null)
       ->where('tgl_retur',null)
    //    ->groupBy('noresi')
       ->count();

       $print=[
        'JNT'=>$cjnt,
        'SHOPEE'=>$cspe,
        'JNE'=>$cjne,
        'SICEPAT'=>$cscp,
        'NINJA'=>$cnja,
       ];
       return response()->json($print);
    }
}
