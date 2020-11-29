@extends('layouts/base')
@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('flatpicker/flatpicker.min.css')}}">
@endsection
@section('title')
    Laporan Scan
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Laporan Scan</h1>
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
                            @include('backend.import_barang.data_scan')
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
