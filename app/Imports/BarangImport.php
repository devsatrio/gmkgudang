<?php

namespace App\Imports;

use App\models\Barang;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use DB;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $collection)
    {
        $data=[];
        foreach ($collection as $row){
                $data[] = [
                    'kode_barang'=>$row['kode'],
                    'nama'=>$row['nama'],
                    'deskripsi'=>$row['deskripsi'],
                    'stok'=>$row['stok'],
                    'harga' => $row['hpp'],
                    'created_at'=>date('Y-m-d H:i:s'),
                ];
        }
        DB::table('barang')->insert($data);
    }
}
