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
        $export =DB::table('barang')
        ->select(DB::raw('kode_barang,nama,deskripsi,stok,harga,harga*stok'))
        ->orderby('id','desc')
        ->get();
        $total = 0;
        foreach($export as $row){
            $total += $row->harga*$row->stok;
        }
        $jumlah = count($export);
        $export[$jumlah] =array(
            'kode_barang'=>'Total',
            'nama'=>'',
            'deskripsi'=>'',
            'stok'=>'',
            'harga'=>'',
            'harga*stok'=>$total
        );
        return $export;
    }
    public function headings(): array
    {
        return [
            'kode',
            'nama',
            'deskripsi',
            'stok',
            'hpp',
            'Total',
        ];
    }
}
