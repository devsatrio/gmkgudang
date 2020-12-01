@extends('layouts/base')
@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('title')
    Scanner Paket
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('assets/plugins/sweetalert2/sweetalert2.min.css')}}">
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Scanner Paket Berangkat</h1>
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
                    <div class="card card-primary card-outline card-tabs">
                        <div class="card-header">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a href="#navscan" onclick="getDataScan('scan','container_scan')" data-toggle="pill" class="nav-link active" role="tab">Scan Paket</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#navscaned" onclick="getDataScan('terkirim','container_terkirim')" data-toggle="pill" class="nav-link" role="tab">Data Paket Terkirim</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#navbatal" onclick="getDataScan('batal','container_batal')" data-toggle="pill" class="nav-link" role="tab">Data Paket Batal</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="navscan">
                                    <div class="row">
                                        <div class="col-12 mb-4">
                                            <div class="card-tools float-right">
                                                <div class="form-inline">
                                                    <div class="form-group mr-2">
                                                        <label for="" class="mr-2">Masukan / Scan Kode</label>
                                                    </div>
                                                    <div class="form-group mr-2">
                                                        <input type="text" style="widht:500px" class="form-control" id="scn" placeholder="Input Nomer Resi atau Barcode ">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12" class="divload" id="container_scan">
                                            @include('backend.import_barang.data_scan')
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="navscaned">
                                    <div class="row">
                                        <div class="col-12" class="divload" id="container_terkirim">
                                            @include('backend.import_barang.data_scan')
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="navbatal">
                                    <div class="row">
                                        <div class="col-12" class="divload" id="container_batal">
                                            @include('backend.import_barang.data_scan')
                                        </div>
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
    <script src="{{asset('loading/tableExport.js')}}"></script>
    <script src="{{asset('loading/jquery.loading.js')}}"></script>
    <script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
    <script>
        $(document).ready(function(){
            getDataScan('scan','container_scan');
        });
        // sweetalert
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-right',
            showConfirmButton: false,
            timer: 3000
        });
        $(function() {
            $(document).on('keypress',function(){
                $('#scn').focus();
            });
        });
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
    //    create excel
    $('#scn').keypress(function(event) {
        var key=event.which;
            if(key==13){
                var kd=$('#scn').val();
                saveData(kd);
                $('#scn').val('');
            }
    });
    function saveData(kd) {
        $.ajax({
            url:'simpan-scan',
            dataType:'json',
            type:'post',
            data:{noresi:kd},
            success:function(response){
                if(response.sts=="1"){
                    Toast.fire({
                        type: 'success',
                        title: response.msg
                    });
                    getDataScan('scan','container_scan');
                }else if(response.sts=="2"){
                    Swal.fire({
                        type:'warning',
                        title:'Peringatan!',
                        text:'Barang Ini Sudah Discan Atau Terkirim, Konfirmasi Status Batal Untuk Barang Ini ? ',
                        showCancelButton:true,
                        cancelButtonColor:'#3085d6',
                        confirmButtonColor:'#d33',
                        confirmButtonText:'Ya, Batalkan'
                    }).then(function(result){
                        if(result.value){
                            // batal barang
                            $.ajax({
                                url:'batal-scan/'+kd,
                                type:'get',
                                dataType:'json',
                                success:function(response){
                                    if(response.sts=="1"){
                                        Toast.fire({
                                            type: 'success',
                                            title: response.msg
                                        });
                                        getDataScan('scan','container_scan');
                                    }else{
                                        Toast.fire({
                                            type: 'error',
                                            title: response.msg
                                        });
                                    }
                                }
                            })
                        }
                    });
                }else{
                    Swal.fire({
                        type:'warning',
                        title:'Peringatan!',
                        text:response.msg,
                    });
                }
            }
        })
    }
    function getDataScan(jns,idcontainer) {

            // loading
            $('#'+idcontainer).loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
            $.ajax({
                url:'get-scan-data/'+jns,
                dataType:'html',
                type:'get',
            }).done(function(data){
                $('#'+idcontainer).empty().html(data);
                $('#'+idcontainer).loading('stop');
            }).fail(function(jqXHR, ajaxOptions, thrownError){
            // alert('Load Data Gagal');
            Toast.fire({
                type: 'error',
                title: 'Load Data Gagal!'
            });
                $('#'+idcontainer).loading('stop');
            });
        }
    </script>
@endpush
