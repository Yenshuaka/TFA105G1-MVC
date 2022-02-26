package com.member.model;

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

	private static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tfa105g1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String FIND_FOR_LOGIN_STMT = "SELECT \r\n"
			+ "	MEMBER_ID, EMAIL, `PASSWORD`, FIRST_NAME, LAST_NAME, GENDER, ID_NO, DATE_OF_BIRTH, COUNTRY, PHONE, POINTS, NICKNAME, SELF_INTRO\r\n"
			+ "FROM MEMBER\r\n" + "WHERE EMAIL = ? AND `PASSWORD` = ?";

	@Override
	public MemberVO login(String email, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_FOR_LOGIN_STMT);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemberid(rs.getInt("MEMBER_ID"));
				memberVO.setEmail(rs.getString("EMAIL"));
				memberVO.setPassword(rs.getString("PASSWORD"));
				memberVO.setFirstname(rs.getString("FIRST_NAME"));
				memberVO.setLastname(rs.getString("LAST_NAME"));
				memberVO.setIdno(rs.getString("ID_NO"));
				memberVO.setGender(rs.getString("GENDER"));
				memberVO.setDateofbirth(rs.getDate("DATE_OF_BIRTH"));
				memberVO.setCountry(rs.getString("COUNTRY"));
				memberVO.setPhone(rs.getString("PHONE"));
				memberVO.setPoints(rs.getInt("POINTS"));
				memberVO.setNickname(rs.getString("NICKNAME"));
				memberVO.setSelfintro(rs.getString("SELF_INTRO"));

			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return memberVO;
	}

	private static final String INSERT_STMT = "insert into MEMBER\r\n"
			+ "	(EMAIL, `PASSWORD`, FIRST_NAME, LAST_NAME, GENDER, ID_NO, DATE_OF_BIRTH, COUNTRY, PHONE, NICKNAME, SELF_INTRO)\r\n"
			+ "value\r\n" + "	(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	private static final String UPDATE = "UPDATE MEMBER\r\n" + "SET\r\n"
			+ " EMAIL = ?, `PASSWORD` = ?, FIRST_NAME = ?, LAST_NAME = ?, ID_NO = ?, GENDER = ?, DATE_OF_BIRTH = ?, COUNTRY = ?, PHONE = ?\r\n"
			+ "WHERE MEMBER_ID = ?";

	@Override
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberVO.getEmail());
			pstmt.setString(2, memberVO.getPassword());
			pstmt.setString(3, memberVO.getFirstname());
			pstmt.setString(4, memberVO.getLastname());
			pstmt.setString(5, memberVO.getIdno());
			pstmt.setString(6, memberVO.getGender());
			pstmt.setDate(7, memberVO.getDateofbirth());
			pstmt.setString(8, memberVO.getCountry());
			pstmt.setString(9, memberVO.getPhone());
			pstmt.setInt(10, memberVO.getMemberid());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	private static final String DELETE = "DELETE FROM MEMBER where MEMBER_ID = ?";

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
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	private static final String GET_ONE_STMT = "SELECT\r\n"
			+ "	MEMBER_ID, EMAIL, `PASSWORD`, FIRST_NAME, LAST_NAME, GENDER, ID_NO, DATE_OF_BIRTH, COUNTRY, PHONE, POINTS, NICKNAME, AVATAR, SELF_INTRO\r\n"
			+ "FROM MEMBER\r\n" + "WHERE MEMBER_ID = ?";

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
				memberVO.setNickname(rs.getString("NICKNAME"));
				memberVO.setSelfintro(rs.getString("SELF_INTRO"));
				memberVO.setAvatar(rs.getBytes("AVATAR"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	private static final String GET_ALL_STMT = "SELECT\r\n"
			+ "	MEMBER_ID, EMAIL, `PASSWORD`, FIRST_NAME, LAST_NAME, GENDER, ID_NO, DATE_OF_BIRTH, COUNTRY, PHONE, POINTS, NICKNAME, SELF_INTRO\r\n"
			+ "FROM MEMBER\r\n" + "order by MEMBER_ID";

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

				list.add(memberVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	private static final String UPLOADPIC = "UPDATE MEMBER \r\n" + "SET \r\n" + "	AVATAR = ?\r\n"
			+ "WHERE MEMBER_ID = ?";

	@Override
	public void uploadPic(MemberVO memberVO) {
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
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

}