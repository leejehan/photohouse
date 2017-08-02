package willbe.together.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class replyDAO {
DataSource ds;
	
	public replyDAO(){
		try{
			
			Context context=new InitialContext();
			ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");   
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<replyDTO> replylist(int num){
		ArrayList<replyDTO> dtoList=new ArrayList<replyDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int replyCount=0;
		
		try{
			conn=ds.getConnection();
			String sql="select * from togetherReply where board_num=? order by reply_num";			
			pstmt = conn.prepareStatement(sql);
						
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				replyCount=replyCount+1;
				int reply_num=rs.getInt("reply_num");
				int board_num=rs.getInt("board_num");
				String member_id=rs.getString("member_id");				
				String reply_contents=rs.getString("reply_contents");
				Timestamp reply_date=rs.getTimestamp("reply_date");				
				int reply_like=rs.getInt("reply_like");
							
				replyDTO dto=new replyDTO(reply_num, board_num, member_id, reply_contents, reply_date, reply_like);
				dtoList.add(dto);			
			}			
			
		}catch(Exception e){
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

	public int replyCount(int num) {		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int replyCount=0;
		
		try{
			conn=ds.getConnection();
			String sql="select * from togetherReply where board_num=? order by reply_num";			
			pstmt = conn.prepareStatement(sql);
						
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				replyCount=replyCount+1;											
			}		
			
		}catch(Exception e){
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
		return replyCount;
	}

	public void inputReply(String contents, String id, String num) {		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "insert into togetherReply (board_num, member_id, reply_contents, reply_date, reply_like)"
					+" values(?, ?, ?, now(), 0)";
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, Integer.parseInt(num));			
			pstmt.setString(2, id);
			pstmt.setString(3, contents);
			
			pstmt.executeUpdate();
			
			
			
			sql = "update togetherBoard set board_readcount=board_readcount-1 where board_num=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));			
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
	
	public void replyAllDelete(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = ds.getConnection();
			String sql = "delete from togetherReply where board_num=?";
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

	public void replyDelete(String replyNum, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{			
			conn = ds.getConnection();
			String sql = "select member_id from togetherReply where reply_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(replyNum));			
			rs=pstmt.executeQuery();
			rs.next();			
			String member_id=rs.getString("member_id");
			
			
			if(member_id.equals(id)){				
				conn = ds.getConnection();
				sql = "delete from togetherReply where reply_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(replyNum));
								
				pstmt.executeUpdate();		
			}				
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
