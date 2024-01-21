package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	public static OrderDAO instance = new OrderDAO();
	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private OrderDAO() {
		
	}
	public static OrderDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	
	public int insertData(String userid, String[] gnum) throws Exception {
		conn = getConnection();
		int cnt = 0;
		String sql = "insert into orders values(?,sysdate,?)";
		ps = conn.prepareStatement(sql);
		for(int i=0;i<gnum.length;i++) {
			ps.setString(1, userid);
			ps.setString(2, gnum[i]);
			cnt += ps.executeUpdate();
		}
		return cnt;
	}
	
	public boolean searchData(String userid, int gnum) throws Exception {
		boolean flag = false;
		conn = getConnection();
		String sql = "select * from orders where userid=? and gnum=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, userid);
		ps.setInt(2, gnum);
		rs = ps.executeQuery();
		if(rs.next()) {
			flag = true;
		}
		return flag;
	}
	
	public ArrayList<OrderBean> getMyGame(String userid) throws Exception {
		conn = getConnection();
		ArrayList<OrderBean> olist = new ArrayList<OrderBean>();
		String sql = "select * from orders where userid='"+userid+"' order by gnum";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			OrderBean ob = new OrderBean();
			ob.setUserid(userid);
			ob.setGnum(rs.getInt("gnum"));
			ob.setOrderdate(rs.getTimestamp("orderdate"));
			olist.add(ob);
		}
		return olist;
	}
	
	public int deleteGame(String userid, int gnum) throws Exception {
		conn = getConnection();
		int cnt =-1;
		String sql = "delete orders where userid=? and gnum=?"; 
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, userid);
		ps.setInt(2, gnum);
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
}
