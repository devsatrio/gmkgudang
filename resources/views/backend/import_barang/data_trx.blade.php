@extends('layouts/base')
@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('flatpicker/flatpicker.min.css')}}">
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
                                        <Button id="btnexcel" onclick="printd()" type="button" class="btn btn-info"><i class="fa fa-file-excel"></i></Button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table  table-bordered" id="tablereport">
                                            <tbody>
                                                {{-- <tr>
                                                    <td colspan="6" align="center"> <b>Laporan GMK Market Place  Tanggal &nbsp; {{$tgl1}} sampai {{$tgl2}} </b></td>
                                                </tr> --}}
                                                @foreach ($data as $item)
                                                    <tr class="bg-primary">
                                                        <td>Toko</td>
                                                        <td colspan="7">{{$item->admin}}</td>
                                                        <td class="bg-danger"></td>
                                                        @php
                                                            $detail=DB::table('barang_trx')->leftjoin('barang','barang.kode_barang','=','barang_trx.skuindex')
                                                                    ->select(DB::raw('barang.*,barang.harga as hpp,barang_trx.*'))
                                                                    ->where('admin',$item->admin)->whereBetween('tgl',[$tgl1,$tgl2])
                                                                    ->get();
                                                        @endphp
                                                        <tr class="bg-info">
                                                            <td>Kode</td>
                                                            <td>Market</td>
                                                            <td>Nama Barang</td>
                                                            <td>Qty</td>
                                                            <td>HPP</td>
                                                            <td>Harga</td>
                                                            <td>Total HPP</td>
                                                            <td>Total Jual</td>
                                                            <td>Keuntungan</td>
                                                        </tr>
                                                        @php
                                                            $total=0;
                                                            $qty=0;
                                                            $tothp=0;
                                                            $tojual=0;
                                                            $tount=0;
                                                        @endphp
                                                        @foreach ($detail as $colect)
                                                        @php
                                                            $total=$total+$colect->total;
                                                            $qty=$qty+$colect->jumlah;
                                                            $thp=$colect->hpp*$colect->jumlah;
                                                            $tjual=$colect->harga*$colect->jumlah;
                                                            $tunt=($colect->harga*$colect->jumlah)-($colect->hpp*$colect->jumlah);
                                                            $tothp=$tothp+$thp;
                                                            $tojual=$tojual+$tjual;
                                                            $tount=$tount+$tunt;
                                                        @endphp
                                                            <tr>
                                                                <td>{{$colect->skuindex}}</td>
                                                                <td>{{$colect->jenis}}</td>
                                                                <td>{{$colect->barang}}</td>
                                                                <td>{{$colect->jumlah}}</td>
                                                                <td>{{$colect->hpp}}</td>
                                                                <td>{{$colect->harga}}</td>
                                                                <td>{{$thp}}</td>
                                                                <td>{{$tjual}}</td>
                                                                <td>{{$tunt}}</td>
                                                                {{-- <td>{{number_format($colect->harga,0,',','.')}}</td> --}}
                                                            </tr>
                                                        @endforeach
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td align="center"> <b>Total Penjualan</b></td>
                                                            <td>{{$qty}}</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td>{{$tothp}}</td>
                                                            <td>{{$tojual}}</td>
                                                            <td>{{$tount}}</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="9"></td>
                                                        </tr>
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
    <script src="{{asset('flatpicker/flatpicker.min.js')}}"></script>
    <script src="{{asset('loading/tableExport.js')}}"></script>
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
        function printd() {
            var tgl1=$('#tgl1').val();
            var tgl2=$('#tgl2').val();
            // get data table
            $('#tablereport').tableExport({
               format:'xls',
               filename:'report-'+tgl1+'-'+tgl2,
            });
        }


    </script>
@endpush
