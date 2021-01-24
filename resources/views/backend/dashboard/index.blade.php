@extends('layouts/base')
@section('content')
<div class="content-header">
    <div class="container">
        <div class="row mb-2">

            <div class="col-sm-12">
                <h1 class="m-0 text-dark"> Dashboard<small> GMK Gudang</small></h1>
                <span>You are loggin as {{Auth::user()->level}}</span>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div class="container">
        <div class="row">
            @if (session('status'))
            <div class="col-sm-12">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4>Info!</h4>
                    {{ session('status') }}
                </div>
            </div>
            @endif
            <div class="col-lg-3 col-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        @php
                        $totalscan=DB::table('barang_scan')->where('stts','!=','batal')->count();
                        @endphp
                        <h3>{{$totalscan}}</h3>

                        <p>Data Scan Paket</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-file"></i>
                    </div>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-success">
                    <div class="inner">
                        @php
                        $totalscanterkirim=DB::table('barang_scan')->where('stts','=','terkirim')->count();
                        @endphp
                        <h3>{{$totalscanterkirim}}</h3>

                        <p>Data Paket Terkirim</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-truck"></i>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-warning">
                    <div class="inner">
                        @php
                        $temp=DB::table('temp_import')->get();
                        $resi=[];
                        foreach($temp as $gl){
                        $resi[]=$gl->noresi;
                        }
                        $datapending=DB::table('barang_scan')->whereIn('noresi',$resi)->count();
                        @endphp
                        <h3>{{$datapending}}</h3>

                        <p>Data Paket Pending</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-hourglass"></i>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-danger">
                    <div class="inner">
                        @php
                        $totalscanbatal=DB::table('barang_scan')->where('stts','=','batal')->count();
                        @endphp
                        <h3>{{$totalscanbatal}}</h3>

                        <p>Data Paket Batal</p>
                    </div>
                    <div class="icon">
                        <i class="fa fa-frown"></i>
                    </div>
                </div>
            </div>
            <!-- ./col -->
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Transaksi Shopee</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0" style="display: block;">
                        <div class="table-responsive">
                            <table class="table m-0">
                                <thead>
                                    <tr>
                                        <th>No. Resi</th>
                                        <th>Barang</th>
                                        <th>Tgl</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                    $listshopee=DB::table('temp_import')->where('jenis','=','shopee')->orderby('id','desc')->limit(6)->get();
                                    @endphp
                                    @foreach($listshopee as $ls)
                                    <tr>
                                        <td>{{$ls->noresi}}</td>
                                        <td>{{$ls->barang}}</td>
                                        <td>{{$ls->tgl}}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer clearfix" style="display: block;">
                        @php
                        $totalshopee=DB::table('temp_import')->where('jenis','=','shopee')->count();
                        @endphp
                        Total Data <b>{{$totalshopee}}</b>
                        <a href="{{url('import-data/v-shopee')}}" class="btn btn-sm btn-secondary float-right">View
                            All</a>
                    </div>
                    <!-- /.card-footer -->
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header border-transparent">
                        <h3 class="card-title">Transaksi Lazada</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0" style="display: block;">
                        <div class="table-responsive">
                            <table class="table m-0">
                                <thead>
                                    <tr>
                                        <th>No. Resi</th>
                                        <th>Barang</th>
                                        <th>Tgl</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                    $listshopee=DB::table('temp_import')->where('jenis','=','lazada')->orderby('id','desc')->limit(6)->get();
                                    @endphp
                                    @foreach($listshopee as $ls)
                                    <tr>
                                        <td>{{$ls->noresi}}</td>
                                        <td>{{$ls->barang}}</td>
                                        <td>{{$ls->tgl}}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix" style="display: block;">
                        @php
                        $totalshopee=DB::table('temp_import')->where('jenis','=','lazada')->count();
                        @endphp
                        Total Data <b>{{$totalshopee}}</b>
                        <a href="{{url('import-data/v-lazada')}}" class="btn btn-sm btn-secondary float-right">View
                            All</a>
                    </div>
                    <!-- /.card-footer -->
                </div>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</div>
@endsection