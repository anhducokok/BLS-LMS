<%-- 
    Document   : course-d
    Created on : Mar 19, 2025, 11:09:30 PM
    Author     : anhducokok
--%>
<%@page import="model.Course"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CourseDao"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IBM Applied AI Professional Certificate | Coursera</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Source Sans Pro', 'Arial', sans-serif;
            }

            body {
                background-color: #f5f5f5;
                color: #1f1f1f;
            }
            .navbar {
                background-color: #0056D2;
                color: white;
                padding: 15px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .user-menu {
                display: flex;
                align-items: center;
            }

            .user-menu a {
                color: white;
                text-decoration: none;
                margin-left: 20px;
            }
            /* Header styles */
            .top-nav {
                background-color: #1f1f1f;
                color: white;
                padding: 10px 0;
                display: flex;
                justify-content: space-between;
            }

            .top-nav-links {
                display: flex;
                margin-left: 20px;
            }

            .top-nav-links a {
                color: white;
                text-decoration: none;
                padding: 0 20px;
                font-size: 14px;
            }

            /* Main navigation */
            .main-nav {
                background-color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .logo img {
                height: 32px;
            }

            .search-bar {
                display: flex;
                align-items: center;
                flex-grow: 1;
                max-width: 400px;
                margin: 0 20px;
            }

            .explore-button {
                background-color: white;
                border: 1px solid #0056D2;
                color: #0056D2;
                padding: 8px 16px;
                border-radius: 4px;
                margin-right: 10px;
                cursor: pointer;
                font-weight: bold;
            }

            .search-input {
                display: flex;
                flex-grow: 1;
            }

            .search-input input {
                flex-grow: 1;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-right: none;
                border-radius: 4px 0 0 4px;
            }

            .search-input button {
                background-color: #0056D2;
                color: white;
                border: none;
                padding: 8px 12px;
                border-radius: 0 4px 4px 0;
                cursor: pointer;
            }

            .search-input button i {
                font-size: 18px;
            }

            .right-nav {
                display: flex;
                align-items: center;
            }

            .right-nav a {
                color: #1f1f1f;
                text-decoration: none;
                margin: 0 10px;
                font-size: 14px;
            }

            .join-button {
                background-color: white;
                border: 1px solid #0056D2;
                color: #0056D2;
                padding: 8px 16px;
                border-radius: 4px;
                text-decoration: none;
                font-weight: bold;
            }

            /* Breadcrumb */
            .breadcrumb {
                display: flex;
                padding: 10px 20px;
                background-color: #f9f9f9;
                align-items: center;
            }

            .breadcrumb a {
                color: #1f1f1f;
                text-decoration: none;
                margin-right: 10px;
                font-size: 14px;
            }

            .breadcrumb i {
                margin-right: 10px;
                color: #555;
            }

            /* Main content */
            .main-content {
                display: flex;
                padding: 20px;
                max-width: 90%;
                margin: 0 auto;
            }

            .course-info {
                 flex: 2;
            padding-right: 40px;
            }

            .ibm-logo img {
                width: 20%;
                /*padding: 0 30px;*/
                margin-bottom: 20px;
                /*height: 350px;*/
            }

            .course-title {
                font-size: 32px;
                font-weight: bold;
                margin-bottom: 20px;
                color: #1f1f1f;
            }

            .course-description {
                margin-bottom: 20px;
                line-height: 1.5;
            }

            .language-info {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                color: #555;
            }

            .language-info span {
                margin-right: 15px;
            }

            .language-info a {
                color: #0056D2;
                text-decoration: none;
            }

            .instructors {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .instructor-images {
                display: flex;
                margin-right: 15px;
            }

            .instructor-images img {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                margin-right: -10px;
                border: 2px solid white;
            }

            .instructor-names {
                display: flex;
                align-items: center;
            }

            .instructor-names span {
                margin-right: 10px;
            }

            .instructor-names a {
                color: #0056D2;
                text-decoration: none;
            }

            .enroll-button {
                background-color: #0056D2;
                color: white;
                padding: 15px 30px;
                border-radius: 4px;
                border: none;
                font-weight: bold;
                font-size: 16px;
                cursor: pointer;
                margin-bottom: 10px;
                width: 100%;
            }

            .enroll-info {
                font-size: 12px;
                text-align: center;
                color: #555;
                margin-bottom: 20px;
            }

            .financial-aid {
                text-align: center;
            }

            .financial-aid a {
                color: #0056D2;
                text-decoration: none;
                font-size: 14px;
            }

            /* Course card */
            .course-card {
                flex: 1;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                padding: 20px;
            }

            .card-title {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 15px;
            }

            .card-subtitle {
                font-size: 14px;
                color: #555;
                margin-bottom: 20px;
            }

            .rating {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .rating-number {
                font-size: 18px;
                font-weight: bold;
                margin-right: 10px;
            }

            .rating-stars {
                color: #f9c642;
                margin-right: 10px;
            }

            .rating-count {
                color: #555;
                font-size: 14px;
            }

            .level-info, .duration-info, .schedule-info {
                margin-bottom: 20px;
            }

            .level-title, .duration-title, .schedule-title {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .level-subtitle, .duration-subtitle, .schedule-subtitle {
                font-size: 14px;
                color: #555;
            }

            .view-all {
                text-align: center;
                margin-top: 20px;
            }

            .view-all a {
                color: #0056D2;
                text-decoration: none;
            }

            /* Tab navigation */
            .tabs {
                display: flex;
                border-bottom: 1px solid #ddd;
                margin-top: 40px;
                padding: 0 20px;
            }

            .tabs a {
                padding: 15px 20px;
                color: #1f1f1f;
                text-decoration: none;
                font-weight: bold;
                margin-right: 20px;
            }

            .tabs a.active {
                color: #0056D2;
                border-bottom: 2px solid #0056D2;
            }
             .course-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
        }
        
        .course-header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 30px;
        }
        
        .course-title {
            font-size: 32px;
            color: #333;
            margin-bottom: 15px;
        }
        
        .rating-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .stars {
            color: #f9c642;
            margin-right: 10px;
        }
        
        .rating-score {
            font-weight: bold;
            font-size: 18px;
            color: #f9c642;
            margin-right: 10px;
        }
        
        .rating-details {
            color: #666;
            font-size: 14px;
        }
        
        .course-actions {
            display: flex;
            margin-bottom: 20px;
        }
        
        .primary-button {
            background-color: #0056D2;
            color: white;
            padding: 12px 25px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            margin-right: 15px;
            border: none;
            cursor: pointer;
        }
        
        .save-button {
            background-color: transparent;
            border: 1px solid #ccc;
            padding: 12px 20px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        
        .save-button i {
            margin-right: 8px;
        }
        
        .sponsor-info {
            font-size: 14px;
            color: #666;
            margin-bottom: 30px;
        }
        
        .university-logo {
            max-width: 120px;
        }
        
        .about-section {
            width: 100%;
            margin-bottom: 40px;
        }
        
        .about-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        
        .about-description {
            line-height: 1.6;
            margin-bottom: 30px;
            color: #333;
        }
        
        .course-objectives {
            margin-bottom: 30px;
        }
        
        .objectives-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }
        
        .objectives-list {
            list-style-type: disc;
            padding-left: 20px;
            line-height: 1.8;
            color: #333;
        }
        
        .skills-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 4px;
            margin-bottom: 30px;
            border: 1px solid #eee;
        }
        
        .skills-title {
            font-size: 16px;
            color: #666;
            text-transform: uppercase;
            margin-bottom: 15px;
            letter-spacing: 0.5px;
        }
        
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .skill-tag {
            background-color: #ebebeb;
            color: #333;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 14px;
        }
        
        .features-section {
            width: 30%;
            margin-left: auto;
        }
        
        .feature-card {
            display: flex;
            align-items: flex-start;
            margin-bottom: 30px;
        }
        
        .feature-icon {
            background-color: #f5f5f5;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #666;
        }
        
        .feature-content {
            flex: 1;
        }
        
        .feature-title {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }
        
        .feature-description {
            font-size: 14px;
            color: #666;
            line-height: 1.4;
        }
        
        .main-content {
            display: flex;
            width: 100%;
        }
        
        .content-main {
            width: 65%;
            padding-right: 30px;
        }
        
            /* Responsive */
            @media (max-width: 768px) {
                .main-content {
                    flex-direction: column;
                }

                .course-info {
                    padding-right: 0;
                    margin-bottom: 20px;
                }

                .language-info, .instructors {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .instructor-images {
                    margin-bottom: 10px;
                }
                 .course-header {
                flex-direction: column;
            }
            
            .main-content {
                flex-direction: column;
            }
            
            .content-main {
                width: 100%;
                padding-right: 0;
            }
            
            .features-section {
                width: 100%;
                margin-top: 30px;
            }
        
            }
        </style>
    </head>
    <body>
        <!-- Top navigation -->

        <!-- Navigation Bar -->
        <nav class="navbar">
            <div class="logo">Coursera</div>
            <div class="user-menu">
                <a href="#">Explore</a>
                <a href="#">My Learning</a>

                <a href="LogoutServlet">Logout</a>
            </div>
        </nav>

        <!-- Breadcrumb -->
      

        <!-- Main content -->
        <div class="main-content">
            <div class="course-info">
                <div class="ibm-logo">
                    <img src="./img/cat-1.jpg" alt="IBM">
                </div>
                <div>
                    <h1 class="course-title">IBM Applied AI Professional Certificate</h1>

                    <p class="course-description">
                        Kickstart your career in artificial intelligence. Learn Python, build a chatbot, explore machine learning and computer vision, and leverage IBM Watson.
                    </p>

                    <div class="language-info">
                        <span>Taught in English</span>
                        <a href="#">8 languages available</a>
                        <span>Some content may not be translated</span>
                    </div>

                    <div class="instructors">
                        <!--                <div class="instructor-images">
                                            <img src="" alt="Instructor 1">
                                            <img src="https://via.placeholder.com/32" alt="Instructor 2">
                                            <img src="https://via.placeholder.com/32" alt="Instructor 3">
                                        </div>-->
                        <div class="instructor-names">
                            <span>Instructors:</span>
                            <a href="#">Abhishek Gagnejа</a>
                            <span>+5 more</span>
                        </div>
                    </div>

                    <button class="enroll-button">Enroll for Free</button>
                    <p class="enroll-info">Starts Nov 21</p>

                    <div class="financial-aid">
                        <a href="#">Financial aid available</a>
                    </div>
                </div>
            </div>

            <div class="course-card">
                <h2 class="card-title">Professional Certificate - 7 course series</h2>
                <p class="card-subtitle">Earn a career credential that demonstrates your expertise</p>

                <div class="rating">
                    <span class="rating-number">4.6</span>
                    <span class="rating-stars">★★★★★</span>
                    <span class="rating-count">(6,272 reviews)</span>
                </div>

                <div class="level-info">
                    <h3 class="level-title">Beginner level</h3>
                    <p class="level-subtitle">No previous experience necessary</p>
                </div>

                <div class="duration-info">
                    <h3 class="duration-title">3 months at 10 hours a week</h3>
                </div>

                <div class="schedule-info">
                    <h3 class="schedule-title">Flexible schedule</h3>
                    <p class="schedule-subtitle">Learn at your own pace</p>
                </div>

                <div class="view-all">
                    <a href="#">View all courses</a>
                </div>
            </div>
        </div>

        <!-- Tab navigation -->
        <div class="tabs">
            <a href="#" class="active">About</a>
            <a href="#">Outcomes</a>
            <a href="#">Courses</a>
            <a href="#">Testimonials</a>
        </div>
       
        <div class="main-content">
            <div class="content-main">
                <div class="about-section">
                    <h2 class="about-title">About this Course</h2>
                    <p class="about-description">
                        You will gain a foundation for college-level writing valuable for nearly any field. Students will learn
                        how to read carefully, write effective arguments, understand the writing process, engage with
                        others' ideas, cite accurately, and craft powerful prose.
                    </p>
                    
                    <div class="course-objectives">
                        <h3 class="objectives-title">Course Learning Objectives</h3>
                        <ul class="objectives-list">
                            <li>Summarize, analyze, question, and evaluate written and visual texts</li>
                            <li>Argue and support a position</li>
                            <li>Recognize audience and disciplinary expectations</li>
                            <li>Identify and use the stages of the writing process</li>
                            <li>Identify characteristics of effective prose</li>
                            <li>Apply proper citation practices</li>
                            <li>Discuss applying your writing knowledge to other writing occasions</li>
                        </ul>
                    </div>
                    
                    <div class="skills-section">
                        <h3 class="skills-title">Skills you will gain</h3>
                        <div class="skills-container">
                            <span class="skill-tag">Essay Writing</span>
                            <span class="skill-tag">English Language</span>
                            <span class="skill-tag">Academic Writing</span>
                            <span class="skill-tag">Editing</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="features-section">
                <div class="feature-card">
                    <div class="feature-icon">🌐</div>
                    <div class="feature-content">
                        <h3 class="feature-title">100% online</h3>
                        <p class="feature-description">Start instantly and learn at your own schedule.</p>
                    </div>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">📅</div>
                    <div class="feature-content">
                        <h3 class="feature-title">Flexible deadlines</h3>
                        <p class="feature-description">Reset deadlines in accordance to your schedule.</p>
                    </div>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon"></div>
                    <div class="feature-content">
                        <h3 class="feature-title">Beginner Level</h3>
                    </div>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">💬</div>
                    <div class="feature-content">
                        <h3 class="feature-title">English</h3>
                        <p class="feature-description">Subtitles: English, Spanish, French</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>