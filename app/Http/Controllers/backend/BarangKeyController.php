<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Imports\BarangKeyImport;
use App\Exports\BarangKeyExport;
use Illuminate\Http\Request;
use App\models\Barang;
use App\models\BarangKey;
use Excel;
use DataTables;
use DB;

class BarangkeyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
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
        $data = $request->keybarang;
        for($i=0; $i < count($data) ; $i++){
                $datanya[] = [
                'kode_barang'     => $request->barang,
                'key_barang'      => $request->keybarang[$i]
            ];
           }
        BarangKey::insert($datanya);
        return redirect('barang-keyword')->with('statusmanual','Input Data Sukses');
    }

    //=================================================================
    public function importbarangkey(Request $request)
    {
        if($request->hasFile('filenya')){
            Excel::import(new BarangKeyImport, request()->file('filenya'));
        }
        return redirect('barang-keyword')->with('status', 'Import data sukses');
    }

    //=================================================================
    public function show($id)
    {
        //
    }

    //=================================================================
    public function edit($id)
    {
        $barang = BarangKey::where('id',$id)->firstOrFail();
        return view('backend/barangkeyword/edit',['data'=>$barang]);
    }

    //=================================================================
    public function update(Request $request, $id)
    {
        BarangKey::find($id)
            ->update([
                'key_barang'=>$request->keybarang,
            ]);

        return redirect('barang-keyword')->with('status','Sukses memperbarui data');
    }

    //=================================================================
    public function destroy($id)
    {
        BarangKey::destroy($id);
    }
}
