<%-- 
    Document   : courses
    Created on : Mar 18, 2025, 10:49:35 PM
    Author     : anhducokok
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Course"%>
<%@page import="DAO.CourseDao"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Course Catalog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/courses.css"/>
    </head>
    <body>
        <%
            // Check if user is logged in
            User user = (User) session.getAttribute("user");
            if (user == null) {
                // Redirect to login page if not logged in
                response.sendRedirect("login.jsp");
            } else {
                // Load courses
                CourseDao courseDAO = new CourseDao();
                List<Course> courses = courseDAO.getAllCourses();
        %>
        <!-- Navigation Bar -->
        <nav class="navbar">
            <div class="logo">Coursera</div>
            <div class="user-menu">
                <a href="#">Explore</a>
                <a href="#">My Learning</a>
                <a href="#">Welcome, <%= user.getName()%></a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </nav>

        <!-- Hero Section -->
        <div class="hero">
            <div class="container">
                <h1>Learn Without Limits</h1>
                <p>Find courses, certificates, and degrees from world-class universities and companies.</p>
            </div>
        </div>

        <div class="container">
            <!-- Search Bar -->
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Search for courses...">
                <span class="search-icon">🔍</span>
            </div>

            <!-- Categories -->
            <div class="categories">
                <button class="category-btn active">All</button>
                <button class="category-btn">Computer Science</button>
                <button class="category-btn">Data Science</button>
                <button class="category-btn">Web Development</button>
                <button class="category-btn">Programming</button>
                <button class="category-btn">Finance</button>
                <button class="category-btn">Design</button>
            </div>

            <!-- Courses Section -->
            <h2 class="section-title">Recommended For You</h2>
            <form action="course" method="POST">
                <div class="course-grid">
                    <c:forEach var="course" items="${courseList}" >
                        <div class="course-card">
                            <a href="" style="text-decoration: none; color: black;">
                            <div class="course-image" style="background-image: url('./img/cat-1.jpg');"></div>
                            <div class="course-content">
                                <!--<div class="course-category">$course.category}</div>-->
                                <h3 class="course-title">${course.getCourseName()}</h3>
                                <div class="course-instructor">${course.getTeacherID()}</div>
                                <div class="course-details">
                                    <div class="course-rating">
                                        <span class="star">★★★★★</span>
                                        <!--$course.rating} ($(int)(Math.random() * 10000)})-->
                                    </div>
                                    <!--<div class="course-level">$course.level}</div>-->
                                </div>
                            </div>
                            </a>
                        </div>
                    </c:forEach>
                    <c:if test="${empty courseList}">
                        <p>No recommended courses available.</p>
                    </c:if>
                </div>
            </form>
            <!-- Recommended Section -->
            <h2 class="section-title">Recommended For You</h2>
            <form action="course" method="POST">
                <div class="course-grid">
                    <%
                        // Lấy danh sách khóa học từ attribute được truyền từ Servlet
                        List<Course> courseList = (List<Course>) request.getAttribute("usList");
                        if (courseList != null) {
                            for (int i = 0; i < Math.min(4, courseList.size()); i++) {
                                Course course = courseList.get(i);
                    %>
                    <div class="course-card">
                        <a href="" style="text-decoration: none;color: black;">
                        <div class="course-image" style="background-image: url('./img/cat-2.jpg');"></div>
                        <div class="course-content">
                            <!--<div class="course-category"><= course.getCategory() %></div>-->
                            <h3 class="course-title"><%= course.getCourseName()%></h3>
                            <div class="course-instructor"><%= course.getTeacherID()%></div>
                            <div class="course-details">
                                <div class="course-rating">
                                    <span class="star">★★★★★</span>
                                    <!--<= course.getRating() %> (<= (int)(Math.random() * 10000) %>)-->
                                </div>
                                <!--<div class="course-level"><= course.getLevel() %></div>-->
                            </div>
                        </div>
                        </a>
                    </div>
                    
                    <%
                        }
                    } else {
                    %>
                    <p>No recommended courses available.</p>
                    <% } %>
                </div>
            </form>

        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>Coursera</h3>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">What We Offer</a></li>
                        <li><a href="#">Leadership</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Catalog</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Community</h3>
                    <ul>
                        <li><a href="#">Learners</a></li>
                        <li><a href="#">Partners</a></li>
                        <li><a href="#">Developers</a></li>
                        <li><a href="#">Beta Testers</a></li>
                        <li><a href="#">Translators</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Connect</h3>
                    <ul>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Accessibility</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Accounts</h3>
                    <ul>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Settings</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                © 2025 Coursera Inc.
            </div>
        </footer>

        <!-- Simple JavaScript for the filter functionality -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const categoryButtons = document.querySelectorAll('.category-btn');

                categoryButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        // Remove active class from all buttons
                        categoryButtons.forEach(btn => btn.classList.remove('active'));
                        // Add active class to clicked button
                        this.classList.add('active');

                        // In a real application, this would filter the courses
                        // For now, we'll just show an alert
                        if (this.textContent !== 'All') {
                            alert('Filtering by: ' + this.textContent);
                        }
                    });
                });
            });
        </script>
        <% }%>
    </body>
</html>

