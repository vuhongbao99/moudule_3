create database mo_hinh_xuat_khau;
use mo_hinh_xuat_khau;

create table phieu_xuat(
  so_phieu_xuat int auto_increment,
  ngay_xuat date not null,
  primary key(so_phieu_xuat)
);

create table vat_tu(
   ma_vat_tu int auto_increment,
   ten_vat_tu varchar(50) not null,
   primary key(ma_vat_tu)
);


create table phieu_nhap(
 so_phieu_nhap int auto_increment,
 ngay_nhap date not null,
 primary key(so_phieu_nhap)
);

create table nha_cc(
ma_nha_cung_cap int auto_increment,
ten_nha_cung_cap varchar(50) not null,
dia_chi varchar(50) not null,
soDT varchar(11) not null,
primary key(ma_nha_cung_cap)
);

create table don_dh(
  so_don_hang int auto_increment,
  ngay_dat_hang date not null,
  ma_nha_cung_cap int,
  primary key(so_don_hang),
  foreign key (ma_nha_cung_cap) references nha_cc(ma_nha_cung_cap)
);



create table ct_phieuxuat(
don_gia_xuat double not null,
so_luong_xuat int not null,
so_phieu_xuat int,
ma_vat_tu int,
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table ct_phieunhap(
don_gia_nhap double not null,
so_luong_nhap double not null,
ma_vat_tu int,
so_phieu_nhap int,
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)

);

create table ct_don_dat_hang(
   ma_vat_tu int,
   so_don_hang int,
   foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
   foreign key (so_don_hang) references don_dh(so_don_hang)

);