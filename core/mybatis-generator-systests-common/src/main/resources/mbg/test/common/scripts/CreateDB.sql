drop table FieldsOnly if exists;
drop table PKOnly if exists;
drop table PKFields if exists;
drop table PKBlobs if exists;
drop table PKFieldsBlobs if exists;
drop table FieldsBlobs if exists;
drop table "awful table" if exists;
drop table BlobsOnly if exists;
drop view NameView if exists;
drop table RegexRename if exists;
drop table mbgtest.AnotherAwfulTable if exists;
drop schema mbgtest if exists;
drop table EnumTest if exists;
drop sequence TestSequence if exists;

create sequence TestSequence as integer start with 1;

create table FieldsOnly (
  IntegerField int,
  DoubleField double,
  FloatField float
);

create table PKOnly (
  id int not null,
  seq_num int not null,
  primary key(id, seq_num)
);

create table PKFields (
  id1 int not null,
  id2 int not null,
  firstName varchar(20),
  lastName varchar(20),
  dateField date,
  timeField time,
  timestampField timestamp,
  decimal30Field decimal(3, 0),
  decimal60Field decimal(6, 0),
  decimal100Field decimal(10, 0),
  decimal155Field decimal(15, 5),
  "wierd$Field" int,
  "birth date" date,
  primary key (id1, id2)
);

create table PKBlobs (
  id int not null,
  blob1 longvarbinary,
  blob2 longvarbinary,
  characterlob clob(5k),
  primary key (id)
);

create table PKFieldsBlobs (
  id1 int not null,
  id2 int not null,
  firstName varchar(20),
  lastName varchar(20),
  blob1 longvarbinary,
  primary key (id1, id2)
);

create table FieldsBlobs (
  firstName varchar(20),
  lastName varchar(20),
  blob1 longvarbinary,
  blob2 longvarbinary,
  blob3 binary
);

create table "awful table" (
  "CuStOmEr iD" int generated by default as identity (start with 57) not null,
  "first name" varchar(20) default 'Mabel',
  first_name varchar(20),
  firstName varchar(20),
  "last name" varchar(20),
  E_MAIL varchar(20),
  "_id1" int not null,
  "$id2" int not null,
  "id5_" int not null,
  "id6$" int not null,
  "id7$$" int not null,
  EmailAddress varchar(30),
  "from" varchar(30),
  active bit not null,
  primary key("CuStOmEr iD")
);

-- this table should be ignored, nothing generated
create table BlobsOnly (
  blob1 longvarbinary,
  blob2 longvarbinary
);

create table RegexRename (
  CUST_ID integer not null,
  CUST_NAME varchar(30),
  CUST_ADDRESS varchar(30),
  ZIP_CODE char(5),
  primary key(CUST_ID)
);

create view NameView (id, name) as
  select CUST_ID, CUST_NAME from RegexRename;

create schema mbgtest;

create table mbgtest.AnotherAwfulTable (
  id int not null,
  "select" varchar(30),
  "insert" varchar(30),
  "update" varchar(30),
  "delete" varchar(30),
  primary key(id)
);

create table EnumTest (
  id int not null,
  name varchar(20) not null,
  primary key(id)
);
