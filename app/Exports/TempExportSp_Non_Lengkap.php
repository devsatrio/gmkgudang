<?php

namespace App\Exports;

use App\models\temp_import;
use Illuminate\Support\Facades\Auth;
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
        $admin=Auth::user()->name;
        $data=temp_import::where(['sts_kirim'=>'belum','sts_valid'=>'belum','jenis'=>'shopee'])
        ->whereNotExists(function($query){
            $query->select(DB::raw(1))
            ->from('barangkey')
            ->whereColumn('barangkey.varian','temp_import.varian')
            ->whereColumn('barangkey.key_barang','temp_import.barang');
        })
        ->where('admin',$admin)
        ->get();
       return $data;
    }
    public function headings(): array
    {
        return [
            'NO RESI',
            'SKUINDUK',
            'SKU',
            'BARANG',
            'VARIAN',
            'KEY Kode Barang Gudang',
        ];
    }
}
