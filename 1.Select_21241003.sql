-- menggunakan database dqlabmartbasic
use dqlabmartbasic;

-- cek table yang tersedia
show tables;

-- cek deskripsi tiap table
desc ms_pelanggan_dqlab;
desc ms_produk_dqlab;
desc tr_penjualan_dqlab;


-- select 1 koloom dari table ms_produk_dqlab
select nama_produk from ms_produk_dqlab;

-- select 1 kolom dari table ms_pelanggan dan tr_penjualan
select nama_pelanggan from ms_pelanggan_dqlab; -- mengambil kolom nama_pelanggan
select tgl_transaksi from tr_penjualan_dqlab; -- mengambil kolom tgl_transaksi

-- select 2 atau lebih kolom dari table ms_produk_dqlab
select nama_produk, harga from ms_produk_dqlab;

-- mengambil kolom kode pelanggan,tgl transaksi, harga dari tr_penjualan_dqlab
select kode_pelanggan, tgl_transaksi, harga from tr_penjualan_dqlab;

-- mengambil seluruh kolom dalam tabel
-- mengambil seluruh kolom pada table ms_pelanggan_dqlab
select * from ms_pelanggan_dqlab; 

-- prefix dan alias
-- prefix nama tabel
select ms_produk_dqlab.nama_produk
from ms_produk_dqlab;

select ms_produk_dqlab.nama_produk, ms_produk_dqlab.harga
from ms_produk_dqlab;

-- prefix dari nama database dan tabel
select dqlabmartbasic.ms_produk_dqlab.nama_produk
from ms_produk_dqlab;

-- alias dari nama kolom
select nama_produk as np, harga as price from ms_produk_dqlab;
select nama_produk np, harga price from ms_produk_dqlab;

-- alias dari nama tabel
select nama_produk from ms_produk_dqlab as msp;

-- alias bertemu dengan prefix (tulis aliasnya dulu baru prefix)
select msp.nama_produk from ms_produk_dqlab as msp;

-- case1
select nama_pelanggan, alamat from ms_pelanggan_dqlab;

-- case2
select nama_produk, harga from ms_produk_dqlab;





