/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import model.Course;

/**
 *
 * @author anhducokok
 */
public class CourseDao extends DBContext{
    public List<Course> getAllCourses() {
        List<Course> courseList = new ArrayList<>();
        
        String sql = "SELECT * FROM [Course]";

        try (
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setCourseName(rs.getString("CourseName"));
                course.setDescription(rs.getString("Description"));
                course.setTeacherID(rs.getInt("TeacherID"));
                courseList.add(course);
                
            }
        }catch (SQLException e){
            System.out.println("CourseDao: " + e.getMessage());
        }
        
        return courseList;
    }
        public List<Course> getAll() {
        List<Course> courseList = new ArrayList<>();
        
        String sql = "SELECT * FROM [Course]";
        
        try (
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setCourseName(rs.getString("CourseName"));
                course.setDescription(rs.getString("Description"));
                course.setTeacherID(rs.getInt("TeacherID"));
                courseList.add(course);
                
            }
        }catch (SQLException e){
            System.out.println("CourseDao: " + e.getMessage());
        }
        
        return courseList;
    }
    
    public List<Course> getCourseById(int id) {
        List<Course> courseList = new ArrayList<>();
        for (Course course : getAllCourses()) {
            if (course.getCourseID()== id) {
               courseList.add(course);
            }
        }
        return courseList;
    }
    
//    public List<Course> getCoursesByCategory(String category) {
//        List<Course> filteredCourses = new ArrayList<>();
//        for (Course course : getAllCourses()) {
//            if (course.getCategory().equalsIgnoreCase(category)) {
//                filteredCourses.add(course);
//            }
//        }
//        return filteredCourses;
//    }
    public static void main(String[] args) {
         CourseDao u = new CourseDao();
       List<Course> userList = u.getCourseById(1);
        for (Course li : userList) {
            System.out.println(li.getCourseName());
        }
    }
}
