<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use DB;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangKeyImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $collection)
    {
        foreach ($collection as $row){
            $data[] = [
                'kode_barang'=>$row['kode_barang'],
                'key_barang'=>$row['key_barang'],
            ];
        }
        DB::table('barangkey')->insert($data);
    }
}
