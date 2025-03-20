/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author anhducokok
 */
public class Course {
    private int courseID;
    private String courseName;
    private String description;
    private int teacherID;

    // Constructors
    public Course() {}

    public Course(int courseID, String courseName, String description, int teacherID) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.teacherID = teacherID;
    }

    // Getters and Setters
    public int getCourseID() { return courseID; }
    public void setCourseID(int courseID) { this.courseID = courseID; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getTeacherID() { return teacherID; }
    public void setTeacherID(int teacherID) { this.teacherID = teacherID; }
}
