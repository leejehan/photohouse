package willbe.memo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class memoDAO {
DataSource ds;
	
	public memoDAO(){
		try{			
			Context context=new InitialContext();
			ds=(DataSource)context.lookup("java:comp/env/jdbc/mysql");   
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<memoDTO> memoList(String id){
		ArrayList<memoDTO> dtoList=new ArrayList<memoDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		String color="p";
		
		
		try{
			conn=ds.getConnection();
			String sql="select * from willbe_memo where member_id=? order by memo_num desc";
			pstmt=conn.prepareStatement(sql);	
			pstmt.setString(1, id);
						
			rs=pstmt.executeQuery();
			while(rs.next()){
				int memo_num=rs.getInt("memo_num");
				String contents=rs.getString("memo_contents");
								
				if(memo_num%2==0){
					color="p";
				}else{
					color="y";
				}
				
				memoDTO dto=new memoDTO(memo_num, contents, color);
				dtoList.add(dto);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
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
		
		return dtoList;
		
	}
	
	
	public int countList(String id){
		int Count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try{
			conn=ds.getConnection();
			String sql="select * from willbe_memo where member_id=? order by memo_num desc";
			pstmt=conn.prepareStatement(sql);	
			pstmt.setString(1, id);
						
			rs=pstmt.executeQuery();
			while(rs.next()){
				Count++;				
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
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
		
		return Count;		
	}

	public void memoInsert(String id, String contents) {
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try{			
			conn=ds.getConnection();
			
			String sql="insert into willbe_memo (member_id, memo_contents) values"
					+"(?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, contents);
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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

	public void deleteMemo(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = ds.getConnection();
			String sql = "delete from willbe_memo where memo_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();				
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
	}

	public void memoModify(String id, String contents, String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{			
			conn=ds.getConnection();
			
			String sql="update willbe_memo set member_id=?, memo_contents=? where memo_num=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, contents);
			pstmt.setInt(3, Integer.parseInt(num));
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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
	
	public void allDelete(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = ds.getConnection();
			String sql = "delete from willbe_memo where member_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (id));
			
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn != null)conn.close();
				if(pstmt != null)pstmt.close();				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
}
