@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
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
                                        <table class="table table-striped table-bordered">
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
                                                    {{-- <th>
                                                        <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                                                    </th> --}}
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
                                                        <td>{{number_format($item->harga)}}</td>
                                                        <td>{{number_format($item->total)}}</td>
                                                        {{-- <td>
                                                            <input type="checkbox" onclick="ceksat()" data-id="{{$item->id}}" class="checkbox-control subck">
                                                        </td> --}}
                                                    </tr>
                                                @endforeach
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
    <script>
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
@endpush
