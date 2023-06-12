package com.tech.blog.helper;

import java.sql.*;

public class ConectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                // Driver Class load
                Class.forName("com.mysql.jdbc.Driver");

//            Create a connection....
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "chandresh27");
                
            }

        } catch (Exception e) {
            // This is throw me error just look at it....
            e.printStackTrace();

        }

        return con;
    }
}

