@extends('layouts/base')
@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('flatpicker/flatpicker.min.css')}}">
    {{-- <link rel="stylesheet" href="{{asset('loading/jquery.loading.min.css')}}"> --}}
@endsection
@section('title')
    Data Transaksi
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Data Transaksi Market Place</h1>
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
                                Data Pada Tanggal :   {{$tgl1}} sampai {{$tgl2}}
                            </div>
                            <div class="card-tools">
                                <form action="{{route('cari.data.trx')}}" method="get" class="form-inline">
                                    @csrf
                                    <div class="form-group mr-2">
                                        <input type="text" name="tgl1" id="tgl1" value="{{$tgl1}}" readonly class="form-control picker" >
                                    </div>
                                    <div class="form-group mr-2 ">
                                        s/d
                                    </div>
                                    <div class="form-group mr-2">
                                        <input type="text" name="tgl2" id="tgl2" value="{{$tgl2}}" readonly class="form-control picker" >
                                    </div>
                                    <div class="form-group">
                                        <Button type="submit" class="btn btn-primary mr-2"><i class="fa fa-search"></i></Button>
                                    </div>
                                    <div class="form-group">
                                        <Button id="btnexcel" type="button" class="btn btn-info"><i class="fa fa-file-excel"></i></Button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table  table-bordered" id="tablereport">
                                            {{-- <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>No Resi</th>
                                                    <th>SKU induk</th>
                                                    <th>SKU</th>
                                                    <th>Barang</th>
                                                    <th>Jumlah</th>
                                                    <th>Harga</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>  --}}
                                            <tbody>
                                                @foreach ($data as $item)
                                                    <tr class="bg-primary">
                                                        <td>Toko</td>
                                                        <td colspan="4">{{$item->admin}}</td>
                                                        <td class="bg-danger"></td>
                                                        @php
                                                            $detail=DB::table('barang_trx')->where('admin',$item->admin)->whereBetween('tgl',[$tgl1,$tgl2])->get();
                                                        @endphp
                                                        <tr class="bg-info">
                                                            <td>Kode</td>
                                                            <td>Market</td>
                                                            <td>Nama Barang</td>
                                                            <td>Qty</td>
                                                            <td>Harga</td>
                                                            <td>Jumlah</td>
                                                        </tr>
                                                        @foreach ($detail as $colect)
                                                            <tr>
                                                                <td>{{$colect->skuindex}}</td>
                                                                <td>{{$colect->jenis}}</td>
                                                                <td>{{$colect->barang}}</td>
                                                                <td>{{$colect->jumlah}}</td>
                                                                <td>{{number_format($colect->harga)}}</td>
                                                                <td>{{number_format($colect->total)}}</td>
                                                            </tr>
                                                        @endforeach
                                                    </tr>
                                                @endforeach
                                                {{-- @php
                                                    $no=1;
                                                @endphp
                                                @foreach ($data as $key=>$item)

                                                    <tr>
                                                        <td>{{$no++}}</td>
                                                        <td>{{$item->noresi}}</td>
                                                        <td>{{$item->skuindex}}</td>
                                                        <td>{{$item->sku}}</td>
                                                        <td>{{$item->barang}}</td>
                                                        <td>{{$item->jumlah}}</td>
                                                        <td>{{number_format($item->harga)}}</td>
                                                        <td>{{number_format
                                                        ($item->total)}}</td>
                                                    </tr>
                                                @endforeach --}}
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
    <script src="{{asset('flatpicker/flatpicker.min.js')}}"></script>
    {{-- <script src="{{asset('loading/jquery.loading.js')}}"></script> --}}
    <script>
        flatpickr(".picker",{
            dateFormat: "Y-m-d",
            "locale": "id",
        });
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
    //    create excel
    $(document).ready(function() {
        $('#btnexcel').click(function(e) {
        e.prevenDefault();
        var tgl1=$('#tgl1').val();
            var tgl2=$('#tgl2').val();
            // get data table
            var data_type='data:application/vnd.ms-excel';
            var tablediv=document.getElementById('#tablereport');
            var tblehtml=tablediv.outerHTML.replace(/ /g,'%20');

            var a=document.createElement('a');
            a.href=data_type + ', ' + tblehtml;
            a.download="Laporan Penjualan-" + tgl1 + "-sampai-" + tgl2+'.xls';
            a.click();
        });
    })


    </script>
@endpush
