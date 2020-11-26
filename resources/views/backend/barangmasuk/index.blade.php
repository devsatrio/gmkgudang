@extends('layouts/base')

@section('token')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('customcss')
<link rel="stylesheet" href="{{asset('assets/plugins/datatables-bs4/css/dataTables.bootstrap4.css')}}">
<link rel="stylesheet" href="{{asset('assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css')}}">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
@endsection

@section('content')
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-12">
                <h1 class="m-0 text-dark"> Barang Masuk</h1>
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
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Data Barang Masuk</h3>
                        <div class="card-tools">
                            <a href="{{url('/barang-masuk/create')}}">
                                <button type="button" class="btn btn-default btn-sm"><i class="fas fa-plus"></i> Tambah
                                    Data
                                </button>
                            </a>
                            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#carilaporan"><i class="fas fa-file"></i> Laporan
                                </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="list-data" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Barang</th>
                                        <th>Jumlah</th>
                                        <th>Harga</th>
                                        <th>Total</th>
                                        <th>Tanggal</th>
                                        <th>Keterangan</th>
                                        <th class="text-center">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Barang</th>
                                        <th>Jumlah</th>
                                        <th>Harga</th>
                                        <th>Total</th>
                                        <th>Tanggal</th>
                                        <th>Keterangan</th>
                                        <th class="text-center">Aksi</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="carilaporan" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tampil Laporan Berdasarkan Tanggal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{url('/barang-masuk/laporan')}}" method="get">
      <div class="modal-body">
        <div class="form-group">
        <label>Dari Tanggal</label>
        <input type="date" name="tglsatu" class="form-control" required>
        </div>
        <div class="form-group">
        <label>Sampai Tanggal</label>
        <input type="date" name="tgldua" class="form-control" required>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
      
    </div>
  </div>
</div>
@endsection

@push('customjs')
<script src="{{asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/jquery.dataTables.js')}}"></script>
<script src="{{asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.js')}}"></script>

<script src="{{asset('assets/plugins/datatables/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/buttons.flash.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/jszip.min.js')}}"></script>

<script src="{{asset('assets/plugins/datatables/pdfmake.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/vfs_fonts.js')}}"></script>

<script src="{{asset('assets/plugins/datatables/buttons.html5.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables/buttons.print.min.js')}}"></script>
@endpush

@push('customscripts')
<script src="{{asset('customjs/backend/barangmasuk.js')}}"></script>
@endpush