create extension if not exists "uuid-ossp"

select * from uuid_generate_v4()

create table nasabah(
id_nasabah uuid default uuid_generate_v4(),
nama varchar(255) not null,
alamat varchar(255) not null,
email varchar(255) not null,
no_telepon varchar(20) not null
)

alter table nasabah 
add primary key (id_nasabah)

alter table nasabah 
add column tgl_lahir date;

alter table nasabah 
alter column tgl_lahir set not null

create table akun(
id_akun uuid default uuid_generate_v4(),
id_nasabah uuid not null,
nama varchar(255) not null,
jenis_akun varchar(50) not null,
pin int not null,
saldo bigint not null,
primary key(id_akun),
constraint fk_nasabah
	foreign key(id_nasabah)
		references nasabah(id_nasabah)
)

create table transaksi(
id_transaksi uuid default uuid_generate_v4(),
id_akun uuid not null,
tgl_transaksi timestamp default current_timestamp,
jenis_transaksi varchar(50) not null,
jml_transaksi bigint not null,
keterangan varchar(255),
primary key(id_transaksi),
constraint fk_akun
	foreign key(id_akun)
		references akun(id_akun)
)

drop table transaksi

insert into nasabah (
nama,
alamat,
email,
no_telepon
) values ('andi', 'jl. Jambi, Kota Binjai', 'andi@email.com', '+6218354984350');

insert into nasabah (
nama,
alamat,
email,
no_telepon
) values ('rayhan', 'jl. Bogor, Kota Medan', 'bogor@email.com', '+6218354954875');

update nasabah
set
 alamat = 'dekat mushola al-akbar'
where id_nasabah = '15827a1d-b90f-40c9-b4cc-c306d70899e6'

update nasabah 
set 
 tgl_lahir = '1999-12-21'
where nama = 'rayhan'

select * from nasabah

insert into akun (
id_nasabah,
nama,
jenis_akun,
pin,
saldo
) values ('15827a1d-b90f-40c9-b4cc-c306d70899e6', 'untuk nikah', 'investasi', 159266, 250000);

insert into akun (
id_nasabah,
nama,
jenis_akun,
pin,
saldo
) values ('22875010-5c71-4170-924e-cc07fa8b5480', 'uang pensiun rayhan yang bener', 'dana darurat', 201196, 1250000)

delete from akun where id_akun = '80115fd6-1fae-41fa-be85-17549729dc98'

select * from akun

insert into transaksi (
id_akun,
jenis_transaksi,
jml_transaksi,
keterangan
) values ('893af5da-ec05-46f5-823f-bc585e870f88', 'deposit', 150000, 'dijaga ya');

insert into transaksi (
id_akun,
jenis_transaksi,
jml_transaksi,
keterangan
) values ('893af5da-ec05-46f5-823f-bc585e870f88', 'deposit', 260000, 'tes2');

insert into transaksi (
id_akun,
jenis_transaksi,
jml_transaksi,
keterangan
) values ('893af5da-ec05-46f5-823f-bc585e870f88', 'kredit', 125000, 'mana ni');

select * from transaksi 

select
 n.nama as nama_nasabah,
 n.no_telepon as nomor_telepon,
 a.id_akun,
 a.nama as nama_akun,
 a.jenis_akun,
 a.saldo,
 t.tgl_transaksi as tanggal_transaksi,
 t.jml_transaksi as jumlah_transaksi,
 t.jenis_transaksi,
 t.keterangan
from nasabah n
left join akun a on a.id_nasabah = n.id
left join transaksi t on a.id_akun = t.id_akun;