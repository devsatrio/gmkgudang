<?php

namespace App\Imports;

use App\models\Barang;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use DB;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangMasukImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $collection)
    {
        $data=[];
        $hargafix="";
        $total="";
        foreach ($collection as $row){
                $barang = DB::table('barang')->where('kode_barang',$row['kode_barang'])->get();
                foreach($barang as $brg){
                    $idbarang = $brg->id;
                    $harga = $brg->harga;
                    $stokbaru = $brg->stok+$row['jumlah'];
                    Barang::find($idbarang)
                    ->update([
                        'stok'=>$stokbaru,
                    ]);
                    if($row['harga']!=0){
                        $hargafix = $row['harga'];
                        $total = $row['jumlah']*$hargafix;
                    }else{
                        $hargafix = $harga;
                        $total = $row['jumlah']*$hargafix;
                    }
                }
                $data[] = [
                    'kode'=>$row['kode_barang'],
                    'jumlah'=>$row['jumlah'],
                    'harga'=>$hargafix,
                    'total'=>$total,
                    'keterangan' => $row['keterangan'],
                    'tanggal'=>date('Y-m-d'),
                ];
        }
        DB::table('barang_masuk')->insert($data);
    }
}
