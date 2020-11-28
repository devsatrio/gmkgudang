<?php

namespace App\Exports;

use App\models\Barang;
use App\models\BarangKey;
use App\models\temp_import;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;

class TempExportSp_Non_Lengkap implements FromCollection , WithHeadings , ShouldAutoSize
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
           ->get();
       return $data;
    }
    public function headings(): array
    {
        return [
            'SKUINDUK',
            'SKU',
            'BARANG',
            'KEY Kode Barang Gudang',
        ];
    }
}
