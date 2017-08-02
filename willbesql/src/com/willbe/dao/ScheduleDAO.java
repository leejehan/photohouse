package com.willbe.dao;

import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.willbe.dto.ScheduleDTO;

public class ScheduleDAO {
	private ScheduleDAO(){
	}
	
	private static ScheduleDAO instance=new ScheduleDAO();
	
	public static ScheduleDAO getInstance(){
		return instance;
	}
	public ArrayList<ScheduleDTO> selectSchedule(String id,String year,String month,String date){
		
		ArrayList<ScheduleDTO> schedulelist=new ArrayList<ScheduleDTO>();
		
		String sql="select * from willbe_schedule where id=? and year=? and month=? and day=?";
		

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,year);
			pstmt.setString(3,month);
			pstmt.setString(4,date);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ScheduleDTO scheduleDTO=new ScheduleDTO();
				scheduleDTO.setSchedule_id(rs.getString("id"));
				scheduleDTO.setSchedule_year(rs.getString("year"));
				scheduleDTO.setSchedule_Month(rs.getString("month"));
				scheduleDTO.setSchedule_Day(rs.getString("day"));
				scheduleDTO.setSchedule_time(rs.getString("time"));
				scheduleDTO.setSchedule_title(rs.getString("title"));
				scheduleDTO.setSchedule_content(rs.getString("content"));
				schedulelist.add(scheduleDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt,rs);
		}
		
		return schedulelist;
	
	}
	
public ArrayList<ScheduleDTO> selectSchedule(String id){
		
		ArrayList<ScheduleDTO> schedulelist=new ArrayList<ScheduleDTO>();
		
		String sql="select * from willbe_schedule where id=?";
		

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				ScheduleDTO scheduleDTO=new ScheduleDTO();
				scheduleDTO.setSchedule_id(rs.getString("id"));
				scheduleDTO.setSchedule_year(rs.getString("year"));
				scheduleDTO.setSchedule_Month(rs.getString("month"));
				scheduleDTO.setSchedule_Day(rs.getString("day"));
				scheduleDTO.setSchedule_time(rs.getString("time"));
				scheduleDTO.setSchedule_title(rs.getString("title"));
				scheduleDTO.setSchedule_content(rs.getString("content"));
				schedulelist.add(scheduleDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt,rs);
		}
		
		return schedulelist;
	
	}
	
	public int insertSchedule(ScheduleDTO scheduleDTO){
		int result=0;
		
		String sql="insert into willbe_schedule(id,year,month,day,time,title,content) values(?,?,?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, scheduleDTO.getSchedule_id());
			pstmt.setString(2, scheduleDTO.getSchedule_year());
			pstmt.setString(3, scheduleDTO.getSchedule_Month());
			pstmt.setString(4, scheduleDTO.getSchedule_Day());
			pstmt.setString(5, scheduleDTO.getSchedule_time());
			pstmt.setString(6, scheduleDTO.getSchedule_title());
			pstmt.setString(7, scheduleDTO.getSchedule_content());
			
			result=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		
		return result;
	}
	
	public int deleteSchedule(String id,String year,String month,String date,String time){
		int result=0;
		
		String sql="delete from willbe_schedule where id=? and year=? and month=? and day=? and time=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2, year);
			pstmt.setString(3, month);
			pstmt.setString(4, date);
			pstmt.setString(5, time);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	public int deleteSchedule(String id){
		int result=0;
		
		String sql="delete from willbe_schedule where id=?";
		
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
