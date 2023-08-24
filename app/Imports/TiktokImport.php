<?php

namespace App\Imports;

use App\models\Barang;
use App\models\temp_import;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;

class TiktokImport implements ToCollection,WithStartRow
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $rows)
    {
        $admin=Auth::user()->name;
        $data=[];
        foreach ($rows as $key=>$row) {
            // print_r($row[0]);
            if($key>0){
                $fharg=substr($row[11],3);
                $harg=str_replace('.','',$fharg);
                // $total=$row[5]*$harg;
                // if($row[0]!=""||$row[4]!=""||$row[0]!=" "||$row[4]!=" "){
                //     $valid='valid';
                // }else{
                //     $valid='belum';
                // }
                $nopesan=(int) $row[0];
                // dd($nopesan);
                $ckb=temp_import::where(['noresi'=>$row[33],'barang'=> $row[7],'varian'=> $row[8]])->count();
                if($ckb>0){

                }else{
                    $data[] = [
                        'noresi' => $row[33],
                        'nopesan' => $nopesan,
                        'kurir' => $row[35],
                        'sku'=>$row[6],
                        'skuindex'=>$row[6],
                        'tgl'=>date('Y-m-d'),
                        'barang'=> $row[7],
                        'varian'=> $row[8],
                        'harga'=> $harg,
                        'jumlah'=>$row[9],
                        'admin'=>$admin,
                        'total'=>$harg,
                        'sts_valid'=>'belum',
                        'jenis'=>'tiktok',
                        'penerima'=>$row[37],
                        'created_at'=>date('Y-m-d H:i:s'),
                        'updated_at'=>date('Y-m-d H:i:s'),
                    ];
                }
            }

        }

        DB::table('temp_import')->insert($data);

            // temp_import::create($data);
    }
    public function startRow(): int
    {
        return 2;
    }
}
