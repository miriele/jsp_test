package board;

import java.sql.Timestamp;

public class BoardDataBean {
	private	int			num;		// 글번호 - 추가 : 제목글인지 답변글인지 구분하는 용도로 잠깐 쓸거다
	private	String		writer;		// 작성자
	private	String		subject;	// 글제목
	private	String		passwd;		// 비밀번호
	private	Timestamp	reg_date;	// 작성일
	private int			readcount;	// 조회수
	private	int			ref;		// 그룹화아이디 - 글/답글을 묶어서 관리하는 그룹 아이디
	private	int			re_step;	// 글순서 - 글에 대한 답글의 순서
	private	int			re_level;	// 글레벨 - reply level
	private	String		content;	// 글내용
	private	String		ip;			// 아이피

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
