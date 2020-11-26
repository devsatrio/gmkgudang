@extends('layouts/base')
@section('content')
<div class="content-header">
<div class="content">
    <div class="container text-center mt-5 pt-3">
    <section class="content">
      <div class="error-page">
        <h2 class="headline text-warning"> 500</h2>

        <div class="error-content">
          <h3><i class="fas fa-exclamation-triangle text-warning"></i> Oops! Internal server error.</h3>

          <p>
            Meanwhile, you may <a href="{{url('/home')}}">return to dashboard</a>
          </p>
        </div>
      </div>
    </section>
    </div>
</div>
@endsection