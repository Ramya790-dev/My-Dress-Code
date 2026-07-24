package com.fashionstore.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/fashion_store";

    private static final String USERNAME =
            "root";

    private static final String PASSWORD =
            "Ramya@790";

    private static Connection connection;

    public static Connection getConnection() {

        try {

            if(connection == null ||
               connection.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                connection =
                        DriverManager.getConnection(
                                URL,
                                USERNAME,
                                PASSWORD
                        );
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return connection;
    }
}