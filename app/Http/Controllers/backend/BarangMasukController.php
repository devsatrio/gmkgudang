<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Imports\BarangMasukImport;
use Illuminate\Http\Request;
use App\models\Barang;
use DataTables;
use Excel;
use DB;

class BarangMasukController extends Controller
{
    //=================================================================
    public function index()
    {
        return view('backend/barangmasuk/index');
    }

    //=================================================================
    public function listdata(){
        return Datatables::of(DB::table('barang_masuk')
        ->select(DB::raw('barang_masuk.*,barang.nama'))
        ->leftjoin('barang','barang.kode_barang','=','barang_masuk.kode')
        ->orderby('barang_masuk.id','desc')
        ->get())->make(true);
    }

    //=================================================================
    public function create()
    {
        $data = DB::table('barang')->get();
        return view('backend/barangmasuk/create',['data'=>$data]);
    }
    //=================================================================
    public function laporan(Request $request)
    {
        $data = DB::table('barang_masuk')
        ->select(DB::raw('barang_masuk.*,barang.nama'))
        ->leftjoin('barang','barang.kode_barang','=','barang_masuk.kode')
        ->whereBetween('barang_masuk.tanggal', [$request->tglsatu, $request->tgldua])
        ->orderby('barang_masuk.id','desc')
        ->get();
        return view('backend/barangmasuk/laporan',['data'=>$data]);
    }

    //=================================================================
    public function store(Request $request)
    {
        $barang = DB::table('barang')->where('id',$request->barang)->get();
        foreach($barang as $row){
            $harga = $row->harga;
            $kode = $row->kode_barang;
            $stokbaru = $row->stok+$request->jumlah;
            
        }
        Barang::find($request->barang)
            ->update([
                'stok'=>$stokbaru,
            ]);
        if($request->harga!=0){
            $hargafix = $request->harga;
            $total = $request->jumlah*$hargafix;
        }else{
            $hargafix = $harga;
            $total = $request->jumlah*$hargafix;
        }

        DB::table('barang_masuk')->insert([
            'kode'=>$kode,
            'jumlah'=>$request->jumlah,
            'harga'=>$hargafix,
            'total'=>$total,
            'keterangan'=>$request->keterangan,
            'tanggal'=>date('Y-m-d'),
        ]);
        
        return redirect('/barang-masuk')->with('status','Sukses menyimpan data');
    }

    //=================================================================
    public function show($id)
    {
        //
    }
    
    //=================================================================
    public function edit($id)
    {
        $data = DB::table('barang_masuk')
        ->select(DB::raw('barang_masuk.*,barang.nama'))
        ->leftjoin('barang','barang.kode_barang','=','barang_masuk.kode')
        ->where('barang_masuk.id',$id)->get();
        return view('backend/barangmasuk/edit',['data'=>$data]);
    }

    //=================================================================
    // public function exportbarang()
    // {
    //     $namafile = "Data_Barang.xlsx";   
    //     return Excel::download(new BarangExport(),$namafile);
    // }

    //=================================================================
    public function importbarangmasuk(Request $request)
    {
        if($request->hasFile('filenya')){
            Excel::import(new BarangMasukImport, request()->file('filenya'));
        }
        return redirect('/barang-masuk')->with('status', 'Import data sukses');
    }

    //=================================================================
    public function update(Request $request, $id)
    {
        $barang = DB::table('barang')->where('kode_barang',$request->barang)->get();
        foreach($barang as $row){
            $harga = $row->harga;
            $kode = $row->kode_barang;
            $stokbaru = $row->stok+$request->jumlah;
            
        }
        if($request->harga!=0){
            $hargafix = $request->harga;
            $total = $request->jumlah*$hargafix;
        }else{
            $hargafix = $harga;
            $total = $request->jumlah*$hargafix;
        }
            DB::table('barang_masuk')
            ->where('id',$id)
            ->update([
                'jumlah'=>$request->jumlah,
                'harga'=>$hargafix,
                'total'=>$total,
                'keterangan'=>$request->keterangan,
                'tanggal'=>date('Y-m-d'),
            ]);
        return redirect('/barang-masuk')->with('status','Sukses memperbarui data');
    }

    //=================================================================
    public function destroy($id)
    {
        DB::table('barang_masuk')->where('id',$id)->delete();
    }
}
