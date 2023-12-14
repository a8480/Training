package com.icss.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DNUtil {
    public static Connection getConnection() {
        Properties properties=new Properties();
        try {
            properties.load(new FileInputStream("StudyNotes/demo1213/src/main/resources/db.properties"));
            Class.forName(properties.getProperty("className"));
            String url=properties.getProperty("url");
            String username=properties.getProperty("username");
            String password=properties.getProperty("password");
            Connection connection=java.sql.DriverManager.getConnection(url,username,password);
           return connection;
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
