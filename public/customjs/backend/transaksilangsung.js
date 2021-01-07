
  $(function () {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: true
    })
    $('.select2').select2();

    $(".select2").val(null).trigger('change');

    //=================================================
	$('.select2').on('select2:select',function(e){
		$('#panelnya').loading('toggle');
			var kode = $(this).val();
			$.ajax({
                type: 'GET',
                url: '/transaksi-manual/cari-detail-barang/'+kode,
                success:function (data){
				return {
					results : $.map(data, function (item){
						$("#stok").val(item.stok);
                        $('#nama_barang').val(item.nama);
                        if($('#statusadmin').val()!='Admin'){
                            $("#harga").val(item.harga);
                        }
                        $('#sku_induk').val(item.kode_barang);
                        $('#jumlah').focus();
					})
				}
			},complete:function(){
                $('#panelnya').loading('stop');
            }
            });
        });

    //============================================ simpan transaksi
		$("#btnsimpan").click(function(e){
			e.preventDefault();
			e.stopImmediatePropagation();
			var resi		= $("#resi").val();
			var admin		= $("#admin").val();
			var nama_barang	= $("#nama_barang").val();
			var harga	= $("#harga").val();
			var jumlah	= $("#jumlah").val();
			var stok	= $("#stok").val();
			var sku	= $("#sku").val();
			var varian	= $("#varian").val();
			var kurir	= $("#kurir").val();
			var penerima	= $("#penerima").val();
			var nopesanan	= $("#nopesanan").val();
			var kode	= $(".select2").val();
			var sku_induk	= $("#sku_induk").val();
			if(resi=='' || admin=='' || nama_barang=='' || harga==''|| harga==0|| jumlah == ''){
                swalWithBootstrapButtons.fire(
                    'Oops',
                    'Semua Data Harus Diisi!',
                    'error'
                );
   				
   			}else{
                if(parseInt(jumlah)>parseInt(stok)){
                    swalWithBootstrapButtons.fire(
                        'Oops',
                        'Stok Tidak Mencukupi!',
                        'error'
                    );
                }else{
                    $('#panelnya').loading('toggle');
                    $.ajax({
                        type: 'POST',
                        url: '/transaksi-manual/tambah-detail',
                        data: {
                            '_token': $('input[name=_token]').val(),
                            'resi'		: resi,
                            'admin'		: admin,
                            'nama_barang'	: nama_barang,
                            'harga'		: harga,
                            'jumlah'	: jumlah,
                            'sku'	: sku,
                            'penerima':penerima,
                            'varian': varian,
                            'kurir':kurir,
                            'nopesanan':nopesanan,
                            'kode' : kode,
                            'sku_induk'	: sku_induk,
                        },
                        success:function(){
                            $(".select2").val(null).trigger('change');
                            $("#nama_barang").val('');
                            $("#harga").val('');
                            $("#jumlah").val('');
                            $("#stok").val('');
                            $("#sku").val('');
                            $("#varian").val('');
                            $("#sku_induk").val('');
                            $("#resi").prop('readonly',true);
                            $("#admin").prop('readonly',true);
                            $("#resi").prop('readonly',true);
                            $("#tgltrx").prop('readonly',true);
                            $("#tipetrx").hide();
                            $('#displaytipetrx').val($("#tipetrx").val());
                            $('#displaytipetrx').show();
                            getdata();
                        },complete:function(){
                            $('#panelnya').loading('stop');
                        }
                    });
                }
   				
			}
        });
    
        $("#simpanbtn").click(function(e){
            if($("#total").html()!=''){
                $('#panelnya').loading('toggle');
                $('#paneldua').loading('toggle');
            }
        });
    //==================================================
	function getdata(){
        $('#paneldua').loading('toggle');
		$.ajax({
            type:'GET',
            dataType:'json',
            url: '/transaksi-manual/cari-detail',
            success:function(data){
                managerow(data);
            },complete:function(){
                $('#paneldua').loading('stop');
            }
        });
    }

    //=================================================
	function managerow(data){
		var rows ='';
        var total=0;
        var totalpcs=0;
			$.each(data,function(key, value){
                rows = rows + '<tr>';
                rows = rows + '<td>' +value.sku+'</td>';
                rows = rows + '<td>' +value.sku_induk+'</td>';
                rows = rows + '<td>' +value.barang+'</td>';
                rows = rows + '<td class="text-right">' +value.varian+'</td>';
                rows = rows + '<td class="text-center">' +value.kurir+'</td>';
                rows = rows + '<td class="text-right">' +value.harga+'</td>';
                rows = rows + '<td class="text-center">' +value.jumlah+' Pcs</td>';
                rows = rows + '<td class="text-right"> Rp. ' +rupiah(value.subtotal)+'</td>';
                rows = rows + '<td class="text-center"><button type="button" class="btn btn-warning btn-sm" onclick="deletedetail('+value.id+')"><i class="fa fa-trash"></i></button></td>';
                rows = rows + '</tr>';
                total += value.subtotal;
                totalpcs += value.jumlah;
            });
            $("#tubuh").html(rows);
            $("#total").html('Rp. '+rupiah(total));
            $("#totalpcs").html(totalpcs+' Pcs');
    }

    //==================================================
		function rupiah(bilangan){
			var	number_string = bilangan.toString(),
			sisa 	= number_string.length % 3,
			rupiah 	= number_string.substr(0, sisa),
			ribuan 	= number_string.substr(sisa).match(/\d{3}/gi);
			
		if (ribuan) {
			separator = sisa ? '.' : '';
			rupiah += separator + ribuan.join('.');
		}
			return rupiah;
        }

    //==================================================
        function deletedetail(kode) {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: true
            })
            swalWithBootstrapButtons.fire({
                title: 'Hapus Data ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus!',
                cancelButtonText: 'Tidak',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type: 'GET',
                        url: '/transaksi-manual/hapus-detail/' + kode,
                        data: {
                            '_token': $('input[name=_token]').val(),
                        },
                        success: function () {
                            swalWithBootstrapButtons.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                            getdata();
                        }
                    });
                }
            })
        }
        window.deletedetail = deletedetail;
        function validform(){
            if($("#total").html()==''){
                swalWithBootstrapButtons.fire(
                    'Oops',
                    'Tambahkan detail transaksi terlebih dahulu!',
                    'error'
                );
            return false;
            }else{
                
                return true;
                
            }
        }
        window.validform = validform;
  });
  