@extends('layouts/base')

@section('content')
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h1 class="m-0 text-dark"> Barang Masuk</h1>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-12">
                @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif
                <div class="card card-warning">
                    <div class="card-header">
                        <h3 class="card-title">Edit Data</h3><br>
                        <span>NB : Mengedit Data Barang Masuk Tidak Akan Berpengaruh Pada Stok Barang</span>
                    </div>
                    @foreach($data as $row)
                    <form method="POST" role="form" enctype="multipart/form-data" action="{{url('/barang-masuk/'.$row->id)}}">
                        @csrf
                        <input type="hidden" name="_method" value="PUT">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Barang</label>
                                <input type="text" class="form-control" value="{{$row->nama}}" readonly>
                                <input type="hidden" name="barang" value="{{$row->kode}}">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">jumlah</label>
                                <input type="number" min="0" value="{{$row->jumlah}}" class="form-control" name="jumlah" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Harga</label>
                                <input type="number" min="0" value="{{$row->harga}}" class="form-control" name="harga" required>
                                <span class="text-muted">
                                NB : isi kosong "0" apabila ingin harga sesuai hpp barang
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Keterangan</label>
                                <textarea name="keterangan" rows="5" class="form-control">{{$row->keterangan}}</textarea>
                            </div>
                        </div>

                        <div class="card-footer">
                        <button type="button" onclick="history.go(-1)" class="btn btn-danger">Kembali</button>
                            <button type="submit" class="btn btn-primary float-right">Simpan</button>
                        </div>
                    </form>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection