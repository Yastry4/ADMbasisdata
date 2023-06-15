-- menggunakan SELECT statment untuk 1 nilai literal
select 77 as literalInteger; -- literal untuk bilangan bulat
select 'mataram' as kota; -- literal untuk char;
select '2023/20/5' as date; -- literal untuk untuk date
select 77 < 3 as booleanLiteral; -- literal boolean 

-- menggunakan select statment untuk 2 atau lebih literal
select 77 as angka, true as nilai_logika, 'UNDIKMA' as teks;

-- menggunkan select untuk null
select null as kosong;

-- menggunakan select statment untuk operator matematika
select 5%2 as sisa_bagi, 5/2 as hasil_bagi, 5 div 2 as hasil_bagi_int;

-- latihan mandiri
select  4*2 as hasil_kali, (4*8)%7 as sisa_bagi, (4*8) MOD 7 as sisa;

-- operator matematika untuk menghasilkan total beli (qty* harga) pada tabel tr_penjualan
use dqlabmartbasic;
select qty*harga as  total_beli from tr_penjualan_dqlab;
select nama_produk, qty*harga as total_beli from tr_penjualan_dqlab;

--  OPERATOR PERBANDINGAN
select 5=5, 5<>5, 5<>4, 5!=5, 5!=4, 5>4;

-- latihan mandiri
select  1=true, 1=false, 5>=5, 5.2=5.20000, null=1, null=null;

select nama_produk, qty, qty >= 3 from tr_penjualan_dqlab;

select pow(3,2), round(3.14), round(3.54), round(3.155, 1), round(3.155, 2), floor(4.28), floor(4.78), ceiling(4.39), ceiling(4.55);

-- fungsi now(), year(), datediff(), dan day()
select now(), year('2022-05-20'), datediff('2022-05-20', '2022-05-01'), day(now());

select datediff('2002-11-04', '2023-05-20');

-- fungsi pada tabel tr_penjualan
-- mendapatkan lastest buy dari produk
select nama_produk, datediff(now(), tgl_transaksi) as latest_buy, year(tgl_transaksi) from tr_penjualan_dqlab;

-- klausal  WHERE untuk filtering atau penyaringan
-- ambil nama produk dan qty dari tabel tr_penjualan_dqlab yang qty lebih dari 2
select nama_produk, qty
from tr_penjualan_dqlab
where qty > 2;

-- latihan 1
select tgl_transaksi, nama_produk, qty, harga, qty*harga as total_beli
from tr_penjualan_dqlab
where kode_pelanggan = 'dqlabcust07';

-- menggunakan AND dan OR
select tgl_transaksi, nama_produk, qty, harga, qty*harga as total_beli
from tr_penjualan_dqlab
where kode_pelanggan = 'dqlabcust07' AND qty > 1;

-- penggunaan like pada stetment select
--  cari semua nama produk yang namanya diawali huruf'f'
select nama_produk from  tr_penjualan_dqlab
where nama_produk like 'f%' ;

-- Latihan Mandiri
-- yang memiliki karakter kedua 'a' pada tabel 
select nama_produk from tr_penjualan_dqlab
where nama_produk like '_a%';

-- yang mengandung huruf 't' pada tabel 
select kategori_produk from ms_produk_dqlab
where kategori_produk like '%t%';

-- yang mengandung karakter 'un' pada tabel 
select kategori_produk from ms_produk_dqlab
where kategori_produk like '%un%';


