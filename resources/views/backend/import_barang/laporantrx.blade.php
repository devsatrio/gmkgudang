@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
<link rel="stylesheet" href="{{asset('assets/plugins/datatables-bs4/css/dataTables.bootstrap4.css')}}">
<link rel="stylesheet" href="{{asset('assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css')}}">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
@endsection
@section('title')
    Laporan Transaksi
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Laporan Transaksi Market Online</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="container">
            @if (session('status'))
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>Info!</h4>
                {{ session('status') }}
            </div>
            @endif
            <div class="row">
                <div class="col-12">
                    <div class=" card card-default">
                        <div class="card-header">
                            <div class="card-title">
                               Laporan Trx Market
                            </div>
                            {{-- <div class="card-tools">
                               <a href="#" data-target="#imprt" data-toggle="modal"><div class="badge badge-primary mr-2">import data</div></a>
                               <a href="{{route('datalazada',['Non-Stok'])}}" ><div class="badge badge-info mr-2">Barang Tidak Ada di Stok</div></a>
                               <a href="{{route('datalazada',['Non-Lengkap'])}}" ><div class="badge badge-danger mr-2">Barang Belum Lengkap</div></a>
                            </div> --}}
                        </div>
                        <div class="card-body">
                            <div class="row">
                                {{-- <div class="col-12 mb-3">
                                    <button style="display: none" id="btnacc" onclick="acc()" class="btn btn-primary float-right"><i class="fa fa-check"></i> Acc Transaksi</button>
                                </div> --}}
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
                                                    {{-- <th>
                                                        <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                                                    </th> --}}
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('customjs')
<script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/jquery.dataTables.js')}}"></script>
<script src="{{asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.js')}}"></script>

<script src="{{asset('assets/plugins/datatables/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/buttons.flash.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/jszip.min.js')}}"></script>

<script src="{{asset('assets/plugins/datatables/pdfmake.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/vfs_fonts.js')}}"></script>

<script src="{{asset('assets/plugins/datatables/buttons.html5.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/buttons.print.min.js')}}"></script>
@endpush

@push('customscripts')
<script>
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
<script src="{{asset('customjs/backend/laporan.js')}}"></script>
@endpush
