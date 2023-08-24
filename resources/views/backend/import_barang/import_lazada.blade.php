@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('customcss')
    <link rel="stylesheet" href="{{asset('assets/plugins/sweetalert2/sweetalert2.min.css')}}">
@endsection
@section('title')
    Lazada import
@endsection
@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark">Import Dari Lazada</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="container">
            @if (session('status'))
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" onclick="myStopFunction()" aria-hidden="true">×</button>
                <h4>Info!</h4>
                {{ session('status') }}
            </div>
            <audio id="audiotag1" class="output" src="../pristine-609.mp3" preload="auto"  allow="autoplay"></audio>
            <script>
            var myVar;
            window.addEventListener('load', () => {
				// noinspection JSUnresolvedVariable
				let audioCtx = new (window.AudioContext || window.webkitAudioContext)();
				let xhr = new XMLHttpRequest();
				xhr.open('GET', '../pristine-609.mp3');
				xhr.responseType = 'arraybuffer';
				xhr.addEventListener('load', () => {
					let playsound = (audioBuffer) => {
						let source = audioCtx.createBufferSource();
						source.buffer = audioBuffer;
						source.connect(audioCtx.destination);
						source.loop = false;
						source.start();

						myVar = setTimeout(function () {
							let t = document.createElement('p');
							t.appendChild(document.createTextNode((new Date()).toLocaleString() + ': Sound played'));
							document.querySelector('.output').appendChild(t);
							playsound(audioBuffer);
						}, 3000);
					};

					audioCtx.decodeAudioData(xhr.response).then(playsound);
				});
				xhr.send();
            });

            function myStopFunction() {
            clearTimeout(myVar);
            }
            </script>
            @endif
            <div class="row">
                <div class="col-12">
                    <div class=" card card-default">
                        <div class="card-header">
                            <div class="card-title">
                                import data dari lazada : <u>{{$desk}}</u>
                            </div>
                            <div class="card-tools">
                               <a href="#" data-target="#imprt" data-toggle="modal"><div class="badge badge-primary mr-2">import data</div></a>
                               <a href="{{route('datalazada',['Sudah-Lengkap'])}}" ><div class="badge badge-info mr-2">Barang Sudah Dilengkapi</div></a>
                               <a href="{{route('datalazada',['Non-Lengkap'])}}" ><div class="badge badge-danger mr-2">Barang Belum Lengkap</div></a>
                               {{-- <a href="{{route('datalazada',['Non-Stok'])}}" ><div class="badge badge-info mr-2">Barang Tidak Ada di Stok</div></a>
                               <a href="{{route('datalazada',['Non-Lengkap'])}}" ><div class="badge badge-danger mr-2">Barang Belum Lengkap</div></a> --}}
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <button style="display: none" id="btnacc" onclick="acc()" class="btn btn-primary float-right"><i class="fa fa-check"></i> Acc Transaksi</button>
                                    <a href="#" class="float-right mr-2" style="display: none" id="btnhapus" onclick="hapus()"  class="float-right"><div class="badge badge-danger"> <i class="fa fa-delete"></i> Hapus Data</div></a>
                                </div>
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Tgl</th>
                                                    <th>No Resi</th>
                                                    <th>SKU induk</th>
                                                    <th>Barang</th>
                                                    <th>varian</th>
                                                    <th>Jumlah</th>
                                                    <th>Harga</th>
                                                    <th>Total</th>
                                                    <th>
                                                        <input type="checkbox" id="ckb" class="checkbox-control" onclick="cekall()">
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php
                                                    $no=1;
                                                @endphp
                                                @foreach ($data as $item)
                                                    <tr>
                                                        <td>{{$no++}}</td>
                                                        <td>{{$item->tgl}}</td>
                                                        <td>{{$item->noresi}}</td>
                                                        <td>{{$item->skuindex}}</td>
                                                        <td>{{$item->barang}}</td>
                                                        <td>{{$item->varian}}</td>
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
    {{-- modal import --}}
    <div class="modal modal-primary fade" id="imprt">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Import Data Excel
                </div>
                <div class="modal-body">
                    <form action="{{route('importlazada')}}" method="post" enctype="multipart/form-data">
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
<script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
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
                $('#btnacc').attr('style','display:inline');
                $('#btnhapus').attr('style','display:inline');
            } else {
                $(".subck").prop('checked',false);
                $('#btnacc').attr('style','display:none');
                $('#btnhapus').attr('style','display:none');
            }
        }
        function ceksat() {
            if($('.subck').is(':checked',true)){
                $('#btnacc').attr('style','display:inline');
                $('#btnhapus').attr('style','display:inline');
            }else{
                $('#btnacc').attr('style','display:none');
                $('#btnhapus').attr('style','display:none');
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
                        url:'acc-lazada',
                        type:'post',
                        data:{ids:join_selected},
                        success:function(response){
                            if(response.sts="1"){
                                $("body").loading('stop');
                                // refreshCancel();
                                location.reload();
                            }
                        }
                    })
                }
            }
        }
    </script>
@endpush
