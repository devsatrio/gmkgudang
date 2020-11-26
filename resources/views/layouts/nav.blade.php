<!-- Left navbar links -->
<ul class="navbar-nav">
    <li class="nav-item">
        <a href="{{url('/home')}}" class="nav-link">Home</a>
    </li>
    @if(Auth::user()->level=='admin')
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
            <li><a href="{{route('im.lazada')}}" class="dropdown-item">Trx Lazada </a></li>
            <li><a href="{{route('im.shopee')}}" class="dropdown-item">Trx Shopee </a></li>
            <li><a href="{{route('brgnonlengkap')}}" class="dropdown-item">Import Barang Tidak Lengkap</a></li>
        </ul>
    </li>
    <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
            class="nav-link dropdown-toggle">Laporan</a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
            <li><a href="{{route('laporan.trx')}}" class="dropdown-item">Laporan Trx </a></li>
        </ul>
    </li>
</ul>