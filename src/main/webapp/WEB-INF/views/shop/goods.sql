show tables;
/* 대분류 */
create table goods1 (
	product1 varchar(50) not null primary key		/* 대분류명 */
);

insert into goods1 values ('전자제품');
insert into goods1 values ('신발류');
insert into goods1 values ('의류');

drop table goods1;
select * from goods1;

/* 중분류 */
create table goods2 (
	product1 varchar(50) not null,							/* 대분류명 */
	product2 varchar(50) not null primary key,	/* 중분류명 */
	foreign key(product1) references goods1(product1)
--	on update cascade on delete restrict
);

insert into goods2 values ('전자제품', 'SAMSUNG');
insert into goods2 values ('전자제품', 'LG');
insert into goods2 values ('전자제품', 'APPLE');
insert into goods2 values ('신발류', 'Nike');
insert into goods2 values ('신발류', 'Adidas');
insert into goods2 values ('의류', 'BlackYak');
insert into goods2 values ('의류', 'K2');
insert into goods2 values ('의류', 'NorthFace');

select * from goods2;

/* 소분류 */
create table goods3 (
  idx 		 int not null auto_increment primary key,
  product1 varchar(50) not null,							/* 대분류명 */
  product2 varchar(50) not null,							/* 중분류명 */
  product3 varchar(50) not null,							/* 소분류명 */
  foreign key(product1) references goods1(product1)
  /* on update cascade on delete restrict */
);

insert into goods3 values (default,'전자제품','SAMSUNG','냉장고');
insert into goods3 values (default,'전자제품','SAMSUNG','에어컨');
insert into goods3 values (default,'전자제품','SAMSUNG','핸드폰');
insert into goods3 values (default,'전자제품','LG','냉장고');
insert into goods3 values (default,'전자제품','LG','스타일러');
insert into goods3 values (default,'전자제품','LG','청소기');
insert into goods3 values (default,'전자제품','APPLE','핸드폰');
insert into goods3 values (default,'전자제품','APPLE','노트북');
insert into goods3 values (default,'전자제품','APPLE','스마트시계');
insert into goods3 values (default,'신발류','Nike','운동화');
insert into goods3 values (default,'신발류','Nike','슬리퍼');
insert into goods3 values (default,'신발류','Nike','농구화');
insert into goods3 values (default,'신발류','Adidas','운동화');
insert into goods3 values (default,'신발류','Adidas','축구화');
insert into goods3 values (default,'신발류','Adidas','테니스화');
insert into goods3 values (default,'의류','BlackYak','등산복');
insert into goods3 values (default,'의류','BlackYak','티셔츠');
insert into goods3 values (default,'의류','BlackYak','언더웨어');
insert into goods3 values (default,'의류','K2','등산복');
insert into goods3 values (default,'의류','K2','패딩점퍼');
insert into goods3 values (default,'의류','K2','바람막이');
insert into goods3 values (default,'의류','NorthFace','바람막이');
insert into goods3 values (default,'의류','NorthFace','비치웨어');
insert into goods3 values (default,'의류','NorthFace','바지');

drop table goods3;
desc goods3;
select * from goods3;

create table product (
	idx 		 int not null auto_increment primary key,
	product1 varchar(50) not null,							/* 대분류명 */
  product2 varchar(50) not null,							/* 중분류명 */
  product3 varchar(50) not null,							/* 소분류명 */
  product	 varchar(100) not null unique,							/* 상품명 */
  price 	 int not null,
  title		 varchar(100),
  content  text,
  foreign key(product1) references goods1(product1),
  foreign key(product2) references goods2(product2)
);

drop table product;
desc product;
select * from product;

