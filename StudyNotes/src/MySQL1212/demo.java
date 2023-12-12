package MySQL1212;

import java.sql.*;

public class demo {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("数据库驱动加载成功");
        String url = "jdbc:mysql://localhost:3306/MySQL1212";
        String username = "root";
        String password = "root";
        Connection conn = DriverManager.getConnection(url, username, password);
        System.out.println("数据库连接成功");
        System.out.println(conn);
        // 获取数据库连接对象
        Statement stmt = conn.createStatement();
        // 定义sql语句
        String sql= "selece * from employees";
        ResultSet resultSet = stmt.executeQuery(sql);

    }
}
