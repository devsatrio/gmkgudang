<div class="row">
    <div class="col-12 mb-3">
        <a href="#" style="display: none" class="float-right" id="btarik"><div class="badge badge-warning"><i class="fa fa-history"></i> Batal Barang</div></a>
    </div>
    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="list-data">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>No Resi</th>
                        <th>SKU induk</th>
                        <th>SKU</th>
                        <th>Barang</th>
                        <th>Jumlah</th>
                        <th>Harga</th>
                        <th>Total</th>
                        <th>User/Toko</th>
                        <th>Tanggal</th>
                        <th>Stts</th>
                        <th>
                            <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $no=1;
                    @endphp
                    @foreach ($data as $item)
                        <tr>
                            <td>{{$no++}}</td>
                            <td>{{$item->noresi}}</td>
                            <td>{{$item->skuindex}}</td>
                            <td>{{$item->sku}}</td>
                            <td>{{$item->barang}}</td>
                            <td>{{$item->jumlah}}</td>
                            <td>{{$item->harga}}</td>
                            <td>{{$item->total}}</td>
                            <td>{{$item->admin}}</td>
                            <td>{{$item->tgl}}</td>
                            <td>{{$item->stts}}</td>
                            <td>
                                <input type="checkbox" onclick="ceksat()" class="subck">
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
