@extends('layouts/base')
@section('content')
<div class="content-header">
<div class="content">
    <div class="container text-center mt-5 pt-3">
    <section class="content">
      <div class="error-page">
        <h2 class="headline text-warning"> 500</h2>

        <div class="error-content">
          <h3><i class="fas fa-exclamation-triangle text-warning"></i> Oops! Page not found.</h3>

          <p>
            We could not find the page you were looking for.
            Meanwhile, you may <a href="{{url('/home')}}">return to dashboard</a> or try using the search form.
          </p>
        </div>
      </div>
    </section>
    </div>
</div>
@endsection