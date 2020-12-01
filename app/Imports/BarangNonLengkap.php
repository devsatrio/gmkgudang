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
                $sku=$row[0];
                $skuinduk=$row[1];
                $bar=$row[2];
                $kbar=$row[3];
            // // update temp
            // temp_import::where('barang',$bar)->update(['stts_valid'=>'valid']);
            $data[]=[
                'sku'=>$sku,
                'skuinduk'=>$skuinduk,
                'key_barang'=>$bar,
                'kode_barang'=>$kbar,
                'tgl_upload'=>$tgl
                ];
            }
        }
        DB::table('barangkey')->insert($data);
    }
}
