@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('flatpicker/flatpicker.min.css')}}">
@endsection
@section('title')
    List Data Transaksi
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">List Transaksi Market Online</h1>
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
                               List Trx Market
                            </div>
                            <div class="card-tools">
                                <form class="form-inline">
                                    @csrf
                                    <div class="form-group mr-2">
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
                                    <div class="form-group mr-2">
                                        <input type="text" id="cari" class="form-control" placeholder="Cari Noresi , Barang">
                                    </div>
                                    <div class="form-group">
                                        <Button type="button" onclick="cariBarang()" class="btn btn-primary mr-2"><i class="fa fa-search"></i></Button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card-body"  id="tag_container">
                            @include('backend.import_barang.data_laporantrx')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('customjs')
<script src="{{asset('flatpicker/flatpicker.min.js')}}"></script>
<script src="{{asset('loading/jquery.loading.js')}}"></script>
<script src="{{asset('loading/tableExport.js')}}"></script>
@endpush

@push('customscripts')
<script>
        $(document).ready(function(){
            getData();
        });
        flatpickr(".picker",{
            dateFormat: "Y-m-d",
            "locale": "id",
        });
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
        function cekall() {
            if($('#ckb').is(':checked',true))  {
                $(".subck").prop('checked', true);
                $('#btarik').attr('style','display:inline');
            } else {
                $(".subck").prop('checked',false);
                $('#btarik').attr('style','display:none');
            }
        }
        function ceksat() {
            if($('.subck').is(':checked',true)){
                $('#btarik').attr('style','display:inline');
            }else{
                $('#btarik').attr('style','display:none');
            }
        }
        function getData() {
            var tgl1=$('#tgl1').val();
            var tgl2=$('#tgl2').val();
            // loading
            $("body").loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
            $.ajax({
                url:'cari-list-trx/'+tgl1+'/'+tgl2,
                dataType:'html',
                type:'get',
            }).done(function(data){
                $('#tag_container').empty().html(data);
                $("body").loading('stop');
            }).fail(function(jqXHR, ajaxOptions, thrownError){
            alert('Load Data Gagal');
                $("body").loading('stop');
            });
        }
        function cariBarang() {
            var noresi=$('#cari').val();
            // loading
            $("body").loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
            $.ajax({
                url:'cari-noresi/'+noresi,
                dataType:'html',
                type:'get',
            }).done(function(data){
                $('#tag_container').empty().html(data);
                $("body").loading('stop');
            }).fail(function(jqXHR, ajaxOptions, thrownError){
            alert('Load Data Gagal');
                $("body").loading('stop');
            });
        }
        function dcancel() {
            var idvall=[];
            $('.subck:checked').each(function() {
                idvall.push($(this).attr('data-id'))
            });
            if(idvall.length<=0){
                alert('Pilih Salah Satu Data');
            }else{
                var conf=confirm("Apakah anda ingin Batal Data ini?");
                if(conf){
                    // loading
                    $("body").loading({
                    stoppable: true,
                    message: "Please wait .....",
                    theme: "dark"
                    });
                    var join_selected=idvall.join(",");
                    console.log(join_selected);
                    $.ajax({
                        url:'batal-trx',
                        type:'post',
                        data:{ids:join_selected},
                        success:function(response){
                            if(response.sts="1"){
                                $("body").loading('stop');
                                // cariBarang();
                                getData();
                            }
                        }
                    })
                }
            }
        }
    </script>
@endpush
