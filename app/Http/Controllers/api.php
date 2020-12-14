<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\models\model_barang_scan;
use App\models\temp_import;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class api extends Controller
{
   // +++++++++++++++++++++++++++++++API ANDROID++++++++++++++++++++++++++++++++++++++++++++++
   function getket($id){
    $print=[];

    $brsc=model_barang_scan::where('noresi',$id)->count();
    if($brsc>0){
        $print=[
            'sts'=>'2',
            'msg'=>'Data Barang Sudah Di scan',
        ];
    }else{
        $cb=temp_import::where('noresi',$id)->count();
        if($cb>0){
            $data=DB::table('temp_import')
            ->where('noresi',$id)
            ->first();
            $print=[
                'sts'=>'1',
                'msg'=>'Data Barang Diproses',
            ];
        }else{
            $print=[
                'sts'=>'0',
                'msg'=>'Data Tidak Ditemukan',
            ];
        }
    }
    return response()->json($print);
}
function upstat(Request $request){
    $nresi=$request->noresi;
    $admin=$request->nama;
    $dt=[];
    // cek barng ada
    $cb=temp_import::where('noresi',$nresi)->count();
    if($cb>0){
        //    cek discan barang apa sudah ada
        $cscan=model_barang_scan::where('noresi',$nresi)->count();
        if($cscan>0){
            $print=[
                'sts'=>'2',
                'msg'=>'Data Barang Sudah Di scan',
            ];
        }else{
            $data=temp_import::where('noresi',$nresi)->get();
            foreach($data as $item){
                $dt[]=[
                    'noresi'=>$item->noresi,
                    'tgl'=>date('Y-m-d'),
                    'skuinduk'=>$item->skuindex,
                    'sku'=>$item->sku,
                    'barang'=>$item->barang,
                    'varian'=>$item->varian,
                    'jumlah'=>$item->jumlah,
                    'harga'=>$item->harga,
                    'total'=>$item->total,
                    'admin'=>$admin,
                ];
            }
            $sim=DB::table('barang_scan')->insert($dt);
            if($sim){
                $print=[
                    'sts'=>'1',
                    'msg'=>'Data Barang Berhasil Disimpan',
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
function uptarik(Request $req){
    $kod=$req->kode;
    $data=DB::table('barang_scan')
    ->where('noresi',$kod)
    ->update([
        'stts'=>'batal'
    ]);
    if($data){
        return response()->json(['msg'=>'Berhasil Ditarik']);
    }else{
        return response()->json(['msg'=>'Gagal Ditarik']);
    }
}
function login(Request $req){
    $username = $req->username;
    $mypassword = $req->password;
    $data = DB::table('users')
    ->where('username',$username)
    ->count();

    if($data > 0){
        $datausers = DB::table('users')
        ->where('username',$username)
        ->orWhere('email',$username)
        ->get();

        foreach ($datausers as $du) {
            $id = $du->id;
            $mypass = $du->password;
        }

        if(Hash::check($mypassword,$mypass)){
                return response()->json(['status'=>'1','msg'=>'Berhasil Login','user'=>$datausers]);
        }else{
            return response()->json(['status'=>'0','msg'=>'Maaf Password anda Tidak Sesuai']);
        }
    }else{
        return response()->json(['status'=>'2','msg'=>'Maaf, Pengguna Belum Terdaftar']);
    }

}
function upakun(Request $req){
    $kode=$req->kode;
    $username=$req->username;
    $pass=Hash::make($req->password);
    $data=DB::table('users')
    ->where('id',$kode)
    ->update([
        'username'=>$username,
        'password'=>$pass
    ]);
    if($data){
        return response()->json(['status'=>'1','msg'=>'Berhasil Diupdate']);
    }else{
        return response()->json(['status'=>'0','msg'=>'Gagal Diupdate']);
    }
}
function kiriman(){
    $data=DB::table('barang_scan')
    ->where('stts','terkirim')
    // ->groupBy('noresi')
    ->orderBy('tgl','DESC')->paginate(20);
     return response()->json($data);
}
}
