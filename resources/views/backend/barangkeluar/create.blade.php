@extends('layouts/base')

@section('content')
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h1 class="m-0 text-dark"> Barang Keluar</h1>
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
                <div class="card card-success">
                    <div class="card-header">
                        <h3 class="card-title">Tambah Data</h3>
                    </div>
                    <form method="POST" role="form" enctype="multipart/form-data" action="{{url('/barang-keluar')}}">
                        @csrf
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Barang</label>
                                <select name="barang" class="form-control">
                                    @foreach($data as $row)
                                    <option value="{{$row->id}}">{{$row->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">jumlah</label>
                                <input type="number" min="0" value="0" class="form-control" name="jumlah" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Harga</label>
                                <input type="number" min="0" value="0" class="form-control" name="harga" required>
                                <span class="text-muted">
                                    NB : isi kosong "0" apabila ingin harga sesuai hpp barang
                                </span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Keterangan</label>
                                <textarea name="keterangan" rows="5" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary float-right">Simpan</button>
                        </div>
                    </form>
                </div>
                <div class="card card-warning">
                    <div class="card-header">
                        <h3 class="card-title">Import Data</h3>
                    </div>
                    <form method="POST" role="form" enctype="multipart/form-data"
                        action="{{url('/import-barang-keluar')}}">
                        @csrf
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Upload File</label>
                                <input type="file" class="form-control" name="filenya"
                                    accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
                                    required>
                            </div>
                            <a href="{{asset('templateexcel/template_barang_keluar.xlsx')}}"
                                class="btn btn-info">Download Template Import</a>
                        </div>
                        <div class="card-footer">
                            <button type="reset" onclick="history.go(-1)" class="btn btn-danger">Kembali</button>
                            <button type="submit" class="btn btn-success float-right">Upload</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection