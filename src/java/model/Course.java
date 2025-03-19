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
    private String img;
    private int categoryID;
    private String name;

    // Constructors
    public Course() {}

    public Course(int courseID, String courseName, String description, int teacherID) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.teacherID = teacherID;
    }

    public Course(int courseID, String courseName, String description, int teacherID, String img, int categoryID, String name) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.teacherID = teacherID;
        this.img = img;
        this.categoryID = categoryID;
        this.name = name;
    }
    
    public Course(String courseName, String description, int teacherID) {
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
      public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
