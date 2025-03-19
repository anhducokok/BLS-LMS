/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author anhducokok
 */
public class User {
    private int userID;
    private String name;
    private String email;
    private String password;
    private String role;

    // Constructors
    public User() {}

    public User(int userID, String name, String email, String password, String role) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    public User(String name,String email, String password){
        this.name = name;
        this.email = email;
        this.password = password;
    }
    // Getters and Setters
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", name=" + name + ", email=" + email + ", password=" + password + ", role=" + role + '}';
    }
    public boolean validate() {
        // For demonstration purposes, we're using hardcoded credentials
        // In a real application, this would check against a database
        return "Jane Smith".equals(name) && "password456".equals(password);
    }
}
