<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\Barang;
use App\models\BarangKey;
use DataTables;
use DB;

class BarangkeyController extends Controller
{
    //=================================================================
    public function index()
    {
        return view('backend/barangkeyword/index');
    } 

    //=================================================================
    public function listdata(){
        return Datatables::of(DB::table('barangkey')
        ->select(DB::raw('barangkey.*,barang.nama'))
        ->leftjoin('barang','barang.kode_barang','=','barangkey.kode_barang')
        ->orderby('barangkey.id','desc')
        ->get())->make(true);
        
    }

    //=================================================================
    public function create()
    {
        $barang = Barang::orderby('id','desc')->get();
        return view('backend/barangkeyword/create',['barang'=>$barang]);
    }

    //=================================================================
    public function store(Request $request)
    {
        $data = $request->key_barangbarang;
        for($i=0; $i < count($data) ; $i++){
                $datanya[] = [
                'kode_barang'     => $request->barang,
                'key_barang'      => $request->key_barangbarang[$i]
            ];
           }
        Barangkey_barang::insert($datanya);
        return redirect('barang-keyword')->with('statusmanual','Input Data Sukses');
    }

    //=================================================================
    public function show($id)
    {
        //
    }

    //=================================================================
    public function edit($id)
    {
        //
    }

    //=================================================================
    public function update(Request $request, $id)
    {
        //
    }

    //=================================================================
    public function destroy($id)
    {
        BarangKey::destroy($id);
    }
}
