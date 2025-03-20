/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
public class LiveClass {

    private int LiveClassID;
    private int CourseID;
    private int TeacherID;
    private LocalDateTime ScheduleTime;
    private String MeetingLink;
    private String RecordedLink;
    private String Descriptions;
    private String LiveClassName;

    public LiveClass() {
    }

    public int getLiveClassID() {
        return LiveClassID;
    }

    public LiveClass(int LiveClassID, int CourseID, int TeacherID, LocalDateTime ScheduleTime, String MeetingLink, String RecordedLink, String Descriptions, String LiveClassName) {
        this.LiveClassID = LiveClassID;
        this.CourseID = CourseID;
        this.TeacherID = TeacherID;
        this.ScheduleTime = ScheduleTime;
        this.MeetingLink = MeetingLink;
        this.RecordedLink = RecordedLink;
        this.Descriptions = Descriptions;
        this.LiveClassName = LiveClassName;
    }

    public void setLiveClassID(int LiveClassID) {
        this.LiveClassID = LiveClassID;
    }

    public int getCoureseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public int getTeacherID() {
        return TeacherID;
    }

    public void setTeacherID(int TeacherID) {
        this.TeacherID = TeacherID;
    }

    public LocalDateTime getScheduleTime() {
        return ScheduleTime;
    }

    public void setScheduleTime(LocalDateTime ScheduleTime) {
        this.ScheduleTime = ScheduleTime;
    }

    public String getMeetingLink() {
        return MeetingLink;
    }

    public void setMeetingLink(String MeetingLink) {
        this.MeetingLink = MeetingLink;
    }

    public String getRecordedLink() {
        return RecordedLink;
    }

    public void setRecordedLink(String RecordedLink) {
        this.RecordedLink = RecordedLink;
    }

    public String getDescriptions() {
        return Descriptions;
    }

    public void setDescriptions(String Descriptions) {
        this.Descriptions = Descriptions;
    }

    public String getLiveClassName() {
        return LiveClassName;
    }

    public void setLiveClassName(String LiveClassName) {
        this.LiveClassName = LiveClassName;
    }

    @Override
    public String toString() {
        return "LiveClass{" + "LiveClassID=" + LiveClassID + ", CourseID=" + CourseID + ", TeacherID=" + TeacherID + ", ScheduleTime=" + ScheduleTime + ", MeetingLink=" + MeetingLink + ", RecordedLink=" + RecordedLink + ", Descriptions=" + Descriptions + ", LiveClassName=" + LiveClassName + '}';
    }
    
}
