@extends('layouts/base')
@section('token')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('title')
    Scanner Paket
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('flatpicker/flatpicker.min.css')}}">
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
                                    <a href="#navscan" data-toggle="pill" class="nav-link active" role="tab">Input Resi
                                        <div class="badge badge-info"><span id="n-navscan">0</span></div></a>
                                </li>
                                <li class="nav-item">
                                    <a href="#navscaned" data-toggle="pill" class="nav-link" role="tab">Data Paket
                                        Terkirim <div class="badge badge-info"><span id="n-navscaned">0</span></div></a>
                                </li>
                                <li class="nav-item">
                                    <a href="#navpending" onclick="getDataScan('pending','container_pending')" data-toggle="pill" class="nav-link" role="tab">Data Paket Pending</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#navbatal" onclick="getDataScan('batal','container_batal')" data-toggle="pill" class="nav-link" role="tab">Data Paket Batal</a>
                                </li>
                            </ul>
                            <div class="card-tools">
                                <div class="float-right mt-3">
                                    <div class="form-inline">
                                        <div class="form-group mr-2">
                                            <input type="hidden" value="scan" id="tjnis">
                                            <input type="text" name="tgl1" id="tgl1" value="{{date('Y-m-d')}}" readonly class="form-control picker" >
                                        </div>
                                        <div class="form-group mr-2 ">
                                            s/d
                                        </div>
                                        <div class="form-group mr-2">
                                            <input type="text" name="tgl2" id="tgl2" value="{{date('Y-m-d')}}" readonly class="form-control picker" >
                                        </div>
                                        <div class="form-group">
                                            <Button type="button" onclick="getData()" class="btn btn-primary mr-2"><i class="fa fa-search"></i></Button>
                                        </div>

                                    </div>
                                </div>
                            </div>
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
                                                        <input type="text" style="widht:500px" class="form-control"
                                                            id="scn" placeholder="Input Nomer Resi atau Barcode ">
                                                    </div>
                                                    <div class="form-group mr-2">
                                                        <input type="text" style="widht:500px" class="form-control mr-2" id="cresi" placeholder="Input Nomer Resi atau Barcode ">
                                                        <button onclick="cariResi('terkirim','container_terkirim')" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                                    </div>
                                                    <div class="form-group">
                                                        <a href="#" onclick="dnKiriman()" class="btn btn-success mr-2"><i class="fa fa-file-excel"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12" class="divload" id="container_scan">
                                            @include('backend.import_barang.data_scaner')
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="navscaned">
                                    <div class="row">
                                        <div class="col-12 mb-4">
                                           <div class="card-tools float-right">
                                            <div class="form-inline">

                                            </div>
                                           </div>
                                        </div>
                                        <div class="col-12" class="divload" id="container_terkirim">
                                            @include('backend.import_barang.data_scaner')
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="navpending">
                                    <div class="row">
                                        <div class="col-12" class="divload" id="container_pending">
                                            @include('backend.import_barang.data_scaner')
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="navbatal">
                                    <div class="row">
                                        <div class="col-12" class="divload" id="container_batal">
                                            @include('backend.import_barang.data_scaner')
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
    <script src="{{asset('flatpicker/flatpicker.min.js')}}"></script>
    <script src="{{asset('loading/tableExport.js')}}"></script>
    <script src="{{asset('loading/jquery.loading.js')}}"></script>
    <script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
    <script>
        flatpickr(".picker",{
            dateFormat: "Y-m-d",
        });
        $(document).ready(function(){
            getDataScan('scan','container_scan');
        });
        $(document).ready(function() {
            // getData();
            ambilSemua();
        });

        function ambilSemua() {
            setJenis('belum');
            setJenis('pending');
            setJenis('terkirim');
            setJenis('batal');
            setJenis('retur');
            listHitung();
        }
        // sweetalert
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-right',
            showConfirmButton: false,
            timer: 3000
        });
        $(function() {
            $(document).on('keypress', function() {
                $('#scn').focus();
            });
        });
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        // download KIriman
        function dnKiriman() {
            var tgl1=$('#tgl1').val();
            var tgl2=$('#tgl2').val();
            var jenis=$('#tjnis').val();
            // var etg=document.getElementById('tbl');
            $('#tscan').tableExport({
                format:'xls',
                filename:'Scan Barang - ' + jenis + ' - ' +tgl1+'-'+tgl2,
            });


        }
    //    create excel
    $('#scn').keypress(function(event) {
        var key=event.which;
            if(key==13){
                var kd=$('#scn').val();
                saveData(kd);
                $('#scn').val('');
            }
    });
    function cariResi(jns,idcontainer) {
        var cresi=$('#cresi').val();
        $('#'+idcontainer).loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
            $.ajax({
                url:'cari-scan-data/'+cresi ,
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
    function getData() {
        var jns=$('#tjnis').val();
        var idcontainer="";
        var tgl1=$('#tgl1').val();
        var tgl2=$('#tgl2').val();

        if(jns=="scan"){
            idcontainer="container_scan";
        }else if(jns=="terkirim"){
            idcontainer="container_terkirim";
        }else if(jns=="batal"){
            idcontainer="container_batal";
        }else if(jns=="pending"){
            idcontainer="container_pending";
        }
        $('#'+idcontainer).loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
            $.ajax({
                url:'get-scan-data/'+jns+'/'+tgl1+'/'+tgl2,
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
            $('#tjnis').val(jns);
            var tgl1=$('#tgl1').val();
            var tgl2=$('#tgl2').val();
            // document.getElementsByClassName('tbel')[0].id="t"+jns;
            // loading
            $('#'+idcontainer).loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
            $.ajax({
                url:'get-scan-data/'+jns+'/'+tgl1+'/'+tgl2,
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
        function upAdmin(id) {
            var adm=$('#scladmin').val();
            $.ajax({
                url:'up-scan-admin/'+id+'/'+adm,
                dataType:'json',
                type:'get',
                success:function(response){
                   if(response.sts=="1"){
                    Toast.fire({
                        type: 'success',
                        title: response.msg
                    });
                    window.location.reload();
                   }else{
                    Toast.fire({
                        type: 'error',
                        title: response.msg
                    });
                   }
                }
            });
        }
    </script>
@endpush

