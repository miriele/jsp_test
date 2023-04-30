package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDBBean {
	private static MemberDBBean	instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws NamingException, SQLException {
		Context	initCtx	= new InitialContext();
		Context	envCtx	= (Context)initCtx.lookup("java:comp/env");
		DataSource	ds	= (DataSource)envCtx.lookup("jdbc/bit");
		
		return ds.getConnection();
	}
	
	public String getNick(String id) {
		Connection			con	= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		String	nick	= null;
		
		try {
			String sql = "select nick from member_m1 where id=?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs	= pstmt.executeQuery();
			
			if(rs.next()) {
				// 닉네임이 있다 : id가 있는데 nick이 없을 수 없다
				nick	= rs.getString("nick");
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return nick;
	}
	
	public int insertMember(MemberDataBean dto) {
		Connection			con		= null;
		PreparedStatement	pstmt	= null;

		int		result	= 0;
		
		try {
			String	sql	= "insert into member_m1(id, nick, dept, passwd, name, tel, email, reg_date)"
					+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
			
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			
			pstmt.setString		(1, dto.getId());
			pstmt.setString		(2, dto.getNick());
			pstmt.setInt		(3, dto.getDept());
			pstmt.setString		(4, dto.getPasswd());
			pstmt.setString		(5, dto.getName());
			pstmt.setString		(6, dto.getTel());
			pstmt.setString		(7, dto.getEmail());
			pstmt.setTimestamp	(8, dto.getReg_date());
			
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int checkId(String id) {
		int					result	= 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String sql = "select * from member_m1 where id=?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs	= pstmt.executeQuery();
			
			if(rs.next()) {
				// 아이디가 있다
				result	= 1;
			} else {
				// 아이디가 없다
				result	= 0; 
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int checkNick(String nick) {
		int					result	= 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String sql = "select * from member_m1 where nick=?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);

			pstmt.setString(1, nick);

			rs	= pstmt.executeQuery();
			
			if(rs.next()) {
				// 아이디가 있다
				result	= 1;
			} else {
				// 아이디가 없다
				result	= 0; 
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int checkPasswd(String id, String passwd) {
		int	result	= 0;
		
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String sql	= "select * from member_m1 where id=?";
			
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);

			pstmt.setString(1, id);
			
			rs	= pstmt.executeQuery();
			
			if(rs.next()) {
				// 아이디가 있다
				if(passwd.equals(rs.getString("passwd"))) {
					// 비밀번호가 같다
					result = 1;
				} else {
					// 비밀번호가 다르다
					result = 0;
				}
			} else {
				// 아디가 없다
				result = -1;
			}
		} catch (NamingException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
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
	}
	
	public int deleteMember(String id) {
		int result = 0;

		Connection			con		= null;
		PreparedStatement	pstmt	= null;

		try {
			String	sql = "delete from member_m1 where id=?";

			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
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
	
	public MemberDataBean getMember(String id) {
		MemberDataBean	dto	= null;
		
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		ResultSet			rs		= null;
		
		try {
			String sql = "select * from member_m1 where id=?";
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs	= pstmt.executeQuery();
			
			if(rs.next()) {
				// 결과가 있다
				dto	= new MemberDataBean();
				
				dto.setId		(rs.getString("id"));
				dto.setNick		(rs.getString("nick"));
				dto.setDept		(rs.getInt("dept"));
				dto.setPasswd	(rs.getString("passwd"));
				dto.setName		(rs.getString("name"));
				dto.setTel		(rs.getString("tel"));
				dto.setEmail	(rs.getString("email"));
				dto.setReg_date	(rs.getTimestamp("reg_date"));
			} else {
				// 결과가 없다 : 결과가 없을 수 없으므로 else를 잡을 필요가 없다
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
	}
	
	public int modifyMember(MemberDataBean dto) {
		int					result	= 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		
		try {
			String	sql	= "update member_m1 set nick=?, passwd=?, tel=?, email=? where id=?";
			
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setString	(1, dto.getNick());
			pstmt.setString	(2, dto.getPasswd());
			pstmt.setString	(3, dto.getTel());
			pstmt.setString	(4, dto.getEmail());
			pstmt.setString	(5, dto.getId());
			
			result	= pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int modifyMemberDept(MemberDataBean dto) {
		int					result	= 0;
		Connection			con		= null;
		PreparedStatement	pstmt	= null;
		
		try {
			String	sql	= "update member_m1 set dept=? where id=?";
			
			con		= getConnection();
			pstmt	= con.prepareStatement(sql);
			pstmt.setInt	(1, dto.getDept());
			pstmt.setString	(2, dto.getId());
			
			result	= pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(con   != null)	con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
