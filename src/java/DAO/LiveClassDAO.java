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
import model.LiveClass;
import model.User;

/**
 *
 * @author ADMIN
 */
public class LiveClassDAO extends DBContext {
//    public List<LiveClass> getAllLiveClass() {
//        List<LiveClass> liveList = new ArrayList<>();
//        String sql = "SELECT * FROM [User]\n" 
//                   + "WHERE RecordedLink IS NULL";
//
//        try (
//             PreparedStatement pstmt = connection.prepareStatement(sql);
//             ResultSet rs = pstmt.executeQuery()) {
//
//            while (rs.next()) {
//                LiveClass liveclass = new LiveClass();
////                user.setUserID(rs.getInt("UserID"));
//                liveclass.setLiveClassID(rs.getInt("LiveClassID"));
//                liveclass.setCourseID(rs.getInt("CourseID"));
//                liveclass.setTeacherID(rs.getInt("TeacherID"));
//                liveclass.setScheduleTime(rs.getTimestamp("ScheduleTime").toLocalDateTime());
//                liveclass.setMeetingLink(rs.getString("MeetingLink"));
//                liveList.add(liveclass);
////                System.out.println(user.getEmail());
//            }
//        } catch (SQLException e) {
//           System.out.println("LiveClass: " + e.getMessage());
//        }
//        return liveList;
//    }

//    public List<LiveClass> getAllLiveClassAndRecorded() {
//        List<LiveClass> liveList = new ArrayList<>();
//        String sql = "SELECT * FROM [LiveClass]";
//
//        try (
//                PreparedStatement pstmt = connection.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
//
//            while (rs.next()) {
//                LiveClass liveclass = new LiveClass();
////                user.setUserID(rs.getInt("UserID"));
//                liveclass.setLiveClassID(rs.getInt("LiveClassID"));
//                liveclass.setCourseID(rs.getInt("CourseID"));
//                liveclass.setTeacherID(rs.getInt("TeacherID"));
//                liveclass.setScheduleTime(rs.getTimestamp("ScheduleTime").toLocalDateTime());
//                liveclass.setMeetingLink(rs.getString("MeetingLink"));
//                liveclass.setRecordedLink(rs.getString("RecordedLink"));
//                liveclass.setDescriptions(rs.getString("Descriptions"));
//                liveclass.setLiveClassName(rs.getString("LiveClassName"));
//                liveList.add(liveclass);
////                System.out.println(user.getEmail());
//            }
//        } catch (SQLException e) {
//            System.out.println("LiveClass: " + e.getMessage());
//        }
//        return liveList;
//    }

    public List<LiveClass> getAllLiveClassAndRecorded() {
        List<LiveClass> liveList = new ArrayList<>();
        String sql = "SELECT * FROM [LiveClass]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                liveList.add(new LiveClass(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getTimestamp(4).toLocalDateTime(),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException ex) {
            //System.out.println("no");
            ex.printStackTrace();
        }
        
        return liveList;
    }

    public static void main(String[] args) {
        LiveClassDAO u = new LiveClassDAO();
        List<LiveClass> userList = u.getAllLiveClassAndRecorded();
        for (LiveClass li : userList) {
            System.out.println(li);
        }
    }
}
