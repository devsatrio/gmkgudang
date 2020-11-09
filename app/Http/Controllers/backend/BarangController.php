<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DataTables;
use App\models\Barang;
use DB;

class BarangController extends Controller
{
    //=================================================================
    public function index()
    {
        return view('backend/barang/index');
    }

    //=================================================================
    public function listdata(){
        return Datatables::of(Barang::all())->make(true);
    }

    //=================================================================
    public function create()
    {
        return view('backend/barang/create');
    }

    //=================================================================
    public function store(Request $request)
    {
        $request->validate([
            'kode_barang' => ['required', 'unique:barang'],
        ]);
        
        Barang::insert([
            'kode_barang'=>$request->kode_barang,
            'nama'=>$request->nama,
            'stok'=>$request->stok,
            'harga'=>$request->harga,
            'deskripsi'=>$request->deskripsi,
            'created_at'=>date('Y-m-d H:i:s'),
        ]);
        
        return redirect('/barang')->with('status','Sukses menyimpan data');
    }

    //=================================================================
    public function show($id)
    {
        //
    }

    //=================================================================
    public function edit($id)
    {
        $data = Barang::where('id',$id)->firstOrFail();
        return view('backend/barang/edit',['data'=>$data]);
    }

    //=================================================================
    public function update(Request $request, $id)
    {
        Barang::find($id)
            ->update([
                'nama'=>$request->nama,
                'stok'=>$request->stok,
                'harga'=>$request->harga,
                'deskripsi'=>$request->deskripsi,
            ]);

        return redirect('/barang')->with('status','Sukses memperbarui data');
    }

    //=================================================================
    public function destroy($id)
    {
        Barang::destroy($id);
    }
}
