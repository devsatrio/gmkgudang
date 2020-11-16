<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBarangTrxesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('barang_trx', function (Blueprint $table) {
            $table->id();
            $table->string('noresi', 100);
            $table->string('sku', 100)->default('0');
            $table->string('skuindex', 100)->default('0');
            $table->string('barang', 100);
            $table->string('tgl', 100);
            $table->integer('jumlah');
            $table->integer('harga');
            $table->integer('total');
            $table->string('admin', 100);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('barang_trxes');
    }
}
