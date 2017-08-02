package com.willbe.dao;

import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.willbe.dto.MemberDTO;

public class MemberDAO {
	private MemberDAO(){
	}
	
	private static MemberDAO instance=new MemberDAO();
	
	public static MemberDAO getInstance(){
		return instance;
	}
	
	public MemberDTO getMember(String member_id){
		MemberDTO memberDTO=null;
		String sql="select * from willbe_member where id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				memberDTO=new MemberDTO();
				memberDTO.setMember_id(rs.getString("id"));
				memberDTO.setMember_pw(rs.getString("pass"));
				memberDTO.setMember_name(rs.getString("name"));
				memberDTO.setMember_gender(rs.getString("sex"));
				memberDTO.setMember_phone(rs.getString("phone"));
				memberDTO.setMember_email(rs.getString("email"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt,rs);
		}
		return memberDTO;
	}
	public int insertMember(MemberDTO memberDTO){
		int result=0;
		
		String sql="insert into willbe_member(id,pass,name,sex,phone,email) values(?,?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMember_id());
			pstmt.setString(2, memberDTO.getMember_pw());
			pstmt.setString(3, memberDTO.getMember_name());
			pstmt.setString(4, memberDTO.getMember_gender());
			pstmt.setString(5, memberDTO.getMember_phone());
			pstmt.setString(6, memberDTO.getMember_email());
			
			result=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt);
		}
		
		return result;
	}
	
	public MemberDTO findMember(String member_name,String member_email){
		MemberDTO memberDTO=null;
		
		String sql="select * from willbe_member where name=? and email=?";
		

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member_name);
			pstmt.setString(2,member_email);
			rs=pstmt.executeQuery();
			if(rs.next()){
				memberDTO=new MemberDTO();
				memberDTO.setMember_id(rs.getString("id"));
				memberDTO.setMember_pw(rs.getString("pass"));
				memberDTO.setMember_name(rs.getString("name"));
				memberDTO.setMember_gender(rs.getString("sex"));
				memberDTO.setMember_phone(rs.getString("phone"));
				memberDTO.setMember_email(rs.getString("email"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt,rs);
		}
	
		return memberDTO;
	}
	
	public MemberDTO checkMember(String member_id){
		MemberDTO memberDTO=null;
		
		String sql="select * from willbe_member where id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				memberDTO=new MemberDTO();
				memberDTO.setMember_id(rs.getString("id"));
				memberDTO.setMember_pw(rs.getString("pass"));
				memberDTO.setMember_name(rs.getString("name"));
				memberDTO.setMember_gender(rs.getString("sex"));
				memberDTO.setMember_phone(rs.getString("phone"));
				memberDTO.setMember_email(rs.getString("email"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt,rs);
		}
		
		return memberDTO;
	}
	
	public MemberDTO confirmMember(String member_id,String member_pass){
		MemberDTO memberDTO=null;
		
		String sql="select * from willbe_member where id=? and pass=?";
		

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member_id);
			pstmt.setString(2,member_pass);
			rs=pstmt.executeQuery();
			if(rs.next()){
				memberDTO=new MemberDTO();
				memberDTO.setMember_id(rs.getString("id"));
				memberDTO.setMember_pw(rs.getString("pass"));
				memberDTO.setMember_name(rs.getString("name"));
				memberDTO.setMember_gender(rs.getString("sex"));
				memberDTO.setMember_phone(rs.getString("phone"));
				memberDTO.setMember_email(rs.getString("email"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt,rs);
		}
	
		return memberDTO;
	}
	
	public int deletemember(String id,String pass){
		int result=0;
		
		String sql="delete from willbe_member where id=? and pass=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pass);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	
	public int updateMember(MemberDTO memberDTO){
		int result=0;
		
		String sql="update willbe_member set pass=?,sex=?,phone=?,email=? where id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMember_pw());
			pstmt.setString(2, memberDTO.getMember_gender());
			pstmt.setString(3, memberDTO.getMember_phone());
			pstmt.setString(4, memberDTO.getMember_email());
			pstmt.setString(5, memberDTO.getMember_id());
			
			result=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn,pstmt);
		}
		
		return result;
	}
}
