<!-- Left navbar links -->
<ul class="navbar-nav">
    <li class="nav-item">
        <a href="{{url('/home')}}" class="nav-link">Home</a>
    </li>
    @if(Auth::user()->level!='Admin')
    <li class="nav-item">
        <a href="{{url('/admin')}}" class="nav-link">Admin</a>
    </li>
    <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
            class="nav-link dropdown-toggle">Master Data</a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
            <li><a href="{{url('/barang')}}" class="dropdown-item">Barang </a></li>
            <li><a href="{{url('/barang-keyword')}}" class="dropdown-item">Barang Keyword</a></li>
        </ul>
    </li>
    <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
            class="nav-link dropdown-toggle">Penyesuaian Stok</a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
            <li><a href="{{url('/barang-masuk')}}" class="dropdown-item">Barang Masuk</a></li>
            <li><a href="{{url('/barang-keluar')}}" class="dropdown-item">Barang Keluar</a></li>
        </ul>
    </li>
    @endif
    <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
            class="nav-link dropdown-toggle">Transaksi</a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
        <li><a href="{{url('transaksi-manual')}}" class="dropdown-item">Transaksi Manual</a></li>
            <li><a href="{{route('sc.view')}}" class="dropdown-item">Trx Scan Paket</a></li>
            <li><a href="{{route('im.lazada')}}" class="dropdown-item">Trx Lazada </a></li>
            <li><a href="{{route('im.shopee')}}" class="dropdown-item">Trx Shopee </a></li>
            <li><a href="{{route('brgnonlengkap')}}" class="dropdown-item">Import Barang Tidak Lengkap</a></li>
        </ul>
    </li>
    @if(Auth::user()->level!='Admin')
    <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
            class="nav-link dropdown-toggle">Laporan</a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
            <li><a href="{{route('list.trx')}}" class="dropdown-item">Data Trx </a></li>
            <li><a href="{{route('data.trx')}}" class="dropdown-item">Laporan Transaksi </a></li>
            <li><a href="{{route('lap.sc')}}" class="dropdown-item">Laporan Paket Scan </a></li>
        </ul>
    </li>
    @endif
</ul>
