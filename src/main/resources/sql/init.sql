-- START DROP TABLE ---------------------
drop table if exists backpac_order cascade;
drop table if exists backpac_member cascade;
drop table if exists hibernate_sequence cascade;
-- END DROP TABLE -----------------------

-- START CREATE TABLE -------------------
create table backpac_member
(
    member_id    bigint       not null,
    email        varchar(100) not null,
    gender       varchar(1),
    name         varchar(20)  not null,
    nickname     varchar(30)  not null,
    password     varchar(255) not null,
    phone_number varchar(20)  not null,
    primary key (member_id)
) engine = InnoDB;

alter table backpac_member
    add constraint UK_backpac_user_email unique (email);
alter table backpac_member
    add constraint UK_backpac_user_nickname unique (nickname);
alter table backpac_member
    add constraint UK_backpac_user_phone_number unique (phone_number);


create table backpac_order
(
    order_id     bigint       not null,
    order_no     varchar(12)  not null,
    payment_time timestamp(6) not null,
    product_name varchar(100) not null,
    member_id    bigint,
    primary key (order_id)
) engine = InnoDB;

alter table backpac_order
    add constraint FK_backpac_order_member_id foreign key (member_id) references backpac_member (member_id);

create table hibernate_sequence
(
    next_val bigint
) engine = InnoDB;

insert into hibernate_sequence
values (1);
