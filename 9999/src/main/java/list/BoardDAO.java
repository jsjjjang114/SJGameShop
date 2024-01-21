package list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	public static BoardDAO instance = new BoardDAO();
	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private BoardDAO() {
		
	}
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}
	
	public ArrayList<BoardBean> getArticles(int start, int end){
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setGnum(rs.getInt("gnum"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return lists;
	} //getArticles
	
	public ArrayList<BoardBean> getArticlesByWriter(int start, int end, String username){
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board where writer=?";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setGnum(rs.getInt("gnum"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	public ArrayList<BoardBean> getArticlesBySearch(int start, int end, String searchWord){
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, gnum, writer, subject, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board where subject like '%"+searchWord+"%'";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setGnum(rs.getInt("gnum"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public int getArticleCount() throws Exception {
		conn = getConnection();
		int count = 0;
		String sql = "select count(*) as count from board";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		return count;
	}// 전체개수
	
	public int getArticleCountByWriter(String username) throws Exception {
		conn = getConnection();
		int count = 0;
		String sql = "select count(*) as count from board where writer='"+username+"'";
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		return count;
	}// 나의리뷰개수
	
	public int insertArticle(BoardBean bb, String username) throws Exception {
		conn = getConnection();
		int cnt = -1;
		String sql = "insert into board(num,gnum,writer,subject,reg_date,ref,re_step,re_level,content,ip)\r\n"
				+ "values(board_seq.nextval,?,?,?,sysdate,board_seq.currval,0,0,?,?)";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, bb.getGnum());
		ps.setString(2, username);
		ps.setString(3, bb.getSubject());
		ps.setString(4, bb.getContent());
		ps.setString(5, bb.getIp());
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public int updateArticle(BoardBean bb, int num) throws Exception {
		conn = getConnection();
		int cnt=-1;
		String sql = "update Board set subject=?, content=? where num=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, bb.getSubject());
		ps.setString(2, bb.getContent());
		ps.setInt(3, num);
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public BoardBean getArticleByNum(int num) throws Exception {
		conn = getConnection();
		BoardBean bb = null;
		String sql0 = "update board set readcount=readcount+1 where num='"+num+"'";
		String sql = "select * from board where num='"+num+"'";
		
		ps = conn.prepareStatement(sql0);
		ps.executeUpdate();
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			bb = new BoardBean();
			bb.setNum(num);
			bb.setGnum(rs.getInt("gnum"));
			bb.setWriter(rs.getString("writer"));
			bb.setSubject(rs.getString("subject"));
			bb.setReg_date(rs.getTimestamp("reg_date"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRef(rs.getInt("ref"));
			bb.setRe_step(rs.getInt("re_step"));
			bb.setRe_level(rs.getInt("re_level"));
			bb.setContent(rs.getString("content"));
			bb.setIp(rs.getString("ip"));
		}
		return bb;
	}
	
	public int deleteArticle(int num) throws Exception {
		conn = getConnection();
		int cnt = -1;
		String sql = "delete board where num=?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		cnt = ps.executeUpdate();
		return cnt;
	}
	
	public int insertReplyArticle(BoardBean bb) throws Exception {
		conn = getConnection();
		int cnt = -1;
		String sql0 = "update board set re_step=re_step+1 where ref=? and re_step>?"; 
		String sql = "insert into board(num,gnum,writer,subject,reg_date,ref,re_step,re_level,content,ip)\r\n"
				+ "values(board_seq.nextval,?,?,?,sysdate,?,?,?,?,?)";
		ps = conn.prepareStatement(sql0);
		ps.setInt(1, bb.getRef());
		ps.setInt(2, bb.getRe_step());
		ps.executeUpdate();
		
		int re_step = bb.getRe_step()+1;
		int re_level = bb.getRe_level()+1;
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, bb.getGnum());
		ps.setString(2, bb.getWriter());
		ps.setString(3, bb.getSubject());
		ps.setInt(4, bb.getRef());
		ps.setInt(5, re_step);
		ps.setInt(6, re_level);
		ps.setString(7, bb.getContent());
		ps.setString(8, bb.getIp());
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
}
