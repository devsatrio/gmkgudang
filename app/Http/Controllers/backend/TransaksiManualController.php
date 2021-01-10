<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Imports\BarangKeluarImport;
use Illuminate\Http\Request;
use App\models\Barang;
use App\models\barang_trx;
use App\models\temp_import;
use DataTables;
use Excel;
use DB;
use Auth;

class TransaksiManualController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    //=================================================================
    public function index()
    {
        DB::table('barang_trx_manual')->where('pembuat',Auth::user()->id)->orwhere('pembuat',null)->delete();
        $admin = DB::table('users')->orderby('id','desc')->get();
        $barang = DB::table('barang')->orderby('id','desc')->get();
        return view('backend/transaksilangsung/index',['admin'=>$admin,'barang'=>$barang]);
    }

    //=================================================================
    public function caribarang($kode)
    {
        $barang = DB::table('barang')->where('id',$kode)->get();
        return response()->json($barang);
    }

    //=================================================================
    public function caridetail()
    {
        $data = DB::table('barang_trx_manual')->where('pembuat',Auth::user()->id)->get();
        return response()->json($data);
    }

    //=================================================================
    public function storedetail(Request $request)
    {
        
        DB::table('barang_trx_manual')->insert([
            'pembuat'=>$request->admin,
            'barang'=>$request->nama_barang,
            'harga'=>$request->harga,
            'jumlah'=>$request->jumlah,
            'subtotal'=>$request->jumlah*$request->harga,
            'sku'=>$request->sku,
            'resi'=>$request->resi,
            'kode_barang'=>$request->kode,
            'varian'=>$request->varian,
            'kurir'=>$request->kurir,
            'penerima' => $request->penerima,
            'nopesanan'=>$request->nopesanan,
            'sku_induk'=>$request->sku_induk,
        ]);
    }

    //=================================================================
    public function store(Request $request)
    {
        $data = DB::table('barang_trx_manual')->where('pembuat',Auth::user()->id)->get();
        $data_input=[];
        foreach($data as $row){
            $data_input[]=[
                'noresi'=>$request->resi,
                'nopesan'=>$request->nopesanan,
                'sku'=>$row->sku,
                'kurir'=>$row->kurir,
                'varian'=>$row->varian,
                'skuindex'=>$row->sku_induk,
                'barang'=>$row->barang,
                'tgl'=>$request->tgl,
                'jumlah'=>$row->jumlah,
                'harga'=>$row->harga,
                'penerima'=>$row->penerima,
                'total'=>$row->subtotal,
                'jenis'=>$request->tipe,
                'admin'=>$request->admin,
                'sts_kirim'=>'belum',
                'sts_valid'=>'belum',
                'created_at'=>date('Y-m-d H:i:s'),
                'updated_at'=>date('Y-m-d H:i:s'),
            ];
            $databarang = DB::table('barang')->where('id',$row->kode_barang)->get();
            foreach($databarang as $dtb){
                DB::table('barang')->where('id',$row->kode_barang)->update(['stok'=>$dtb->stok-$row->jumlah]);
            }
        }
        temp_import::insert($data_input);
        return redirect('/transaksi-manual')->with('status','Sukses menyimpan data');
    }

    //=================================================================
    public function hapusdetail($id)
    {
        DB::table('barang_trx_manual')->where('id',$id)->delete();
    }
}
