create  table  emp(
    eid int primary key ,
    ename varchar(50) not null ,
    salary float(8,2),
    email varchar(20),
    did int,
    constraint ch_sal check ( salary>=500 ),
    constraint un_emai unique(email)
);
create table  dept(
    did int primary key ,
    dname varchar(30) not null
);
alter table  emp add constraint fk_dept_emp foreign key (did) references dept(did);
