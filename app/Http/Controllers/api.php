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
   function getket($id,$user){
    $print=[];
    $brsc=model_barang_scan::where('noresi',$id)->count();
    $data=DB::table('temp_import')
        ->where('noresi',$id)
        ->take(1)
        ->get();

    if($brsc>0){
        $print=[
            'sts'=>'2',
            'msg'=>'Data Barang Sudah Di scan',
            'data'=>$data,
        ];
    }else{
        $badmin=temp_import::where('noresi',$id)->first();
        $badminc=temp_import::where('noresi',$id)->count();
        if($badminc>0){
            if($badmin->admin==$user){
                $cb=temp_import::where('noresi',$id)->count();
                if($cb>0){

                    $print=[
                        'sts'=>'1',
                        'msg'=>'Data Barang Diproses',
                        'data'=>$data,
                    ];
                }else{
                    $print=[
                        'sts'=>'0',
                        'msg'=>'Data Tidak Ditemukan',
                    ];
                }
           }else{
                $print=[
                    'sts'=>'2',
                    'msg'=>'Anda Bukan Admin Paket Ini',
                ];
           }
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
    $nresi=$request->kode;
    $admin=$request->nama;
    $dt=[];
    $print=[];
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
                        'admin'=>$admin,
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
                    'msg'=>'Anda BUkan Admin Paket Ini!',
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
        'stts'=>'batal',
        'tgl_batal'=>date('Y-m-d H:i:s'),
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
    function kiriman($user){
        $data=DB::table('barang_scan')
        ->where('stts','terkirim')
        ->where('admin',$user)
        // ->groupBy('noresi')
        ->orderBy('tgl','DESC')->paginate(20);
        return response()->json($data);
    }
    public function cariKiriman($cari,$user)
    {
        $data=DB::table('barang_scan')
        ->where('stts','terkirim')
        ->where('admin',$user)
        ->where('noresi','like','%'.$cari.'%')
        ->orWhere('barang','like','%'.$cari.'%')
        // ->groupBy('noresi')
        ->orderBy('tgl','DESC')->get();
         return response()->json($data);
    }
}
