<?php

namespace App\Exports;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\FromCollection;

class BarangExport implements FromCollection, ShouldAutoSize, WithHeadings
{
    public function collection()
    {
        return DB::table('barang')
        ->select(DB::raw('kode_barang,nama,deskripsi,stok,harga'))
        ->orderby('id','desc')
        ->get();
    }
    public function headings(): array
    {
        return [
            'kode',
            'nama',
            'deskripsi',
            'stok',
            'hpp',
        ];
    }
}
