package com.willbe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.willbe.dto.DiaryDTO;

import util.DBManager;

public class DiaryDAO {
	private DiaryDAO(){
	}
	
	private static DiaryDAO instance=new DiaryDAO();
	
	public static DiaryDAO getInstance(){
		return instance;
	}
	public int insertDiary(DiaryDTO diaryDTO){
		int result=0;
		
		String sql="insert into willbe_diary(id,year,month,day,content) values(?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, diaryDTO.getDiary_id());
			pstmt.setString(2, diaryDTO.getDiary_year());
			pstmt.setString(3, diaryDTO.getDiary_month());
			pstmt.setString(4, diaryDTO.getDiary_day());
			pstmt.setString(5, diaryDTO.getDiary_content());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		
		return result;
	}
	
	public DiaryDTO selectDiary(String diary_id,String diary_year,String diary_month,String diary_date){
		DiaryDTO diaryDTO=null;
		
		String sql="select * from willbe_diary where id=? and year=? and month=? and day=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, diary_id);
			pstmt.setString(2, diary_year);
			pstmt.setString(3, diary_month);
			pstmt.setString(4, diary_date);
			rs=pstmt.executeQuery();
			if(rs.next()){
				diaryDTO=new DiaryDTO();
				diaryDTO.setDiary_id(rs.getString("id"));
				diaryDTO.setDiary_year(rs.getString("year"));
				diaryDTO.setDiary_month(rs.getString("month"));
				diaryDTO.setDiary_day(rs.getString("day"));
				diaryDTO.setDiary_content(rs.getString("content"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt,rs);
		}
		
		return diaryDTO;
	}
	
	public int updateDiary(DiaryDTO diaryDTO){
		int result=0;
		
		String sql="update willbe_diary set content=? where id=? and year=? and month=? and day=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, diaryDTO.getDiary_content());
			pstmt.setString(2, diaryDTO.getDiary_id());
			pstmt.setString(3, diaryDTO.getDiary_year());
			pstmt.setString(4, diaryDTO.getDiary_month());
			pstmt.setString(5, diaryDTO.getDiary_day());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		
		return result;
	}
	
	public int deletediary(String id){
		int result=0;
		
		String sql="delete from willbe_diary where id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	
}
