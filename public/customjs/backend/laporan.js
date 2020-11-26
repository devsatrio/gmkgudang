
$(function () {
    $('#list-data').DataTable({
        processing: true,
        serverSide: true,
        dom: 'Blfrtip',
        buttons : [
            {extend: 'pdf', title:'Data Barang',exportOptions: {
                columns: [0,1,2,3,4]
            }},
            {extend: 'excel', title: 'Data Barang',exportOptions: {
                columns: [0,1,2,3,4,5,6,7,8,9]
            }},
            {extend:'print',title: 'Data Barang',exportOptions: {
                columns: [0,1,2,3,4]
            }},
        ],
        order: [[0, "desc"]],
        ajax: '/data-laporantrx',
        columns: [
            {
                data: 'id', render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { data: 'noresi', name: 'noresi' },
            { data: 'skuindex', name: 'skuindex' },
            { data: 'sku', name: 'sku' },
            { data: 'barang', name: 'barang' },
            { data: 'jumlah', name: 'jumlah' },
            { data: 'harga', name: 'harga' },
            { data: 'total', name: 'total' },
            { data: 'admin', name: 'admin' },
            { data: 'tgl', name: 'tgl' },
            
        ],
        pageLength: 50,
        lengthMenu: [[5, 10, 20], [5, 10, 20]]
    });

});