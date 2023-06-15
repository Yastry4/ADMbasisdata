-- menggunakan database
use dqlabmartbasic;

-- ORDER BUY
-- mengurutkan data menggunakan ORDER BY
-- ambil nama produk, dan quantity dari tabel tr_penjualan_dqlab kemudian urutkan berdasarkan qty
select nama_produk, qty
from tr_penjualan_dqlab
order by qty; -- secara default diurutkan dari terkecil ke besar 

select nama_produk, qty
from tr_penjualan_dqlab
order by nama_produk; -- nama produknya yg dirutkan dari a-z

-- penggunaan order buy lebih dari satu kolom
-- mengurutkan lebih dari satu kolom menggunakan ORDER BUY
-- ambil nama produk, dan quantity dari tabel tr_penjualan_dqlab kemudian urutkan berdasarkan qty dan nama produk
select nama_produk, qty
from tr_penjualan_dqlab
order by qty, nama_produk;

-- latihan mandiri
-- tampilkan semua kolom dari tabel tr_penjualan_dqlab dengan mengurutkan berdasarkan qty dan tgl_transaksi 
select *
from tr_penjualan_dqlab
order by qty, tgl_transaksi;

-- tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan 
select *
from ms_pelanggan_dqlab
order by nama_pelanggan;

-- tampilakn semua kolom dari tabel ms_pelanggan dengan menggurutkan berdasarkan alamat
select *
from ms_pelanggan_dqlab
order by alamat;

-- asc dari kecil ke besar/ bisa tdk ditulis karna di sql sdh mengurutkan dari kecil ke besar
-- desc dari besar kecil
--  ASC dan DESC mengurutkan dari besar ke kecil
-- ambil nama produk dan quantity dari tabel tr_penjualan_dqlab urutkan berdasarkan qty secara descending
select nama_produk, qty
from tr_penjualan_dqlab
order by qty desc;

-- mengurutkan 2 kolom dengan ascending dan descending
select nama_produk, qty
from tr_penjualan_dqlab
order by qty desc, nama_produk asc;

-- Latihan mandiri
-- tampilkan semua kolom dari tabel tr_penjualan_dqlab dengan mengurutkan berdasarkan tgl_transaksi secara descending dan qty secara ascending 
select *
from tr_penjualan_dqlab
order by tgl_transaksi desc, qty asc;

-- tampilakan semua kolom dari tabel ms_pelanggan_dqlab dengan mengurutkan berdasarkan nama_pelanggan secara descending 
select *
from ms_pelanggan_dqlab
order by nama_pelanggan desc;

-- tampilkan semua kolom dari tabel ms_pelanggan_dqlab dengan mengurutkan alamat secara descending 
select * 
from ms_pelanggan_dqlab
order by alamat desc;

-- ambil nama produk, qty, harga, dan total beli, dari tr_penjualan_dqlab berdasarkan total beli
select nama_produk, qty, harga, qty*harga as total_beli
from tr_penjualan_dqlab
order by total_beli desc;

-- latihan mandiri
-- cobalah pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang dikurangi diskon 
 select nama_produk, qty, harga, diskon_persen, qty*harga-(diskon_persen/100) as total_bayar
 from tr_penjualan_dqlab
 order by total_bayar desc;



use dqlabmartbasic;


-- FUNGSI AGREGASI
--   menghitung penjualan nilai qty seluruh row pada tabel penjualan
select sum(qty) from tr_penjualan_dqlab;
select sum(nama_produk) from tr_penjualan_dqlab; -- bisa disum dengan string tapi tdk menghasilkan nilai 0

-- menghitung jumlah seluruh row pada tabel penjualan
select count(*) from tr_penjualan_dqlab;

-- menghitung rata-rata qty, nilai maks qty, dan nalai maks qty di tabel penjualan
select avg(qty), max(qty), min(qty) from tr_penjualan_dqlab;

--   menghitung penjualan nilai qty jumlah seluruh row di tabel penjualan
select sum(qty), count(*) from tr_penjualan_dqlab; 


-- menghitung jumlah nilai unik dari nama_produk pada tabel penjualan
select count(distinct nama_produk) from tr_penjualan_dqlab;
select count(*), count(distinct nama_produk) from tr_penjualan_dqlab;

-- sebaiknya fungsi agregrasi tidak digabung dgn field lain

-- GROUP BY
-- mengambil grouping nilai dari kolom nama_produk dari tabel tr prnjualan
select nama_produk from tr_penjualan_dqlab
group by nama_produk;  

-- penggunaan group 2 kolom
-- mengambil nilai grouping dari kolom nama produk dan qty pada tabel penjualan
select nama_produk, qty from tr_penjualan_dqlab
group by nama_produk, qty;

-- mengurutkan menggunakan order by dimana order by selalu diakhir 
select nama_produk, qty from tr_penjualan_dqlab
group by nama_produk, qty
order by qty desc;  

-- mengambil jumlah qty dari grouping nama produk terhadap seluruh row ditabel penjualan
select nama_produk, sum(qty) from tr_penjualan_dqlab
group by nama_produk;


-- HAVING
-- having utk melakukan fitering ketika where tdk bisa digunakan (filtering dari hasil grouping gunakan having jika tdk pakai grouping gunakan where)
--  mengambil jumlah qty diatas 2 dari grouping nama produk terhadap seluruh row pada tabel penjualan
select nama_produk, sum(qty) from tr_penjualan_dqlab
group by nama_produk
having sum(qty) > 2;

-- latihan mandiri
-- melihat daftar nama produk yang total jumlah produk terjual per kelompok  nama produk adalah diatas nilai 4
select nama_produk, sum(qty) from tr_penjualan_dqlab group by nama_produk having sum(qty) > 4;

-- melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9
select nama_produk, sum(qty) from tr_penjualan_dqlab group by nama_produk having sum(qty) = 9;

-- melihat daftar kelompok nama produk dan total nilai penjualan (harga dikalikan jumlah dikurangi diskon ) dengan dan urutan berdasarkan nilai penjualan terbesar   
select nama_produk, qty, harga, diskon_persen, (harga*qty - diskon_persen/100)
from tr_penjualan_dqlab
group by nama_produk, qty
order by qty desc;
