package com.member.model;

import java.io.BufferedInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO implements MemberDAO_interface {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	
	// Service Locator?
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tfa105g1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		
	private static final String INSERT_STMT = 
		"insert into MEMBER \r\n"
			+ "(EMAIL, "
			+ "`PASSWORD`, "
			+ "FIRST_NAME, "
			+ "LAST_NAME, "
			+ "GENDER, "
			+ "ID_NO, "
			+ "DATE_OF_BIRTH, "
			+ "COUNTRY, "
			+ "PHONE, "
			+ "NICKNAME, "
			+ "SELF_INTRO)\r\n"
		+ "value\r\n"
			+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT \r\n"
			+"MEMBER_ID,\r\n"
			+"EMAIL,\r\n"
			+"`PASSWORD`,\r\n"
			+"FIRST_NAME,\r\n"
			+"LAST_NAME,\r\n"
			+"GENDER,\r\n"
			+"ID_NO,\r\n"
			+"DATE_OF_BIRTH,\r\n"
			+"COUNTRY,\r\n"
			+"PHONE,\r\n"
			+"POINTS,\r\n"
			+"NICKNAME,\r\n"
			+"SELF_INTRO\r\n"
		+"FROM\r\n"
			+"MEMBER\r\n"
		+"order by MEMBER_ID";
	private static final String GET_ONE_STMT = 
		"SELECT \r\n"
			+"MEMBER_ID,\r\n"
			+"EMAIL,\r\n"
			+"`PASSWORD`,\r\n"
			+"FIRST_NAME,\r\n"
			+"LAST_NAME,\r\n"
			+"GENDER,\r\n"
			+"ID_NO,\r\n"
			+"DATE_OF_BIRTH,\r\n"
			+"COUNTRY,\r\n"
			+"PHONE,\r\n"
			+"POINTS,\r\n"
			+"NICKNAME,\r\n"
			+"SELF_INTRO\r\n"		
		+"FROM MEMBER\r\n"
		+ "where MEMBER_ID = ?";
	private static final String DELETE = 
		"DELETE FROM MEMBER where MEMBER_ID = ?";
	private static final String UPDATE = 
		"UPDATE MEMBER \r\n"
		+ "SET \r\n"
		+ "    FIRST_NAME = ?,\r\n"
		+ "    LAST_NAME = ?,\r\n"
		+ "    ID_NO = ?,\r\n"
		+ "    GENDER = ?,\r\n"
		+ "    DATE_OF_BIRTH = ?,\r\n"
		+ "    COUNTRY = ?,\r\n"
		+ "    PHONE = ?\r\n"
		+ "WHERE\r\n"
		+ "    MEMBER_ID = ?";
	
	private static final String UPLOADPIC = 
		"UPDATE MEMBER \r\n"
		+ "SET \r\n"
		+ "    AVATAR = ?\r\n"
		+ "WHERE\r\n"
		+ "    MEMBER_ID = ?";
	
	private static final String READPIC = 
		"SELECT \r\n"
		+ "    AVATAR\r\n"
		+ "FROM\r\n"
		+ "    MEMBER\r\n"
		+ "WHERE\r\n"
		+ "    MEMBER_ID = ?";
	
	private static final String FIND_FOR_LOGIN_STMT = 
		"SELECT \r\n"
		+ "    MEMBER_ID, \r\n"
		+ "    EMAIL, \r\n"
		+ "    `PASSWORD`\r\n"
		+ "FROM\r\n"
		+ "    MEMBER\r\n"
		+ "WHERE\r\n"
		+ "    EMAIL = ?\r\n"
		+ "        AND `PASSWORD` = ?;";
	
	
	@Override
	public  Integer login(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Integer memberid = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_FOR_LOGIN_STMT);
			
			pstmt.setString(1, memberVO.getEmail());
			pstmt.setString(2, memberVO.getPassword());

			rs = pstmt.executeQuery();

			while (rs.next()) {				
				 memberid = rs.getInt("MEMBER_ID");				
			}
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberid;
	}
	
	
	
	
	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getEmail());
			pstmt.setString(2, memberVO.getPassword());
			pstmt.setString(3, memberVO.getFirstname());
			pstmt.setString(4, memberVO.getLastname());
			pstmt.setString(5, memberVO.getGender());
			pstmt.setString(6, memberVO.getIdno());
			pstmt.setDate(7, memberVO.getDateofbirth());
			pstmt.setString(8, memberVO.getCountry());
			pstmt.setString(9, memberVO.getPhone());
			pstmt.setString(10, memberVO.getNickname());
			pstmt.setString(11, memberVO.getSelfintro());
			
			pstmt.executeUpdate();		
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberVO.getFirstname());
			pstmt.setString(2, memberVO.getLastname());
			pstmt.setString(3, memberVO.getIdno());
			pstmt.setString(4, memberVO.getGender());
			pstmt.setDate(5, memberVO.getDateofbirth());			
			pstmt.setString(6, memberVO.getCountry());
			pstmt.setString(7, memberVO.getPhone());
			pstmt.setInt(8, memberVO.getMemberid());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer memberid) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memberid);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	@Override
	public MemberVO findByPrimaryKey(Integer memberid) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, memberid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemberid(rs.getInt("MEMBER_ID"));
				memberVO.setEmail(rs.getString("EMAIL"));
				memberVO.setFirstname(rs.getString("FIRST_NAME"));
				memberVO.setLastname(rs.getString("LAST_NAME"));
				memberVO.setIdno(rs.getString("ID_NO"));
				memberVO.setGender(rs.getString("GENDER"));
				memberVO.setDateofbirth(rs.getDate("DATE_OF_BIRTH"));
				memberVO.setCountry(rs.getString("COUNTRY"));
				memberVO.setPhone(rs.getString("PHONE"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memberVO = new MemberVO();				
				memberVO.setMemberid(rs.getInt("MEMBER_ID"));
				memberVO.setEmail(rs.getString("EMAIL"));
				memberVO.setPassword(rs.getString("PASSWORD"));
				memberVO.setFirstname(rs.getString("FIRST_NAME"));
				memberVO.setLastname(rs.getString("LAST_NAME"));
				memberVO.setGender(rs.getString("GENDER"));
				memberVO.setIdno(rs.getString("ID_NO"));
				memberVO.setDateofbirth(rs.getDate("DATE_OF_BIRTH"));
				memberVO.setCountry(rs.getString("COUNTRY"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setPoints(rs.getInt("PHONE"));
				memberVO.setNickname(rs.getString("NICKNAME"));
				memberVO.setSelfintro(rs.getString("SELF_INTRO"));				
//				memberVO.setAvatar(rs.getBytes("AVATAR"));
				
				
				
				
				list.add(memberVO);  // Store the row in the list
			}
			

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public void upload(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPLOADPIC);
			
			pstmt.setBytes(1, memberVO.getAvatar());			
			pstmt.setInt(2, memberVO.getMemberid());			
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
	@Override
	public byte[] read(Integer memberid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		byte[] buf = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(READPIC);
			
			pstmt.setInt(1, memberid);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("AVATAR"));
			//	buf = new byte[in.available()]; // 4K buffer
				buf = in.readAllBytes();				
			}
			
			
			// Handle any driver errors
		} catch (Exception se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return buf;		
	}
	
	
}
