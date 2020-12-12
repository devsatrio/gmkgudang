<?php

namespace App\Imports;

use App\models\temp_import;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToCollection;

class BarangNonLengkap implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        $data=[];
        foreach ($collection as $key => $row) {
            if($key>0){
                $tgl=date('Y-m-d');
                $skuinduk=$row[1];
                $sku=$row[2];
                $bar=$row[3];
                $varian=$row[4];
                $kbar=$row[5];
            // // update temp
            // temp_import::where('barang',$bar)->update(['stts_valid'=>'valid']);
            $data[]=[
                'skuinduk'=>$skuinduk,
                'sku'=>$sku,
                'key_barang'=>$bar,
                'kode_barang'=>$kbar,
                'varian'=>$varian,
                'tgl_upload'=>$tgl
                ];
            }
        }
        DB::table('barangkey')->insert($data);
    }
}
