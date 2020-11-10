@extends('layouts/base')

@section('content')
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h1 class="m-0 text-dark"> Barang Keyword</h1>
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
                    <form method="POST" role="form" enctype="multipart/form-data" action="{{url('/barang-keyword')}}">
                        @csrf
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Data Barang</label>
                                <select name="barang" class="form-control">
                                    @foreach($barang as $brg)
                                    <option value="{{$brg->kode_barang}}">{{$brg->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Keyword</label>
                                <input type="text" class="form-control" name="keybarang[]" required>
                            </div>


                            <div id="dynamicInput"></div>
                            <button type="button" onClick="addInput('dynamicInput');" class="btn btn-warning"><i
                                    class="fa fa-plus"> Tambah Produk</i></button>
                        </div>

                        <div class="card-footer">
                            <button type="reset" onclick="history.go(-1)" class="btn btn-danger">Kembali</button>
                            <button type="submit" class="btn btn-primary float-right">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('customscripts')
<script language="Javascript" type="text/javascript">
//fungsi remove html
//====================================================
Element.prototype.remove = function() {
    this.parentElement.removeChild(this);
}
NodeList.prototype.remove = HTMLCollection.prototype.remove = function() {
    for (var i = this.length - 1; i >= 0; i--) {
        if (this[i] && this[i].parentElement) {
            this[i].parentElement.removeChild(this[i]);
        }
    }
}
//====================================================

var counter = 1; //variabel nomor inputan
var limit = 5; // limit

//fungsi tambah input
function addInput(divName) {

    if (counter == limit) {
        alert("Limit hanya " + counter + " inputan");
    } else {
        var newdiv = document.createElement('div');
        newdiv.innerHTML =
            '<div class="form-group" id="input' + counter + '">' +
            ' <label for="exampleInputEmail1">Keyword Lainya</label>' +
            '<div class="input-group mb-3">' +
            '<input type="text" class="form-control" name="keybarang[]" required>' +
            '<div class="input-group-append">' +
            '<button type="button" onclick="del('+counter+')" class="btn btn-danger"><i class="fa fa-minus"></i></button>' +
            '</div>' +
            '</div>' +
            '</div>';
        document.getElementById(divName).appendChild(newdiv);
        counter++;
    }
}
//fungsi hapus input
function del(no) {
    document.getElementById('input' + no).remove();
    counter = counter - 1;
    for (i = no; i <= limit; i++) {
        var id = document.getElementById('input' + i);
        if (id === null) {

        } else {

        }
    }
}
</script>
@endpush