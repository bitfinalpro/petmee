/**
create table tb_member (
    id varchar2(20) primary key,
    pass varchar2(20) not null,
    name varchar2(30) not null
);
insert into tb_member(id, pass, name) values('admin', '1111', '관리자');
insert into tb_member(id, pass, name) values('kim', '1111', '김연아');
commit;
 */
package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String pass;
	private String name;
}






