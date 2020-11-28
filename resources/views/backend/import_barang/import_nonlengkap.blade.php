@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('title')
    Import Non Lengkap
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Import Non Lengkap</h1>
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
                                import data Belum Lengkap : <b> {{$judul}}</b>
                            </div>
                            <div class="card-tools">
                            @if ($jns=="fix")
                                <a href="#" data-target="#imprt" data-toggle="modal"><div class="badge badge-primary mr-2">import data</div></a>
                            {{-- <a href="{{route('datalazada',['Non-Stok'])}}" ><div class="badge badge-info mr-2">Barang Sudah Di Perbaiki</div></a> --}}
                                <a href="{{route('nnst')}}" ><div class="badge badge-danger mr-2">Barang Sudah Di Perbaiki Non Stok</div></a>
                            @else
                                <a href="{{route('exp.nsnl')}}"  class="float-right"><div class="badge badge-info"> Download Data</div></a>
                                <a href="#" onclick="history.back()" class="float-right mr-2"><div class="badge badge-primary"> Kembali</div></a>
                            @endif
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <button style="display: none" id="btnacc" onclick="acc()" class="btn btn-primary float-right"><i class="fa fa-check"></i> Acc Transaksi</button>
                                </div>
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    {{-- <th>Kode Barang</th> --}}
                                                    @if ($jns=='fix')
                                                        <th>Barang</th>
                                                        <th>SKU induk</th>
                                                        <th>SKU</th>
                                                        <th>Jumlah</th>
                                                        <th>Harga</th>
                                                        <th>Total</th>
                                                        <th>
                                                            <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                                                        </th>
                                                    @else
                                                        <th>Kode Barang</th>
                                                        <th>SKU induk</th>
                                                        <th>sku</td>
                                                        <th>Barang</th>
                                                    @endif

                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php
                                                    $no=1;
                                                @endphp
                                                @foreach ($data as $item)
                                                    <tr>
                                                        <td>{{$no++}}</td>
                                                        {{-- <td>{{$item->kode_barang}}</td> --}}
                                                        @if ($jns=="fix")
                                                            <td>{{$item->barang}}</td>
                                                            <td>{{$item->skuindex}}</td>
                                                            <td>{{$item->sku}}</td>
                                                            <td>{{$item->jumlah}}</td>
                                                            <td>{{number_format($item->harga)}}</td>
                                                            <td>{{number_format($item->total)}}</td>
                                                            <td>
                                                                <input type="checkbox" onclick="ceksat()" data-id="{{$item->id}}" class="checkbox-control subck">
                                                            </td>
                                                        @else
                                                            <td>{{$item->kode_barang}}</td>
                                                            <td>{{$item->skuinduk}}</td>
                                                            <td>{{$item->sku}}</td>
                                                            <td>{{$item->key_barang}}</td>
                                                        @endif
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
    {{-- modal import --}}
    <div class="modal modal-primary fade" id="imprt">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Import Data Excel
                </div>
                <div class="modal-body">
                    <form action="{{route('importnonlengkap')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="">Cari File Excel</label>
                            <input type="file" name="file" required class="form-control">
                        </div>
                        <div class="form-group">
                            <button data-dismiss="modal" class="btn btn-danger float-right mr-2 ">Tutup</button>
                            <input type="submit" value="Import Data" class="btn btn-primary float-right mr-2 ">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('customjs')
<script src="{{asset('loading/jquery.loading.js')}}"></script>
    <script>
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
         function cekall() {
            if($('#ckb').is(':checked',true))  {
                $(".subck").prop('checked', true);
                $('#btnacc').attr('style','display:inline');
            } else {
                $(".subck").prop('checked',false);
                $('#btnacc').attr('style','display:none');
            }
        }
        function ceksat() {
            if($('.subck').is(':checked',true)){
                $('#btnacc').attr('style','display:inline');
            }else{
                $('#btnacc').attr('style','display:none');
            }
        }
        function acc() {
            var idvall=[];
            $('.subck:checked').each(function() {
                idvall.push($(this).attr('data-id'))
            });
            if(idvall.length<=0){
                alert('Pilih Salah Satu Data');
            }else{
                var conf=confirm("Apakah anda ingin ACC Data ini?");
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
                        url:'acc-nonlengkap',
                        type:'post',
                        data:{ids:join_selected},
                        success:function(response){
                            if(response.sts="1"){
                                // refreshCancel();
                                $("body").loading('stop');
                                location.reload();
                            }
                        }
                    })
                }
            }
        }
    </script>
@endpush
