<div class="table-responsive">
    <table class="table table-bordered tbel" id="tscan">
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
            <td>Ops</td>
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
                    <td>
                        <button class="btn btn-primary btn-sm" data-target="#mdl{{$item->id}}" data-toggle="modal">
                         <i class="fa fa-user"></i>
                        </button>
                    </td>
                </tr>
                {{-- modal --}}
                <div class="modal fade" id="mdl{{$item->id}}">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="modal-title">
                                    Edit Admin
                                </div>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="">Admin</label>
                                    <select name="" class="form-control" id="scladmin">
                                        <option value="{{$item->admin}}">{{$item->admin}}</option>
                                        @foreach ($adm as $it)
                                            <option value="{{$it->name}}">{{$it->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button onclick="upAdmin('{{$item->id}}')" type="button" class="btn btn-primary float-right">Simpan</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
    </table>
</div>
