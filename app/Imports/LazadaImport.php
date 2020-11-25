<?php

namespace App\Imports;

use App\models\Barang;
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
                $harg=strtok($row[1],'.');
                $total=$row[5]*$harg;
                if($row[0]!=""||$row[4]!=""||$row[0]!=" "||$row[4]!=" "){
                    // $bar=Barang::where('kode_barang',$row[4])->count();
                    // if ($bar>0) {
                    //     $valid='valid';
                    // }else{
                    //     $valid='belum';
                    // }
                    $valid='valid';
                }else{
                    $valid='belum';
                }
                $data[] = [
                    'noresi' => $row[3],
                    'sku'=>$row[0],
                    'skuindex'=>$row[4],
                    'tgl'=>date('Y-m-d'),
                    'barang'=> $row[2],
                    'varian'=> $row[2],
                    'harga'=> $harg,
                    'jumlah'=>$row[5],
                    'admin'=>$admin,
                    'total'=>$total,
                    'sts_valid'=>$valid,
                    'jenis'=>'lazada',
                    'created_at'=>date('Y-m-d H:i:s'),
                    'updated_at'=>date('Y-m-d H:i:s'),
                ];
            }

        }
        DB::table('temp_import')->insert($data);
    }
}
