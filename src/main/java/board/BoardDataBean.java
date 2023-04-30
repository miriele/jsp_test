package board;

import java.sql.Timestamp;

/*
create table board_m1 (
    num         number(6)       primary key,
    id          varchar2(30)    not null,
    header      number(2)       not null,
    subject     varchar2(200)   not null,
    reg_date    date            default sysdate,
    readcount   number(6)       default 0,
    likecount   number(4)       default 0,
    content     varchar2(4000)  not null,
    re_num      number(6)       not null,
    re_step     number(4)       not null,
    re_level    number(1)       not null,
    re_cnt      number(3)       default 0,
    ip          varchar2(20)    not null
);
*/

public class BoardDataBean {
	private	int			num;		// 글번호 - 제목글인지 답변글인지 구분하는 용도로 잠깐 쓸거다
	private	String		id;			// 작성자 - 게시판에는 nick 표시
	private int			header;		// 말머리
	private	String		subject;	// 글제목
	private	Timestamp	reg_date;	// 작성일
	private int			readcount;	// 조회수
	private int			likecount;	// 좋아요
	private	String		content;	// 글내용
	private	int			re_num;		// 그룹화아이디 - 글/답글을 묶어서 관리하는 그룹 아이디
	private	int			re_step;	// 글순서 - 글에 대한 답글의 순서
	private	int			re_level;	// 글레벨 - reply level
	private int			re_cnt;		// 댓글수
	private	String		ip;			// 아이피
	private String		nick;		// 닉네임

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getHeader() {
		return header;
	}
	public void setHeader(int header) {
		this.header = header;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getRe_cnt() {
		return re_cnt;
	}
	public void setRe_cnt(int re_cnt) {
		this.re_cnt = re_cnt;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
}
