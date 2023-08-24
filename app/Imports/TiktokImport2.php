<?php

namespace App\Imports;

use App\models\temp_import;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;

class TiktokImport2 implements ToCollection,WithStartRow
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
                $harg=$row[47];
                // $total=$row[5]*$harg;
                // if($row[0]!=""||$row[4]!=""||$row[0]!=" "||$row[4]!=" "){
                //     $valid='valid';
                // }else{
                //     $valid='belum';
                // }
                $nopesan=(int) $row[0];
                $total=$row[34]*$harg;
                // dd($nopesan);
                $ckb=temp_import::where(['noresi'=>$row[44],'barang'=> $row[29],'varian'=> $row[31]])->count();
                if($ckb>0){

                }else{
                    $data[] = [
                        'noresi' => $row[44],
                        'nopesan' => $nopesan,
                        'kurir' => $row[41],
                        'sku'=>$row[30],
                        'skuindex'=>$row[30],
                        'tgl'=>date('Y-m-d'),
                        'barang'=> $row[29],
                        'varian'=> $row[31],
                        'harga'=> $harg,
                        'jumlah'=>$row[34],
                        'admin'=>$admin,
                        'total'=>$total,
                        'sts_valid'=>'belum',
                        'jenis'=>'tiktok',
                        'penerima'=>$row[20],
                        'created_at'=>date('Y-m-d H:i:s'),
                        'updated_at'=>date('Y-m-d H:i:s'),
                    ];
                }
            }

        }

        DB::table('temp_import')->insert($data);
    }
    public function startRow(): int
    {
        return 1;
    }
}
