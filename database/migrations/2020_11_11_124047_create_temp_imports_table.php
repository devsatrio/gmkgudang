<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTempImportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('temp_import', function (Blueprint $table) {
            $table->id();
            $table->string('noresi', 100);
            $table->string('sku', 100)->default('0');
            $table->string('skuindex', 100)->default('0');
            $table->string('barang', 100);
            $table->string('tgl', 100);
            $table->enum('sts_kirim', ['sudah','belum'])->default('belum');
            $table->enum('sts_valid', ['valid','belum'])->default('belum');
            $table->string('admin', 100);
            $table->integer('jumlah');
            $table->integer('harga');
            $table->integer('total');
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
        Schema::dropIfExists('temp_imports');
    }
}
