@extends('layouts/base')
@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('title')
    Scanner Paket
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
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">
                                <form class="inline">

                                </form>
                            </div>
                            <div class="card-tools">
                                <form class="form-inline">
                                    <div class="form-group mr-2">
                                        <label for="" class="mr-2">Masukan / Scan Kode</label>
                                    </div>
                                    <div class="form-group mr-2">
                                        <input type="text" style="widht:500px" class="form-control" id="scn" placeholder="Input Nomer Resi atau Barcode ">
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
                                                        <th>Status</th>

                                                        {{-- <th>
                                                            <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                                                        </th> --}}
                                                    </tr>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php
                                                    $no=1;
                                                @endphp
                                                {{-- @foreach ($data as $item)
                                                    <tr>
                                                        <td>{{$no++}}</td>
                                                        <td>{{$item->noresi}}</td>
                                                        <td>{{$item->skuindex}}</td>
                                           s             <td>{{$item->sku}}</td>
                                                        <td>{{$item->barang}}</td>
                                                        <td>{{$item->jumlah}}</td>
                                                        <td>{{number_format($item->harga)}}</td>
                                                        <td>{{number_format($item->total)}}</td>
                                                        <td>
                                                            <input type="checkbox" onclick="ceksat()" data-id="{{$item->id}}" class="checkbox-control subck">
                                                        </td>
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
    <script src="{{asset('loading/tableExport.js')}}"></script>
    <script>
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
                alert(kd);
                $('#scn').val('');
            }
    });
    </script>
@endpush
