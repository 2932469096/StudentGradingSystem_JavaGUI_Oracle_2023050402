/*����ɾ��*/
/*
drop table teacher cascade constraints;
drop table student cascade constraints;
drop table course cascade constraints;
drop table grades cascade constraints;
drop table grade_order cascade constraints;
*/
-- ѧ����Ϣ��
create table student
(
  sno varchar2(11) primary key, --ѧ��
  sname varchar2(50) not null unique, --����
  ssex char(3) check(ssex in('��','Ů')), --�Ա�
  sage smallint not null, --����
  pwd varchar2(20) not null, --��������
  sclass varchar2(20) not null, --�༶
  faculty varchar2(50), -- Ժϵ
  syear varchar2(10), --�꼶
  senter varchar2(4) --��ѧ���
);

-- ��ʦ��Ϣ��
create table teacher
(
  tno varchar2(7) primary key, --��ʦ���
  tname varchar2(50) not null unique, --��ʦ����
  tsex char(3) check(tsex in('��','Ů')), --��ʦ�Ա�
  tage smallint not null, --����
  tposition varchar2(20) not null, --��ʦְλ
  tfaculty varchar2(50), -- Ժϵ
  pwd varchar2(20) not null --��������
);

--�γ���Ϣ
create table course
(
  cno varchar2(4), --�γ̱��
  --cpno varchar2(10), --���޿γ̱��
  cname varchar2(40) not null , --�γ���
  ccredit number(2,1) not null, --�γ�ѧ��
  tno varchar2(7) not null, --�ο���ʦ���
  cscore smallint not null, --�γ̷���(0��ʾ�ٷ��ƣ�1��ʾ����ƣ��š������С��������)
  tname varchar2(50) not null, --�ο���ʦ
  primary key(cno,tno),
  foreign key (tno) references teacher(tno) 
);

--ѧ���ɼ���
create table grades
(
  sno varchar2(11) not null, --ѧ��ѧ��
  cno varchar2(4) not null, --�γ̱��
  grade varchar2(6) not null, --�γ̳ɼ�
  cscore smallint not null, --�γ̷���(0��ʾ�ٷ��ƣ�1��ʾ����ƣ��š������С����񡢲�����)
  tno varchar2(7) not null, --��ʦ���
  primary key (sno,cno), 
  foreign key (sno) references student(sno),
  foreign key (cno,tno) references course(cno,tno),
  foreign key (tno) references teacher(tno)
);

-- ���������� ���ڶԽ�ʦ����ԡ��š������С����񡢲���������ȼ��ĳɼ���������
create table grade_order
(
  gradeFive varchar2(6) not null,
  orderNum int not null,
  primary key(gradeFive)
);
insert into grade_order(gradeFive,ordernum) values('��',5);
insert into grade_order(gradeFive,ordernum) values('��',4);
insert into grade_order(gradeFive,ordernum) values('��',3);
insert into grade_order(gradeFive,ordernum) values('����',2);
insert into grade_order(gradeFive,ordernum) values('������',1);

--drop table grade_order cascade CONSTRAINTS;
-- ��������

-- ѧ������
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('����','��','32106300040',20,'���212','�������ѧ�����繤��ѧԺ','123456','��һ','2021');
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('����','Ů','32106300041',19,'���213','�������ѧ�����繤��ѧԺ','123456','��һ','2021');
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('����','Ů','32106300042',18,'���212','�������ѧ�����繤��ѧԺ','123456','��һ','2021');
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('����','��','32106300043',19,'���212','�������ѧ�����繤��ѧԺ','123456','��һ','2021');
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('����','��','32106300044',19,'���211','�������ѧ�����繤��ѧԺ','123456','��һ','2021');

insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('�ְ�','Ů','32106300045',20,'���212','�������ѧ�����繤��ѧԺ','123456','��һ','2021');
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('���','��','32106300046',20,'���213','�������ѧ�����繤��ѧԺ','123456','��һ','2021');
insert into student(sname,ssex,sno, sage, sclass, faculty, pwd, syear, senter) values('��ʮ','��','32106300047',21,'���211','�������ѧ�����繤��ѧԺ','123456','��һ','2021');



-- ��ʦ����
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200001','Ф��','��',42,'����','123456','�������ѧ�����繤��ѧԺ');
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200002','����','Ů',34,'������','123456','��ѧ����Ϣ��ѧѧԺ');
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200003','���','��',55,'����','123456','�������ѧ�����繤��ѧԺ');
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200004','����','Ů',38,'������','123456','�������ѧ�����繤��ѧԺ');
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200005','��Խ��','��',60,'������','123456','�������ѧ�����繤��ѧԺ');
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200006','�ֲ�','��',54,'����','123456','�������ѧ�����繤��ѧԺ');
insert into teacher(tno, tname, tsex, tage, tposition, pwd, tfaculty) values('t200007','�ƾ�','��',40,'����','123456','�������ѧ�����繤��ѧԺ');


