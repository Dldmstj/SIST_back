package backWeb.a01_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class A01_DB {
	
	public static void setConn() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("db 연동 실패");
			System.out.println(e.getMessage());
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("접속 성공!");
	}
	public static void main(String[] args) {
		try {
			setConn();
		} catch (SQLException e) {
			System.out.println("접속실패: " + e.getMessage());
		}
	}
}
