/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author anhducokok
 */
public class DBContext {
    public Connection connection;

    public DBContext() {
        try {
            String username = "sa";
            String password = "123iloveanime";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=LearningPlatform1";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Database connection successful!");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Database connection failed: " + ex);
        }
    }
    
    public Connection getConnection(){
        return connection;
    }

    public static void main(String[] args) {
        new DBContext(); // Create an instance of DBcontext to test the database connection.
    }
}
