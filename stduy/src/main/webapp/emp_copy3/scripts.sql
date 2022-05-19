create table emp_copy
as
select * from employee;

insert into emp_copy(eno, ename, job, manager, hiredate, salary, commission, dno)
values ('1111','kim','prog','2222','22/05/09','3000','300','10');

