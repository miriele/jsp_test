package member;

import java.sql.Timestamp;

/*
create table member_m1 (
	id      varchar2(30) primary key,
    nick    varchar2(30) unique not null,
    dept    number(2)    not null,
    passwd  varchar2(30) not null,
    name    varchar2(50) not null,
    tel     varchar2(20),
    email   varchar2(50),
    reg_date    date     not null
);
*/

public class MemberDataBean {
	private	String		id;
    private	String		nick;
	private int			dept;		// 0 : normal, 10 : business, 20 : premium, 90 : admin 
	private	String		passwd;
	private	String		name;
	private	String		tel;
	private	String		email;
	private	Timestamp	reg_date;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
