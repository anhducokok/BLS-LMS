/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author anhducokok
 */
public class UserDAO extends DBContext {

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM [User]";

        try (
                PreparedStatement pstmt = connection.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
//                user.setUserID(rs.getInt("UserID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                userList.add(user);
//                System.out.println(user.getEmail());
            }
        } catch (SQLException e) {
            System.out.println("User: " + e.getMessage());
        }
        return userList;
    }

    public User getTeacherID(int id) {
        String sql = "SELECT * FROM [User] where Role = ? and UserID = ?";
//PreparedStatement pstmt = connection.prepareStatement(sql);
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            
        
            pstmt.setString(1, "Teacher");
            pstmt.setInt(2, id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();
//                user.setUserID(rs.getInt("UserID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                return user;
//                System.out.println(user.getEmail());
            }
        } catch (SQLException e) {
            System.out.println("User: " + e.getMessage());
        }

        return null;
    }

    public static void main(String[] args) {
        UserDAO u = new UserDAO();
        List<User> userList = u.getAllUsers();
        for (User li : userList) {
            System.out.println(li.getName());
        }
        User li  = u.getTeacherID(1);
        System.out.println(li.getName());
    }
}
