<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;

class exportScan implements FromCollection,ShouldAutoSize,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //
    }
    public function headings(): array
    {
        return [
            'Status',
            'No Resi',
            'No Pesan',
            'Kurir',
            'Barang',
            'Varian',
            'Jumlah',
            'Harga',
            'Total'
        ];
    }
}
