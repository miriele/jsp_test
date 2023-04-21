package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean	instance	= new BoardDBBean();
	
	public static BoardDBBean	getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws NamingException, SQLException {
		Context	initCtx	= new InitialContext();
		Context	envCtx	= (Context)initCtx.lookup("java:comp/env");
		DataSource	ds	= (DataSource)envCtx.lookup("jdbc/bit");
		
		return ds.getConnection();
	}
	
	public int getCount() {
		int					count	= 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String	sql	= "select count(*) from board";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			rs		= pstmt.executeQuery();
			
			// 주의
			// : "select count(*) from board" 로 queyr하면 column 명이 count(*)이 된다
			// : 따라서 값을 얻어오려면 getInt("count(*)")와 같이 작성해야 한다
			// : 만약 query문에 수식이 있다면 수식을 다 써줘야 한다
			// : 이렇게 사용하면 불편하므로, column명 대신 index를 사용하는 방법을 사용할 수 있다
			// : getInt("count(*)") >> getInt(1)
			// : column 이름이 명시된 column을 간단히 조회할 때만 사용하자
			if(rs.next()) {
				count	= rs.getInt(1);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs    != null)	rs.close();
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}	// getCount()
	
	public int insertArticle(BoardDataBean dto) {
		int					result	= 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String	sql			= null;
			int		num			= dto.getNum();			// 0 : 제목글, != 0 : 답변글
			int		ref			= dto.getRef();			// 그룹화아이디
			int		re_step		= dto.getRe_step();		// 글순서
			int		re_level	= dto.getRe_level();	// 글레벨
			
			con		= getConnection();

			if(num == 0) {
				// 제목글인 경우
				sql		= "select max(num) from board";
				pstmt	= con.prepareStatement(sql);
				rs		= pstmt.executeQuery();
				
				if(rs.next()) {
					// 글이 있는 경우
					ref	= rs.getInt(1) + 1;		// 그룹화아이디 = 글번호최댓값 + 1
				} else {
					// 글이 없는 경우
					ref	= 1;
				}
				
				re_step		= 0;
				re_level	= 0;
				
				rs.close();
				pstmt.close();
			} else {
				// 답변글인 경우
				
				//						ref		re_step		re_level
				// 제목글				12		0			0
				//  ㄴ 답글				12		0+1+1		0+1		
				//      ㄴ 재답글		12		1+1+1		1+1
				//  ㄴ 나중답글			12		0+1			0+1			// re_step을 1 증가하기 전에 현재 글보다 빠른 re_step은 1씩 밀어준다
				
				//						ref		re_step		re_level
				// 제목글				12		0			0
				//  ㄴ 나중답글			12		0+1			0+1
				//  ㄴ 답글				12		0+1+1		0+1		
				//      ㄴ 재답글		12		1+1+1		1+1
				
				sql		= "update board set re_step=re_step+1 where ref=? and re_step>?";
				pstmt	= con.prepareStatement(sql);
				pstmt.setInt( 1, ref);
				pstmt.setInt( 2, re_step);
				pstmt.executeUpdate();

				re_step++;
				re_level++;
				
				pstmt.close();
			}

			sql		= "insert into board(num, writer, subject, passwd, reg_date, "
					+ 					"ref, re_step, re_level, content, ip) "
					+ "values(board_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt	= con.prepareStatement(sql);
			pstmt.setString		( 1, dto.getWriter());
			pstmt.setString		( 2, dto.getSubject());
			pstmt.setString		( 3, dto.getPasswd());
			pstmt.setTimestamp	( 4, dto.getReg_date());
			pstmt.setInt		( 5, ref);
			pstmt.setInt		( 6, re_step);
			pstmt.setInt		( 7, re_level);
			pstmt.setString		( 8, dto.getContent());
			pstmt.setString		( 9, dto.getIp());
			
			result	= pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs    != null)	rs.close();
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}	// insertArticle()

	public ArrayList<BoardDataBean> getArticles(int start, int end) {
		ArrayList<BoardDataBean>	dtos	= null;
		
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String	sql	= "select num, writer, subject, passwd,";
			sql += "reg_date, ref, re_step, re_level, content, ip, readcount, r ";
			sql += "from (select num, writer, subject, passwd,reg_date,ref,re_step";
			sql += ",re_level,content,ip,readcount,rownum r from ";
			sql += "(select num,writer,subject,passwd,reg_date,ref,re_step,re_level ";
			sql += ",content,ip,readcount from board order by ref desc, re_step asc) ";
			sql += "order by ref desc, re_step asc ) where r >= ? and r <= ?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs		= pstmt.executeQuery();
			
			if(rs.next()) {
				dtos	= new ArrayList<BoardDataBean>(end - start + 1);
				
				do {
					BoardDataBean	dto	= new BoardDataBean();
					
					dto.setNum		(rs.getInt("num"));
					dto.setWriter	(rs.getString("writer"));
					dto.setSubject	(rs.getString("subject"));
					dto.setPasswd	(rs.getString("passwd"));
					dto.setReg_date	(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setRef		(rs.getInt("ref"));
					dto.setRe_step	(rs.getInt("re_step"));
					dto.setRe_level	(rs.getInt("re_level"));
					dto.setContent	(rs.getString("content"));
					dto.setIp		(rs.getString("ip"));
					
					dtos.add(dto);
				} while(rs.next());
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs    != null)	rs.close();
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}	// getArticles()

	public BoardDataBean getArticle(int num) {
		BoardDataBean		dto		= null;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String	sql	= "select * from board where num=?";
			
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs		= pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDataBean();

				dto.setNum		(rs.getInt("num"));
				dto.setWriter	(rs.getString("writer"));
				dto.setSubject	(rs.getString("subject"));
				dto.setPasswd	(rs.getString("passwd"));
				dto.setReg_date	(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef		(rs.getInt("ref"));
				dto.setRe_step	(rs.getInt("re_step"));
				dto.setRe_level	(rs.getInt("re_level"));
				dto.setContent	(rs.getString("content"));
				dto.setIp		(rs.getString("ip"));
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs    != null)	rs.close();
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}	// getArticle()

	public void addCount(int num) {
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		
		try {
			String	sql	= "update board set readcount=readcount+1 where num=?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}	// addCount()

	public int checkPasswd(int num, String passwd) {
		int				result	= 0;
		BoardDataBean	dto		= getArticle(num);
		
		if(passwd.equals(dto.getPasswd())) {
			// 비밀번호가 같다
			result = 1;
		} else {
			// 비밀번호가 다르다
			result = 0;
		}
		
		return result;
	}	// check()

	public int deleteArticle(int num) {
		int	result = 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;

		//						ref		re_step		re_level
		// 제목글				12		0			0
		//  ㄴ 나중답글			12		1			1
		//  ㄴ 답글				12		2			1		
		//      ㄴ 재답글		12		3			2
		
		//	답글이 있는지 찾기
		//	ref			==			: 같아야 함
		//	re_step		> + 1		: 나보다 하나 커야함
		//	re_level	>			: 나보다 커야함
		
		// "나중답글"을 삭제하면
		//						ref		re_step		re_level
		// 제목글				12		0			0
		//  ㄴ 답글				12		2			1		
		//      ㄴ 재답글		12		3			2
		
		// re_step이 나보다 하나 큰게 없음 >> 제목글을 삭제하게 됨
		
		// 따라서 게시글을 삭제하기 전에
		// 삭제하려고 하는 게시글보다 re_step이 큰 게시글의 re_step을
		// 하나씩 당겨줘야 함

		try {
			BoardDataBean	dto			= getArticle(num);
			int				ref			= dto.getRef();
			int				re_step		= dto.getRe_step();
			int				re_level	= dto.getRe_level();

			String	sql	= "select * from board where ref=? and re_step=?+1 and re_level>?";
			
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.setInt(3, re_level);
			rs		= pstmt.executeQuery();

			if(rs.next()) {
				// 답글이 있다
				result	= -1;
			} else {
				// 답글이 없다
				pstmt.close();
				
				sql		= "update board set re_step=re_step-1 where ref=? and re_step>?";
				pstmt	= con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				result	= pstmt.executeUpdate();

				pstmt.close();
				sql		= "delete from board where num=?";
				pstmt	= con.prepareStatement(sql);
				pstmt.setInt(1, num);
				result	= pstmt.executeUpdate();
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs    != null)	rs.close();
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}	// deleteArticle()
	
	public int modifyArticle(BoardDataBean dto) {
		int					result	= 0;
		Connection			con	= null;
		PreparedStatement	pstmt	= null;
		
		try {
			String	sql	= "update board set subject=?, content=?, passwd=? where num=?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setString	(1, dto.getSubject());
			pstmt.setString	(2, dto.getContent());
			pstmt.setString	(3, dto.getPasswd());
			pstmt.setInt	(4, dto.getNum());
			result	= pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}









}	// BoardDBBean class