--�γ�����
insert into course(cno,cname,ccredit,tno,tname,cscore) values('6','���ݽṹ',2,'t200001','Ф��',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('2','�ߵ���ѧ',4,'t200002','����',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('7','�������',4,'t200001','Ф��',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('5','�������',2,'t200003','���',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('1','java',3,'t200004','����',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('3','���ݿ�',3,'t200005','��Խ��',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('4','����ϵͳ',3,'t200006','�ֲ�',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('5','�������',2,'t200005','��Խ��',0);
insert into course(cno,cname,ccredit,tno,tname,cscore) values('8','javaʵ��',3,'t200004','����',1);


--ѧ���ɼ�����
insert into grades values('32106300040','6','50',0,'t200001');
insert into grades values('32106300041','2','40',0,'t200002');
insert into grades values('32106300042','5','60',0,'t200003');
insert into grades values('32106300043','1','80',0,'t200004');
insert into grades values('32106300044','3','90',0,'t200005');

insert into grades values('32106300045','1','85',0,'t200004');
insert into grades values('32106300046','3','65',0,'t200005');
insert into grades values('32106300047','3','75',0,'t200005');

insert into grades values('32106300040','5','75',0,'t200005');
insert into grades values('32106300041','5','85',0,'t200005');
insert into grades values('32106300043','5','99',0,'t200005');

insert into grades values('32106300040','8','��',1,'t200004');
insert into grades values('32106300041','8','��',1,'t200004');
insert into grades values('32106300043','8','��',1,'t200004');


-- ������ͼ

-- ѧ���˲鿴�ɼ���ͼ
create or replace view stugradeinfo as select student.sno sno, student.sname sname, course.cno cno , course.cname cname,course.ccredit ccredit,grades.grade grade, course.tno tno,course.tname tname 
from student, course, grades
where student.sno = grades.sno and grades.tno = course.tno and course.cno = grades.cno; 
-- ѧ���˻�����Ϣ��ͼ
create view stubasicinfo as select student.sno sno, student.sname sname, student.ssex ssex, student.sclass sclass, student.sage sage, student.faculty faculty from student;


-- �γ���Ϣ��ͼ

create or replace view courseinfo as
select c.cno, c.cname, c.tno, t.tname, c.ccredit, count(s.sno) as select_count, c.cscore 
from course c 
join teacher t on c.tno = t.tno
left join grades g on c.cno = g.cno and c.tno = g.tno
left join student s on g.sno = s.sno
group by c.cno, c.cname, c.tno, c.ccredit, t.tname, c.cscore;


-- ��ʦ�˲鿴�ɼ���ͼ
create or replace view tgradeinfo as
select c.cno cno , c.cname cname, c.cscore cscore, s.sno sno, s.sname sname, s.sclass sclass, g.grade grade, --�γ̱�š��γ����ơ��γ̷��ơ�ѧ��ѧ�š�ѧ��������ѧ���༶��ѧ���ɼ�
       rank() over(partition by c.cno order by g.grade desc) rank, --ѧ���ɼ�����
       max(case when c.cscore = 0 then g.grade end) over(partition by c.cno, c.tno) highest,   --�ÿγ̵���߷�
       min(case when c.cscore = 0 then g.grade end) over(partition by c.cno, c.tno) lowest,    --�ÿγ̵���ͷ�
       round(avg(case when c.cscore = 0 then g.grade end) over(partition by c.cno, c.tno),1) average,   --�ÿγ̵�ƽ����,�������С�����������뱣��һλ
       t.tno tno, t.tname tname,                         -- ��ʦ��źͽ�ʦ����
       count(distinct s.sno) over(partition by c.cno, c.tno) num        -- ���ѡ������
from grades g join course c on g.cno = c.cno and g.tno = c.tno 
             join student s on g.sno = s.sno
             join teacher t on c.tno = t.tno;  -- ����teacher��
-- ��ʦ�˻�����Ϣ��ͼ
create or replace view tbasicinfo as select teacher.tno tno, teacher.tname tname, teacher.tsex tsex, teacher.tposition tposition from teacher;


-- �����ѧ��������ͼ
create or replace view smanage as select student.sno sno, student.sname sname, student.ssex ssex, student.sclass sclass, student.sage sage, student.faculty faculty, student.syear syear, student.senter senter from student;
-- ����˽�ʦ������ͼ
create or replace view tmanage as select teacher.tno tno, teacher.tname tname, teacher.tage tage, teacher.tsex tsex, teacher.tposition tposition, teacher.tfaculty from teacher;
-- ����˿γ̹�����ͼ
create or replace view cmanage as select course.cno cno, course.cname cname, course.tno tno, course.tname tname, course.ccredit ccredit, course.cscore cscore from course ;
-- ������˺Ź�����ͼ
create or replace view accountmanage as select sno ano, pwd pwd from student union select tno ano, pwd pwd from teacher;


-- ��ѯ�������
select * from student;
select * from teacher;
select * from course;
select * from grades;
select * from grade_order;

-- ��ѯ��ͼ���վ�
select * from stugradeinfo;
select * from stubasicinfo;
select * from tgradeinfo;
select * from tbasicinfo;
select * from courseinfo;

select * from smanage;
select * from tmanage;
select * from cmanage;
select * from accountmanage;

/*
drop view stugradeinfo cascade constraints;
drop view stubasicinfo cascade constraints;
drop view tgradeinfo cascade constraints;
drop view tbasicinfo cascade constraints;
drop view courseinfo cascade constraints;
drop view smanage cascade constraints;
drop view tmanage cascade constraints;
drop view cmanage cascade constraints;
drop view accountmanage cascade constraints;
*/


select * 
from tgradeinfo
left join grade_order
on tgradeinfo.grade = grade_order.gradefive
where tno = 't200004' 
order by tgradeinfo.cno desc, case when grade_order.gradefive is NULL then cast(tgradeinfo.grade as int) else grade_order.ordernum end desc;

SELECT * FROM tgradeinfo 
LEFT JOIN grade_order  
ON tgradeinfo.grade = grade_order.gradefive  
WHERE tno = 't200004' AND cname = 'javaʵ��'
ORDER BY tgradeinfo.cno DESC,  
         CASE WHEN grade_order.gradefive IS NULL THEN  
              CASE WHEN REGEXP_LIKE(tgradeinfo.grade, '^[0-9]+$')   
                   THEN cast(tgradeinfo.grade as int)  
                   ELSE NULL  
              END    
         ELSE grade_order.ordernum  
         END DESC;

commit;
