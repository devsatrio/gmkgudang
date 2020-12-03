<div class="table-responsive">
    <table class="table table-striped table-bordered" id="tbl">
        <thead>
            <tr>
                <tr>
                    <th>No</th>
                    <th>Status</th>
                    <th>No Resi</th>
                    <th>SKU induk</th>
                    <th>SKU</th>
                    <th>Barang</th>
                    <th>Varian</th>
                    <th>Jumlah</th>
                    <th>Harga</th>
                    <th>Total</th>
                    {{-- <th>
                        <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                    </th> --}}
                </tr>
            </tr>
        </thead>
        <tbody>
            @php
                $no=1;
            @endphp
            @foreach ($data as $item)
                <tr>
                    <td>{{$no++}}</td>
                    <td>{{$item->stts}}</td>
                    <td>{{$item->noresi}}</td>
                    <td>{{$item->skuinduk}}</td>
                    <td>{{$item->sku}}</td>
                    <td>{{$item->barang}}</td>
                    <td>{{$item->varian}}</td>
                    <td>{{$item->jumlah}}</td>
                    <td>{{$item->harga}}</td>
                    <td>{{$item->total}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
