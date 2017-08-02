package com.willbe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.willbe.dto.WalletDTO;

import util.DBManager;

public class WalletDAO {
	private WalletDAO(){
	}
	
	private static WalletDAO instance=new WalletDAO();
	
	public static WalletDAO getInstance(){
		return instance;
	}
	
	public void insertWalletin(WalletDTO walletDTO){
	
		
		String sql="insert into willbe_wallet(id,inouttype,year,month,day,moneyinout,content,moneysum) values(?,?,?,?,?,?,?,?)";
		//                          String sql="insert into willbe_diary(id,year,month,day,content) values(?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, walletDTO.getWallet_id());
			pstmt.setString(2, walletDTO.getWallet_value());
			pstmt.setString(3, walletDTO.getWallet_year());
			pstmt.setString(4, walletDTO.getWallet_month());
			pstmt.setString(5, walletDTO.getWallet_day());
			pstmt.setString(6, walletDTO.getWallet_inout());
			pstmt.setString(7, walletDTO.getWallet_content());
			pstmt.setString(8, walletDTO.getWallet_sum());
			
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt);
		}
		
	}
	
	public ArrayList<WalletDTO> selectWallet(String id,String year,String month){
		ArrayList<WalletDTO> walletlist=new ArrayList<WalletDTO>();
		
		String sql="select * from willbe_wallet where id=? and year=? and month=? order by no";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, year);
			pstmt.setString(3, month);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				WalletDTO walletDTO=new WalletDTO();
				walletDTO.setWallet_id(rs.getString("id"));
				walletDTO.setWallet_value(rs.getString("inouttype"));
				walletDTO.setWallet_year(rs.getString("year"));
				walletDTO.setWallet_month(rs.getString("month"));
				walletDTO.setWallet_day(rs.getString("day"));
				walletDTO.setWallet_inout(rs.getString("moneyinout"));
				walletDTO.setWallet_content(rs.getString("content"));
				walletDTO.setWallet_sum(rs.getString("moneysum"));
				walletlist.add(walletDTO);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt,rs);
		}
		
		return walletlist;
	}
	
	public ArrayList<WalletDTO> selectWallet(String id){
		ArrayList<WalletDTO> walletlist=new ArrayList<WalletDTO>();
		
		String sql="select * from willbe_wallet where id=? order by no";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				WalletDTO walletDTO=new WalletDTO();
				walletDTO.setWallet_id(rs.getString("id"));
				walletDTO.setWallet_value(rs.getString("inouttype"));
				walletDTO.setWallet_year(rs.getString("year"));
				walletDTO.setWallet_month(rs.getString("month"));
				walletDTO.setWallet_day(rs.getString("day"));
				walletDTO.setWallet_inout(rs.getString("moneyinout"));
				walletDTO.setWallet_content(rs.getString("content"));
				walletDTO.setWallet_sum(rs.getString("moneysum"));
				walletlist.add(walletDTO);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.close(conn, pstmt,rs);
		}
		
		return walletlist;
	}
	
	public int deletewallet(String id){
		int result=0;
		
		String sql="delete from willbe_wallet where id=?";
		
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
