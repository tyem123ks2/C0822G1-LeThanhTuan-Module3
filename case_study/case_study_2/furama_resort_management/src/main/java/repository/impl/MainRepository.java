package repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MainRepository {
    private static final String URL = "jdbc:mysql://localhost:3306/furama_resort_management";
    private static final String USER ="root";
    private static final String PASS ="Lalisaismine98";// MK SQL của Tuấn
    public static Connection getConnectDB() {
    Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL,USER,PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
