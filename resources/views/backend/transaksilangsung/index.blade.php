@extends('layouts/base')
@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('customcss')
<link rel="stylesheet" href="{{asset('assets/plugins/select2/css/select2.min.css')}}">
<link rel="stylesheet" href="{{asset('assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css')}}">
@endsection
@section('content')
<div class="content-header">
    <div class="container">
        <div class="row mb-2 mt-3">
            <div class="col-sm-12 text-center">
                <h1 class="m-0 text-dark"> Transaksi Manual</h1>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div class="container-fluit">
        <div class="row pl-4 pr-4">
            <div class="col-12">
                @if (session('status'))
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4>Info!</h4>
                    {{ session('status') }}
                </div>
                @endif
            </div>
        </div>
        <form method="POST" class="row pl-4 pr-4" enctype="multipart/form-data" onsubmit="return validform()" action="{{url('transaksi-manual')}}">
            <div class="col-md-5">
                <div class="card card-outline card-primary" id="panelnya">
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">No. Resi</label>
                                    <input type="text" class="form-control" name="resi" id="resi" required autofocus>
                                    <input type="hidden" name="admin" value="{{Auth::user()->id}}" id="admin">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Admin</label>
                                    <select name="admin" class="form-control">
                                        @foreach($admin as $adm)
                                        <option value="{{$adm->username}}">{{$adm->username}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tipe</label>
                                    <select name="tipe" class="form-control">
                                        <option value="shopee">Shoope</option>
                                        <option value="lazada">Lazada</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tanggal</label>
                                    <input type="date" class="form-control" name="tgl" value="{{date('Y-m-d')}}"
                                        required>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Produk</label>
                                <div class="nk-int-st">
                                    <select name="produk" class="form-control select2">
                                        @foreach($barang as $brg)
                                        <option value="{{$brg->id}}">{{$brg->kode_barang}} - {{$brg->nama}}</option>
                                        @endforeach
                                    </select>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <label>Nama Barang</label>
                                <div class="nk-int-st">
                                    <input type="text" class="form-control" name="nama_barang" id="nama_barang">
                                </div>
                            </div>

                        </div>
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <label>Stok</label>
                                <div class="nk-int-st">
                                    <input type="number" readonly class="form-control" name="stok" id="stok">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Jumlah</label>
                                <div class="nk-int-st">
                                    <input type="number" min="0" class="form-control" id="jumlah" name="jumlah">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Harga</label>
                                <div class="nk-int-st">
                                    <input type="number" class="form-control" name="harga" id="harga">
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5">
                        <div class="col-md-6">
                                <label>SKU Induk</label>
                                <div class="nk-int-st">
                                    <input type="text" readonly class="form-control" name="sku_induk" id="sku_induk">
                                </div>

                            </div>
                            <div class="col-md-6">
                                <label>SKU</label>
                                <div class="nk-int-st">
                                    <input type="text" class="form-control" name="sku" id="sku">
                                </div>

                            </div>
                            
                        </div>
                    </div>

                    <div class="card-footer">
                        <button type="button" id="btnsimpan" class="btn btn-primary float-right">Tambah Produk <i
                                class="fa fa-arrow-right"></i></button>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card card-outline card-primary" id="paneldua">
                    <div class="card-body">
                        <div class="table-responsive">

                            <table class="table table-hover text-nowrap">
                                <thead>
                                    <tr>
                                        <th>SKU</th>
                                        <th>SKU Induk</th>
                                        <th>Produk</th>
                                        <th>Harga</th>
                                        <th>Qty</th>
                                        <th>Subtotal</th>
                                        <th class="text-center">#</th>
                                    </tr>
                                </thead>
                                <tbody id="tubuh">

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5"><b>Total</b></td>
                                        <td class="text-right"><span id="total"></span></td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-lg btn-danger" type="button" onclick="history.go(-1)">Kembali</button>
                        <button class="btn btn-lg btn-success" type="submit" id="simpanbtn">Simpan</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
@push('customjs')
<script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
<script src="{{asset('assets/plugins/select2/js/select2.full.min.js')}}"></script>
<script src="{{asset('loading/jquery.loading.js')}}"></script>
@endpush

@push('customscripts')
<script src="{{asset('customjs/backend/transaksilangsung.js')}}"></script>
@endpush