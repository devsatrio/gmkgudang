
$(function () {
    $('#list-data').DataTable({
        processing: true,
        serverSide: true,
        order: [[0, "desc"]],
        dom: 'Blfrtip',
        pageLength: 20,
        buttons : [
            {extend: 'pdf', title:'Data Barang',exportOptions: {
                columns: [0,1,2,3,4,5,6,7]
            }},
            {extend: 'excel', title: 'Data Barang',exportOptions: {
                columns: [0,1,2,3,4,5,6,7]
            }},
            {extend:'print',title: 'Data Barang',exportOptions: {
                columns: [0,1,2,3,4,5,6,7]
            }},
        ],
        ajax: '/data-barang-masuk',
        columns: [
            {
                data: 'id', render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { data: 'kode', name: 'kode' },
            { data: 'nama', name: 'nama' },
            {
                render: function (data, type, row) {
                    return row['jumlah'] +" Pcs";
                },
                "className": 'text-center',
            },
            {
                render: function (data, type, row) {
                    return "Rp. " + rupiah(row['harga']);
                },
                "className": 'text-right',
            },
            {
                render: function (data, type, row) {
                    return "Rp. " + rupiah(row['total']);
                },
                "className": 'text-right',
            },
            { data: 'tanggal', name: 'tanggal' },
            { data: 'keterangan', name: 'keterangan' },
            {
                render: function (data, type, row) {
                    return '<a href="/barang-masuk/' + row['id'] + '/edit" class="btn btn-sm btn-success"><i class="fa fa-wrench"></i></a> <button class="btn btn-sm btn-danger" onclick="hapusdata(' + row['id'] + ')"><i class="fa fa-trash"></i></button>'
                },
                "className": 'text-center',
                "orderable": false,
                "data": null,
            },
        ],
        pageLength: 10,
        lengthMenu: [[5, 10, 20], [5, 10, 20]]
    });

});

function hapusdata(kode) {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: true
    })
    swalWithBootstrapButtons.fire({
        title: 'Hapus Data ?',
        text: "Data tidak dapat di pulihkan kembali!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya, Hapus!',
        cancelButtonText: 'Tidak',
        reverseButtons: true
    }).then((result) => {
        if (result.value) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: 'DELETE',
                url: '/barang-masuk/' + kode,
                data: {
                    '_token': $('input[name=_token]').val(),
                },
                success: function () {
                    swalWithBootstrapButtons.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    )
                    $('#list-data').DataTable().ajax.reload();
                }
            });
        }
    })
}
window.hapusdata = hapusdata;

function rupiah(bilangan) {
    var number_string = bilangan.toString(),
        sisa = number_string.length % 3,
        rupiah = number_string.substr(0, sisa),
        ribuan = number_string.substr(sisa).match(/\d{3}/gi);

    if (ribuan) {
        separator = sisa ? '.' : '';
        rupiah += separator + ribuan.join('.');
    }

    return rupiah;
}