package com.dau;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connecter {
public static Connection connect() throws SQLException, ClassNotFoundException {
	Class.forName("com.mysql.cj.jdbc.Driver");
	return DriverManager.getConnection("jdbc:mysql://localhost:3306/delta","root","12345");
}
}
