<?php

namespace App\Exports;

use App\models\temp_import;
use Illuminate\Support\Facades\Auth;
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
        $admin=Auth::user()->name;
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'sudah','jenis'=>'shopee'])
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
