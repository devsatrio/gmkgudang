<?php

namespace App\Exports;

use App\models\Barang;
use App\models\BarangKey;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;

class exportNonStokLengkap implements FromCollection,WithHeadings,ShouldAutoSize
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
       //  dd($kode);
       $data=BarangKey::
           whereNotIn('kode_barang',$kode)
           ->select(DB::raw('kode_barang,skuinduk,sku,key_barang,varian'))
           ->get();
        return $data;
    }
    public function headings(): array
    {
        return [
            'Kode Barang',
            'SKUINDUK',
            'SKU',
            'BARANG',
            'VARIAN',
            'Jumlah',
        ];
    }
}
