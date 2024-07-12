--DDL--
--MEMBUAT TABLE--
create table nasabah(
id_nasabah BIGSERIAL primary key not null,
nama varchar(255) not null,
alamat varchar(255) not null,
email varchar(255) not null,
no_telepon varchar(20) not null
)

create table akun(
id_akun BIGSERIAL not null,
id_nasabah int not null,
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
id_transaksi BIGSERIAL not null,
id_akun BIGSERIAL not null,
tgl_transaksi timestamp,
jenis_transaksi varchar(50) not null,
jml_transaksi bigint not null,
keterangan varchar(255),
primary key(id_transaksi),
constraint fk_akun
	foreign key(id_akun)
		references akun(id_akun)
)

--MENGUBAH NAMA TABLE--
alter table nasabah rename to nasabah1

--MENGHAPUS TABLE--
drop table nasabah

--DML--
select * from nasabah 

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
where id_nasabah = 1


select * from akun 

insert into akun (
id_nasabah,
nama,
jenis_akun,
pin,
saldo
) values (2, 'tabungan rayhan', 'tabungan', 159266, 250000)

insert into akun (
id_nasabah,
nama,
jenis_akun,
pin,
saldo
) values (2, 'uang pensiun rayhan', 'tabungan', 201196, 1250000)

delete from akun where id_akun = 2

alter table transaksi
alter column tgl_transaksi set default current_timestamp

select * from transaksi 

insert into transaksi (
id_akun,
jenis_transaksi,
jml_transaksi,
keterangan
) values (1, 'deposit', 150000, 'dijaga ya')

insert into transaksi (
id_akun,
jenis_transaksi,
jml_transaksi,
keterangan
) values (1, 'deposit', 260000, 'tes2')

insert into transaksi (
id_akun,
jenis_transaksi,
jml_transaksi,
keterangan
) values (1, 'kredit', 125000, 'mana ni')

delete from transaksi where tgl_transaksi is null 