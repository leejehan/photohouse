package willbe.together.db;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {
DataSource ds;
	
	public boardDAO(){
		try{
			
			Context context=new InitialContext();
			ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public ArrayList<boardDTO> boardlist(){		
		ArrayList<boardDTO> dtoList=new ArrayList<boardDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		
		
		try {
			conn=ds.getConnection();
			String sql="select * from togetherBoard order by board_num desc";
			pstmt=conn.prepareStatement(sql);	
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				int board_num=rs.getInt("board_num");
				String board_title=rs.getString("board_title");
				String member_id=rs.getString("member_id");				
				Timestamp board_date=rs.getTimestamp("board_date");
				int board_readcount=rs.getInt("board_readcount");
				int board_like=rs.getInt("board_like");
							
				boardDTO dto=new boardDTO(board_num, board_title, member_id, board_date, board_readcount, board_like);
				dtoList.add(dto);			
			}			
								
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return dtoList;
		
	}
	
	public void write(String id, String title, String contents, String file) {		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "insert into togetherBoard (member_id, board_title, "
					+ "board_contents, board_date, board_readcount, "
					+ "board_like, board_file) values("
					+ "?, ?, ?, now(), 0, 0, ?)";

			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			pstmt.setString(2, title);			
			pstmt.setString(3, contents);			
			pstmt.setString(4, file);

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}
	
	public boardDTO writeView(String num) {		
		boardDTO dto = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			String sql = "select * from togetherBoard where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));

			rs = pstmt.executeQuery();
			
			int board_readcount;
			
			while (rs.next()) {
				String member_id=rs.getString("member_id");				
				Timestamp board_date=rs.getTimestamp("board_date");
				String board_file = rs.getString("board_file");
				String board_title = rs.getString("board_title");
				String board_contents = rs.getString("board_contents").trim();
				int board_like=rs.getInt("board_like");
				board_readcount = rs.getInt("board_readcount");				

				dto = new boardDTO(num, member_id, board_title, board_date, board_contents, board_readcount, board_like, board_file);				
			}
			sql = "update togetherBoard set board_readcount=board_readcount+1 where board_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return dto;
	}
	public boolean idCheck(String id, String num) {
		boolean check=false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			String sql = "select member_id from togetherBoard where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));

			rs = pstmt.executeQuery();
			
			int board_readcount;
			
			rs.next();
			String db_id=rs.getString("member_id");				
			
			if(id.equals(db_id)){				
				check=true;								
			}else{				
				check=false;
			}								
		}catch(Exception e){
			e.printStackTrace();			
		}finally {
			try {
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		return check;
	}
	public boardDTO modifyInput(String id, String num) {
		boardDTO dto=null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from togetherBoard where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String member_id=rs.getString("member_id");
				String board_title=rs.getString("board_title");						
				String board_contents=rs.getString("board_contents");
				String board_file=rs.getString("board_file");
							
				dto=new boardDTO(num, member_id, board_title, board_contents, board_file);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		return dto;
	}
	public void delete(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = ds.getConnection();
			String sql = "delete from togetherBoard where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
	}
	public void modify(String num, String title, String contents, String userFile) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try{
			conn = ds.getConnection();
			String sql = "update togetherBoard set board_title=?, board_contents=?, board_file=? where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, userFile);
			pstmt.setInt(4, Integer.parseInt(num));
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		
	}
	public boardDTO pagelist() {		
		boardDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		int board_numCount=0; //珥� 寃뚯떆湲� �닔
		int listSize=5;	//�븳�럹�씠吏��떦 蹂댁씪 寃뚯떆湲� �닔 5媛쒕줈 �꽕�젙	
		int pageNum=0; //珥� �럹�씠吏� �닔
		int pageSize=5; //�븳�럹�씠吏��떦 蹂댁씪 �럹�씠吏� �닔
		int remcount=0; //�궓�� �럹�씠吏� �닔		
		
		try {
			conn=ds.getConnection();
			String sql="select * from togetherBoard order by board_num desc";
			pstmt=conn.prepareStatement(sql);	
			
			rs=pstmt.executeQuery();			
			while(rs.next()){				
				board_numCount=board_numCount+1;
			}
			
			if(board_numCount%listSize==0){ //珥� 寃뚯떆湲� �닔% �럹�씠吏��떦 寃뚯떆湲��닔 �굹癒몄�媛� 0�씠硫�  
				pageNum=(board_numCount/listSize);
			}else{//�븘�땲硫�
				pageNum=(board_numCount/listSize)+1;
			}
			
			if(board_numCount>listSize)remcount=board_numCount%listSize;			
					
			dto=new boardDTO(board_numCount, listSize, pageNum, remcount, pageSize);			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		return dto;
	}
	public ArrayList<boardDTO> boardSearchList(String SearchTitle) {
		String title="%"+SearchTitle+"%";
				
		ArrayList<boardDTO> dtoList=new ArrayList<boardDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		
		try {
			conn=ds.getConnection();
			String sql="select * from togetherBoard where board_title like ? order by board_num desc";
			pstmt=conn.prepareStatement(sql);	
			pstmt.setString(1, title);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				int board_num=rs.getInt("board_num");
				String board_title=rs.getString("board_title");
				String member_id=rs.getString("member_id");				
				Timestamp board_date=rs.getTimestamp("board_date");
				int board_readcount=rs.getInt("board_readcount");
				int board_like=rs.getInt("board_like");
							
				boardDTO dto=new boardDTO(board_num, board_title, member_id, board_date, board_readcount, board_like);
				dtoList.add(dto);			
			}			
								
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return dtoList;
	}
	public boardDTO pageSearchList(String SearchTitle) {
		String title="%"+SearchTitle+"%";
		
		boardDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		int board_numCount=0;
		int listSize=5;		
		int pageNum=0;
		int pageSize=5;
		int remcount=0;
		
		
		try {
			conn=ds.getConnection();
			String sql="select * from togetherBoard where board_title like ?";
			pstmt=conn.prepareStatement(sql);	
			pstmt.setString(1, title);
			
			rs=pstmt.executeQuery();			
			while(rs.next()){				
				board_numCount=board_numCount+1;
			}
			
			if(board_numCount%listSize==0){ 
				pageNum=(board_numCount/listSize);
			}else{
				pageNum=(board_numCount/listSize)+1;
			}			
			if(board_numCount>listSize)remcount=board_numCount%listSize;
			
			
					
			dto=new boardDTO(board_numCount, listSize, pageNum, remcount, pageSize);			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	public boolean likeSearch(String id, String num) {
		boolean like=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	
				
		try {
			conn=ds.getConnection();
			String sql="select * from togetherBoard_like where like_id=? and board_num=?";
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			pstmt.setInt(2, Integer.parseInt(num));
			rs=pstmt.executeQuery();			
			
			
			if(rs.next()){
				String like_id=rs.getString("like_id");				
				if(like_id.equals(id)){					
					sql="update togetherBoard set board_readcount=board_readcount-1 where board_num=?";
					
					pstmt=conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(num));
					
					pstmt.executeUpdate();
					
					like=false;
					return like;
				}else{					
					sql="insert into togetherBoard_like values (?, ?)";				
					
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setInt(2, Integer.parseInt(num));
					
					pstmt.executeUpdate();
					
					sql="update togetherBoard set board_like=board_like+1 where board_num=?";
					
					pstmt=conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(num));
					
					pstmt.executeUpdate();
					
					sql="update togetherBoard set board_readcount=board_readcount-1 where board_num=?";
					
					pstmt=conn.prepareStatement(sql);	
					pstmt.setInt(1, Integer.parseInt(num));
					
					pstmt.executeUpdate();
					like=true;
				}
			}else{				
				sql="insert into togetherBoard_like values (?, ?)";				
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, Integer.parseInt(num));
				
				pstmt.executeUpdate();
				
				sql="update togetherBoard set board_like=board_like+1 where board_num=?";
				
				pstmt=conn.prepareStatement(sql);	
				pstmt.setInt(1, Integer.parseInt(num));
				
				pstmt.executeUpdate();
				
				sql="update togetherBoard set board_readcount=board_readcount-1 where board_num=?";
				
				pstmt=conn.prepareStatement(sql);	
				pstmt.setInt(1, Integer.parseInt(num));
				
				pstmt.executeUpdate();
				
				like=true;
			}						
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return like;
		
	}
	public int likeCount(String id, String num) {
		int count=0;	
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		try {
			conn=ds.getConnection();
			String sql="select * from togetherBoard_like where like_id=? and board_num=?";
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			pstmt.setInt(2, Integer.parseInt(num));
			rs=pstmt.executeQuery();	
			
			if(rs.next()){
				count=count+1;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		return count;
	}
	public void likeAllDelete(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try{
			conn = ds.getConnection();
			String sql = "delete from togetherBoard_like where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
	}
	public String fileDown(String num) {
		String downFile=null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = ds.getConnection();
			String sql = "select * from togetherBoard where board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			rs=pstmt.executeQuery();
			
			rs.next();
			String filename = rs.getString("board_file");  // �뙆�씪紐낃낵 �뙆�씪�씠 ���옣�맂 寃쎈줈瑜� �뼸�뒗�떎.
			System.out.println("dao select泥섎━�븳 �뙆�씪紐�"+filename);
			downFile = new String(filename.getBytes("KSC5601"),"8859_1");			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		return downFile;		
	}
	
	public void allDeleteBoard(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			conn = ds.getConnection();
			
			String sql="delete from togetherBoard_like where like_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			pstmt.executeUpdate();			
			
			sql="delete from questionReply where member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			pstmt.executeUpdate();
			
			sql = "delete from questionBoard where member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
	}
}
