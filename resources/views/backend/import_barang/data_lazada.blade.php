@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('assets/plugins/sweetalert2/sweetalert2.min.css')}}">
@endsection
@section('title')
    Lazada Data
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Data Lazada {{Request::segment(3)}}</h1>
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
                    <div class="card">
                        <div class="card-header">
                            <div class="card-tools">
                                <a href="{{route('exp.nostok.lazada',[Request::segment(3)])}}"  class="float-right"><div class="badge badge-info"> Download Data</div></a>
                                <a href="#" onclick="history.back()" class="float-right mr-2"><div class="badge badge-primary"> Kembali</div></a>
                                <a href="#" class="float-right mr-2" style="visibility: hidden" id="btnhapus" onclick="hapus()"  class="float-right"><div class="badge badge-danger"> <i class="fa fa-delete"></i> Hapus Data</div></a>

                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>No Resi</th>
                                                        <th>SKU induk</th>
                                                        <th>SKU</th>
                                                        <th>Barang</th>
                                                        <th>Jumlah</th>
                                                        <th>Harga</th>
                                                        <th>Total</th>
                                                        <th>
                                                            <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                                                        </th>
                                                    </tr>
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
                                                        <td>
                                                            <input type="checkbox" onclick="ceksat()" data-id="{{$item->id}}" class="checkbox-control subck">
                                                        </td>
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
<script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
@endpush
@push('customscripts')
    <script>
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            }
        });
         // sweetalert
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-right',
            showConfirmButton: false,
            timer: 3000
        });
        function cekall() {
            if($('#ckb').is(':checked',true))  {
                $(".subck").prop('checked', true);
                $('#btnhapus').attr('style',"visibility:show");
            } else {
                $(".subck").prop('checked',false);
                $('#btnhapus').attr('style',"visibility:hidden");
            }
        }
        function ceksat() {
            if($('.subck').is(':checked',true)){
                $('#btnhapus').attr('style',"visibility:show");
            }else{
                $('#btnhapus').attr('style',"visibility:hidden");
            }
        }
        function hapus() {
            var allVals=[];
            $('.subck:checked').each(function() {
                allVals.push($(this).attr('data-id'))
            });
            if(allVals.length<=0){
                alert('Pilih Salah Satu Data');
            }else{
                console.log(allVals);
                // var conf=confirm("Apakah anda ingin Proses Data ini?");
                Swal.fire({
                    type:'warning',
                    title:'Peringatan!',
                    text:'Apakah Anda Yakin Menghapus Data Ini ? ',
                    showCancelButton:true,
                    cancelButtonColor:'#d33',
                    confirmButtonColor:'#3085d6',
                    confirmButtonText:'Proses'
                }).then(function(result){
                    if(result.value){
                        // acc pasien
                        var join_selected=allVals.join(",");
                        $.ajax({
                            url:"{{route('del.temp')}}",
                            type:'post',
                            data:{norawat:join_selected},
                            success:function(response){
                                if(response.sts="1"){
                                    Toast.fire({
                                        type: 'success',
                                        title: response.msg
                                    });
                                    location.reload();
                                }else{
                                    Toast.fire({
                                        type: 'error',
                                        title: response.msg
                                    });
                                }
                            }
                        });
                    }
                });
            }
        }
    </script>
@endpush
