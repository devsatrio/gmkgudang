<?php

namespace App\Imports;

use App\models\Barang;
use App\models\temp_import;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LazadaImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $rows)
    {

        $admin=Auth::user()->name;
        foreach ($rows as $key=>$row) {
            // print_r($row[0]);
            if($key>0){
                $harg=strtok($row[37],'.');
                // $total=$row[5]*$harg;
                // if($row[0]!=""||$row[4]!=""||$row[0]!=" "||$row[4]!=" "){
                //     $valid='valid';
                // }else{
                //     $valid='belum';
                // }
                $nopesan=(int) $row[8];
                // dd($nopesan);
                $ckb=temp_import::where(['noresi'=>$row[48],'barang'=> $row[41],'varian'=> $row[42]])->count();
                if($ckb>0){

                }else{
                    $data[] = [
                        'noresi' => $row[48],
                        'nopesan' => $nopesan,
                        'kurir' => $row[50],
                        'sku'=>$row[4],
                        'skuindex'=>$row[4],
                        'tgl'=>date('Y-m-d'),
                        'barang'=> $row[41],
                        'varian'=> $row[42],
                        'harga'=> $harg,
                        'jumlah'=>'1',
                        'admin'=>$admin,
                        'total'=>$harg,
                        'sts_valid'=>'belum',
                        'jenis'=>'lazada',
                        'penerima'=>$row[13],
                        'created_at'=>date('Y-m-d H:i:s'),
                        'updated_at'=>date('Y-m-d H:i:s'),
                    ];
                    DB::table('temp_import')->insert($data);
                }
            }

        }
    }
}
