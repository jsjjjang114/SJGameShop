package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;

import javax.crypto.spec.RC2ParameterSpec;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import game.GameDAO;

public class UserDAO {
	public static UserDAO instance = new UserDAO();
	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private UserDAO() {
		
	}
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	
	public boolean idCheck(String id) throws Exception {
		conn = getConnection();
		boolean idCheck = false;
		String sql = "select * from members where id='"+id+"'";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			idCheck = true;
		}
		return idCheck;
	}
	public int insertData(UserBean ub) throws Exception {
		conn = getConnection();
		int cnt = -1;
		String sql = "insert into members values(memseq.nextval,?,?,?,?,?,sysdate,?,?)";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1,ub.getName());
		ps.setString(2,ub.getId());
		ps.setString(3,ub.getPassword());
		ps.setString(4,ub.getEmail());
		ps.setTimestamp(5,ub.getBirth());
		ps.setInt(6,ub.getMgroup());
		ps.setString(7,ub.getDeveloper());
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public UserBean getUserInfo(String id,String password) throws Exception {
		conn = getConnection();
		UserBean ub = null;
		String sql = "select * from members where id=? and password=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if(rs.next()) {
			ub = getUserBean(rs);
		} 
		return ub;
	}
	
	public String findpassword(String id,String name,String email) throws Exception {
		conn = getConnection();
		String password = null;
		String sql = "select password from members where id=? and name=? and email=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,email);
		rs = ps.executeQuery();
		if(rs.next()) {
			password = rs.getString("password");
		}
		return password;
	}
	
	public String findid(String name,String email) throws Exception {
		conn = getConnection();
		String id = null;
		String sql = "select id from members where name=? and email=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,email);
		rs = ps.executeQuery();
		if(rs.next()) {
			id = rs.getString("id");
		}
		return id;
	}
	
	public UserBean getUserInfoById(String userid) throws Exception {
		conn = getConnection();
		UserBean ub = null;
		String sql = "select * from members where id='"+userid+"'";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			ub = getUserBean(rs);
		}
		return ub;
	}
	
	public int updateUser(String userid,UserBean ub) throws Exception {
		int cnt = -1;
		conn = getConnection();
		String sql = "update members set password=?, email=?, mgroup=?, developer=? where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, ub.getPassword());
		ps.setString(2, ub.getEmail());
		ps.setInt(3, ub.getMgroup());
		ps.setString(4, ub.getDeveloper());
		ps.setString(5, userid);
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public UserBean getUserBean(ResultSet rs) throws SQLException {
		UserBean ub = new UserBean(); 
		ub.setNo(rs.getInt("no"));
		ub.setId(rs.getString("id"));
		ub.setName(rs.getString("name"));
		ub.setPassword(rs.getString("password"));
		ub.setEmail(rs.getString("email"));
		ub.setBirth(rs.getTimestamp("birth"));
		ub.setJoindate(rs.getTimestamp("joindate"));
		ub.setMgroup(rs.getInt("mgroup"));
		ub.setDeveloper(rs.getString("developer"));
		return ub;
	}
	
	
}
