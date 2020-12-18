<div class="table-responsive">
    <table class="table table-bordered" id="tbl">
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
        @php
            $no=1;
        @endphp
            @foreach ($data as $item)
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
    </table>
</div>
