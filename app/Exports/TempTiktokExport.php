<?php

namespace App\Exports;

use App\models\Barang;
use App\models\temp_import;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;

class TempTiktokExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $br=Barang::get();
         foreach ($br as  $item) {
             $kode[]=$item->kode_barang;
         }
         $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'valid','jenis'=>'tiktok'])
         ->whereNotIn('skuindex',$kode)
         ->select(DB::raw('skuindex,sku,barang,varian'))
         ->get();
        return $data;
    }
    public function headings(): array
    {
        return [
            'SKUINDUK',
            'SKU',
            'BARANG',
            'VARIAN',
            'JUMLAH',
        ];
    }
}
