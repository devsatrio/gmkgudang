<?php

namespace App\Imports;

use App\models\temp_import;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
class ShopeeImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $rows)
    {
        $numberrow = 0;
            $admin=Auth::user()->name;
            $dataproduk = array();
            $data = array();
            foreach ($rows as $row){
                if($numberrow!=0){
                    $teks = $row[8];
                    $halo = explode("] Nama ", $teks);
                    for ($i=1; $i <count($halo); $i++) {
                        $datatext = explode(";", $halo[$i]);
                        $jumlahdata = count($datatext);
                        // print_r($datatext);
                        // echo "<br>";
                            $produk = explode(':',$datatext[0]);
                            $variasi = explode(':',$datatext[1]);
                            $harga = explode(':',$datatext[2]);
                            $jumlah = explode(':',$datatext[3]);
                            if($jumlahdata==6){
                                $data_sku =  explode(':',$datatext[4]);
                                if($data_sku[1]=='' || $data_sku[1]==' '){
                                    $valid="belum";
                                }else{
                                    $sku = $data_sku[1];
                                    $valid="valid";
                                }
                            }elseif($jumlahdata==7){
                                $data_sku =  explode(':',$datatext[4]);
                                $data_sku_induk = explode(':',$datatext[5]);
                                $sku = $data_sku[1];
                                
                                if( $data_sku_induk[1]==''||$data_sku_induk[1]==' ' || $data_sku[1]=='' || $data_sku[1]==' '){
                                    $valid="belum";
                                }else{
                                    $sku_induk = $data_sku_induk[1];
                                    $valid="valid";
                                }
                            }
                            $harg=preg_replace('/[Rp.,.]/','',$harga[1]);
                            $total=$jumlah[1]*$harg;
                            $data[] = [
                                    'noresi' => $row[0],
                                    'sku'=>$sku,
                                    'skuindex'=>$sku_induk,
                                    'tgl'=>date('Y-m-d'),
                                    'barang'=> $produk[1],
                                    'varian'=> $variasi[1],
                                    'harga'=> $harg,
                                    'jumlah'=>$jumlah[1],
                                    'admin'=>$admin,
                                    'total'=>$total,
                                    'sts_valid'=>$valid,
                                ];
                            
                    }
                    echo "<hr>";
                }
                $numberrow++;
            }
            DB::table('temp_import')->insert($data);
            // temp_import::create($data);

    }
}
