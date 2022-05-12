create table freeboard(
    id number constraint PK_freeboard_id primary key,   -- �ڵ� ���� �÷�
    name varchar2(100) not null,
    password varchar2(100) null,
    email varchar2(100) null,
    subject varchar2(100) not null,     -- ������
    content varchar2(2000) not null,    -- �۳���
    inputdate varchar2(100) not null,   -- �۾� ��¥
    masterid number default 0,  -- ���� �亯�� �Խ��ǿ��� 
    readcount number default 0, -- �� ��ȸ��
    replaynum number default 0,
    step number default 0
    );

select * from freeboard;