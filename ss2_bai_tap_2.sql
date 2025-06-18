create database mo_hinh_xuat_khau;
use mo_hinh_xuat_khau;

create table phieu_xuat(
  soPX int auto_increment,
  ngayXuat date not null,
  primary key(soPX)
);

create table vat_tu(
   maVTU int auto_increment,
   tenVTU varchar(50) not null,
   primary key(maVTU)
);


create table phieu_nhap(
 soPN int auto_increment,
 ngayNhap date not null,
 primary key(soPN)
);

create table don_dh(
  soDH int auto_increment,
  ngayDH date not null,
  maNCC int,
  primary key(soDH),
  foreign key (maNCC) references nha_cc(maNCC)
);

create table nha_cc(
maNCC int auto_increment,
tenNCC varchar(50) not null,
diaChi varchar(50) not null,
soDT varchar(11) not null,
primary key(maNCC)
);

create table ct_phieuxuat(
donGiaXuat double not null,
soLuongXuat int not null,
soPX int,
maVTU int,
foreign key (soPX) references phieu_xuat(soPX),
foreign key (maVTU) references vat_tu(maVTU)
);

create table ct_phieunhap(
donGiaNhap double not null,
soLuongNhap double not null,
maVTU int,
soPN int,
foreign key (maVTU) references vat_tu(maVTU),
foreign key (soPN) references phieu_nhap(soPN)

);

create table ct_don_dat_hang(
   maVTU int,
   soDH int,
   foreign key (maVTU) references vat_tu(maVTU),
   foreign key (soDH) references don_dh(soDH)

);