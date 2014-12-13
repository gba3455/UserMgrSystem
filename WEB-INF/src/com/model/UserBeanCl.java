package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserBeanCl {
	private Statement st = null;
	private ResultSet rs = null;
	private Connection ct = null;
	
	private int pageSize = 3;
	private int rowCount = 0;
	private int pageCount = 0;

	public boolean checkUser(String name, String password){
		boolean b = false;
		try{
			ConnDB cdb = new ConnDB();
			ct = cdb.getConn();
			st = ct.createStatement();
			rs = st.executeQuery("select pass from blog.users where account ='" + name + "'");
			if(rs.next()){
				String pass = rs.getString(1);
				if(pass.equals(password)){
					b = true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
				close();
		}
		return b;
	}
	
	public ArrayList<UserBean> getUsersByPage(int pageNow){
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		try {
			ConnDB cdb = new ConnDB();
			ct = cdb.getConn();
			st = ct.createStatement();
			
			rs = st.executeQuery("select * from blog.userstest where id not in (select t.id from (select * from blog.userstest limit " + pageSize * (pageNow - 1) + ")as t) limit " + pageSize + "");
			while(rs.next()){
				UserBean ub = new UserBean();
				ub.setUserId(rs.getInt(1));
				ub.setAccount(rs.getString(2));
				ub.setPass(rs.getString(3));
				ub.setName(rs.getString(4));
				al.add(ub);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return al;
	}
	
	public int getPageCount(){
		try {
			ConnDB cdb = new ConnDB();
			ct = cdb.getConn();
			st = ct.createStatement();
			rs = st.executeQuery("select COUNT(*) from blog.userstest");
			if(rs.next()){
				rowCount = rs.getInt(1);
			}
			
			if(rowCount%pageSize == 0){
				pageCount = rowCount/pageSize;
			}else{
				pageCount = rowCount/pageSize + 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		return pageCount;
	}
	
	public void close() {
		try {
			if(st != null){
				st.close();
				st = null;
			}
			if(rs != null){
				rs.close();
				rs = null;
			}
			if(ct != null){
				ct.close();
				ct = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
