package com.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnDB {
	private Connection ct = null;
	public Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ct = DriverManager.getConnection("jdbc:mysql://localhost:8889/blog", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ct;
	}
}
