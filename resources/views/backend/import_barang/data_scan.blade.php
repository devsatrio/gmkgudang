<div class="table-responsive">
    <table class="table table-bordered" id="tbl">
        @foreach ($data as $itm)
            <tr>
                <td class="bg-primary">Toko</td>
                <td class="bg-primary" colspan="11">{{$itm->admin}}</td>
                @php
                    if($pil=="pending"){
                        $temp=DB::table('temp_import')->get();
                        $resi=[];
                        foreach($temp as $gl){
                            $resi[]=$gl->noresi;
                        }
                        $dtl=DB::table('barang_scan')->whereBetween('tgl',[$tgl1,$tgl2])->where(['stts'=>$pil,'admin'=>$itm->admin])->whereIn('noresi',$resi)->get();
                    }else{
                        $dtl=DB::table('barang_scan')->whereBetween('tgl',[$tgl1,$tgl2])->where(['stts'=>$pil,'admin'=>$itm->admin])->get();
                    }
                    $no=1;
                @endphp
                <tr class="bg-info">
                    <td>No</td>
                    <td>Status</td>
                    <td>No Resi</td>
                    <td>No Pesan</td>
                    <td>Kurir</td>
                    <td>Barang</td>
                    <td>Varian</td>
                    <td>Jumlah</td>
                    <td>Harga</td>
                    <td>Total</td>
                </tr>
                @foreach ($dtl as $item)
                    <tr>
                        <td>{{$no++}}</td>
                        <td>{{$item->stts}}</td>
                        <td>{{$item->noresi}}</td>
                        <td>{{$item->nopesan}}</td>
                        <td>{{$item->kurir}}</td>
                        <td>{{$item->barang}}</td>
                        <td>{{$item->varian}}</td>
                        <td>{{$item->jumlah}}</td>
                        <td>{{$item->harga}}</td>
                        <td>{{$item->total}}</td>
                    </tr>
                @endforeach
            </tr>
        @endforeach
    </table>
</div>
