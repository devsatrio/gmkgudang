<?php

namespace App\Exports;

use App\models\temp_import;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;

class TempExportSp implements FromCollection, WithHeadings, ShouldAutoSize
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'sudah','jenis'=>'shopee'])
        ->select(DB::raw('skuindex,sku,barang'))
        ->get();
       return $data;
    }
    public function headings(): array
    {
        return [
            'SKUINDUK',
            'SKU',
            'BARANG',
            'JUMLAH',
        ];
    }
}
