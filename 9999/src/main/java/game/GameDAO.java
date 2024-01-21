package game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
 
import com.oreilly.servlet.MultipartRequest;
  
 
public class GameDAO {
	public static GameDAO instance = new GameDAO();
	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private GameDAO() {
		
	}
	public static GameDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
//========================================================================================		
	public ArrayList<GameBean> getAll() throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select * from game order by grel_date desc";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	public ArrayList<GameBean> getAllBySales() throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select * from game where sales>=10 order by sales desc";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
//========================================================================================	
	
	public ArrayList<GameBean> getNewArticles(int start, int end) throws Exception {
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select rownum as rank, gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from game order by grel_date desc))\r\n"
				+ "where rank between ? and ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
	
	
	public ArrayList<GameBean> getAllByBest(int start,int end) throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select rownum as rank, gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from game where sales>=10 order by sales desc))\r\n"
				+ "where rank between ? and ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
	
	
	
	
//========================================================================================		
	public ArrayList<GameBean> getAllByPlatform(int start,int end, String platform) throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select rownum as rank, gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from game where platform=? order by grel_date desc))\r\n"
				+ "where rank between ? and ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, platform);
		ps.setInt(2, start);
		ps.setInt(3, end);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
	public ArrayList<GameBean> getAllByTitle(int start, int end, String searchWord) throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select rownum as rank, gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from game where gtitle like '%"+searchWord+"%' order by grel_date desc))\r\n"
				+ "where rank between ? and ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
	public ArrayList<GameBean> getAllByGenre(int start,int end, String ggenre) throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select rownum as rank, gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from game where ggenre like '%"+ggenre+"%' order by grel_date desc))\r\n"
				+ "where rank between ? and ?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
	public ArrayList<GameBean> getAllByDev(int start,int end,String developer) throws Exception{
		conn = getConnection();
		ArrayList<GameBean> lists = new ArrayList<GameBean>();
		String sql = "select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select rownum as rank, gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from (select gnum, gtitle,gdeveloper,gprice,ggenre,gcontent,grel_date,grating,gimage,platform,sales \r\n"
				+ "from game where gdeveloper=? order by grel_date desc))\r\n"
				+ "where rank between ? and ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, developer);
		ps.setInt(2, start);
		ps.setInt(3, end);
		rs = ps.executeQuery();
		while(rs.next()) {
			GameBean gb = getGameBean(rs);
			lists.add(gb);
		}
		return lists;
	}
	
	
	
//개수 ==============================================================================
	public int getAllCount() throws SQLException {
		conn = ps.getConnection();
		String sql = "select count(*) as cnt from game"; 
		int cnt=0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt"); 
		}
		return cnt;
	}
	public int getAllBest() throws SQLException {
		conn = ps.getConnection();
		String sql = "select count(*) as cnt from game where sales>10"; 
		int cnt=0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt"); 
		}
		return cnt;
	}
	public int getDevCount(String developer) throws SQLException {
		conn = ps.getConnection();
		String sql = "select count(*) as cnt from game where gdeveloper='"+developer+"'"; 
		int cnt=0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");  
		}
		return cnt;
	}
	
	public int getConutGenre(String ggenre) throws SQLException {
		conn = ps.getConnection();
		String sql = "select count(*) as cnt from game where ggenre like '%"+ggenre+"%'"; 
		int cnt=0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");  
		}
		return cnt;
	}
	public int getCountSearch(String searchWord) throws SQLException {
		conn = ps.getConnection();
		String sql = "select count(*) as cnt from game where gtitle like '%"+searchWord+"%'"; 
		int cnt=0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");  
		}
		return cnt;
	}
	public int getCountPlatform(String platform) throws SQLException {
		conn = ps.getConnection();
		String sql = "select count(*) as cnt from game where platform='"+platform+"'"; 
		int cnt=0;
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");  
		}
		return cnt;
	}
	
	
	
	
	
	public GameBean getByGnum(int gnum) throws Exception {
		conn = getConnection();
		GameBean gb = null;
		String sql = "select * from game where gnum='"+gnum+"'";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			gb = getGameBean(rs);  
		} 
		return gb;
	}
	
	public boolean searchgame(MultipartRequest mr) throws Exception { 
		conn = getConnection();
		boolean flag = false;
		String sql = "select * from game where gtitle=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, mr.getParameter("gtitle"));
		rs = ps.executeQuery();
		if(rs.next()) {
			flag = true;
		}
		return flag;
	}//---
	
	public void updateSales(String[] gnum) throws Exception {
		conn = getConnection();
		String sql = "update game set sales=sales+1 where gnum=?";
		
		ps = conn.prepareStatement(sql);
		for(int i=0;i<gnum.length;i++) {
			ps.setString(1,gnum[i]);
			ps.executeUpdate();
		}
	}//판매량 +1
	
	public int insertGame(MultipartRequest mr) throws Exception {
		conn = getConnection();
		int cnt = -1;
		String[] ggenreArr = mr.getParameterValues("ggenre");
		String ggenre = "";
		for(int i=0;i<ggenreArr.length;i++) {
			if(i!=(ggenreArr.length-1)) {
				ggenre += ggenreArr[i]+", ";
			} else {
				ggenre += ggenreArr[i];
			}
		}
		String sql = "insert into game values(gameseq.nextval,?,?,?,?,?,?,?,?,?,0)";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, mr.getParameter("gtitle"));
		ps.setString(2, mr.getParameter("developer"));
		ps.setInt(3, Integer.parseInt(mr.getParameter("gprice")));
		ps.setString(4, ggenre);
		ps.setString(5, mr.getParameter("gcontent"));
		ps.setString(6, mr.getParameter("grel_date"));
		ps.setString(7, mr.getParameter("grating"));
		ps.setString(8, mr.getFilesystemName("gimage"));
		ps.setString(9, mr.getParameter("platform"));
		cnt = ps.executeUpdate();
		
		return cnt;
	}//---
	
	public LinkedHashSet<String> getAllDev() throws Exception{
		LinkedHashSet<String> list2 = new LinkedHashSet<String>();
		conn = getConnection();
		String sql = "select gdeveloper from game";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			list2.add(rs.getString("gdeveloper"));
		}
		return list2;
	}
	
	public GameBean getGameBean(ResultSet rs) throws SQLException {
		GameBean gb = new GameBean();
		gb.setGnum(rs.getInt("gnum"));
		gb.setGtitle(rs.getString("gtitle"));
		gb.setGdeveloper(rs.getString("gdeveloper"));
		gb.setGprice(rs.getInt("gprice"));
		gb.setGgenre(rs.getString("ggenre"));
		gb.setGcontent(rs.getString("gcontent"));
		gb.setGrel_date(rs.getTimestamp("grel_date"));
		gb.setGrating(rs.getString("grating"));
		gb.setGimage(rs.getString("gimage"));
		gb.setPlatform(rs.getString("platform"));
		gb.setSales(rs.getInt("sales"));
		return gb;
	}
}
