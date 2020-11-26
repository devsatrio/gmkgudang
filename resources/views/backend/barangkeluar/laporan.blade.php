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
                <h1 class="m-0 text-dark">Laporan Barang Keluar</h1>
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
                        <h3 class="card-title">Data Barang Keluar Tanggal {{$_GET['tglsatu']}} Sampai {{$_GET['tgldua']}}</h3>
                        <div class="card-tools">
                            
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
                                    </tr>
                                </thead>
                                <tbody>
                                @php $i=1; @endphp
                                @foreach($data as $row)
                                <tr>
                                    <td>{{$i++}}</td>
                                    <td>{{$row->kode}}</td>
                                    <td>{{$row->nama}}</td>
                                    <td>{{$row->jumlah}} Pcs</td>
                                    <td>{{"Rp " . number_format($row->harga,0,',','.')}}</td>
                                    <td>{{"Rp " . number_format($row->total,0,',','.')}}</td>
                                    <td>{{$row->tanggal}}</td>
                                    <td>{{$row->keterangan}}</td>
                                </tr>
                                @endforeach
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
<script>

$(function () {
    $('#list-data').DataTable({
        dom: 'Blfrtip',
        pageLength: 20,
        buttons : [
            {extend: 'pdf', title:'Data Barang Masuk <?php echo $_GET['tglsatu'].'-'.$_GET['tgldua'];?>',exportOptions: {
                columns: [0,1,2,3,4,5,6,7]
            }},
            {extend: 'excel', title: 'Data Barang Masuk <?php echo $_GET['tglsatu'].'-'.$_GET['tgldua'];?>',exportOptions: {
                columns: [0,1,2,3,4,5,6,7]
            }},
            {extend:'print',title: 'Data Barang Masuk <?php echo $_GET['tglsatu'].'-'.$_GET['tgldua'];?>',exportOptions: {
                columns: [0,1,2,3,4,5,6,7]
            }},
        ],
        lengthMenu: [[5, 10, 20], [5, 10, 20]]
    });

});
</script>
@endpush