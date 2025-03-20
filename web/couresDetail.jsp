<%-- 
    Document   : couresDetail
    Created on : Mar 18, 2025, 7:33:46 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Details - Learning Platform</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <!-- Bootstrap JavaScript Bundle (Includes Popper.js) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            :root {
                --primary-color: #3a7bd5;
                --secondary-color: #6d5dfc;
                --light-bg: #f8f9fa;
                --dark-text: #343a40;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: var(--dark-text);
                background-color: #f5f7fa;
            }

            .course-header {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                color: white;
                padding: 3rem 0;
                position: relative;
                overflow: hidden;
            }

            .course-header::after {
                content: "";
                position: absolute;
                bottom: 0;
                right: 0;
                width: 100%;
                height: 30%;
                background: linear-gradient(135deg, transparent 50%, rgba(255,255,255,0.1) 100%);
            }

            .instructor-avatar {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid white;
            }

            .course-sidebar {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                position: sticky;
                top: 20px;
            }

            .module-card {
                border-left: 4px solid var(--primary-color);
                background-color: white;
                transition: all 0.3s ease;
            }

            .module-card:hover {
                transform: translateX(5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .lesson-link {
                color: var(--dark-text);
                text-decoration: none;
                padding: 10px 15px;
                display: block;
                border-bottom: 1px solid #eee;
                transition: all 0.2s ease;
            }

            .lesson-link:hover {
                background-color: var(--light-bg);
                color: var(--primary-color);
            }

            .lesson-link i {
                color: var(--primary-color);
                margin-right: 10px;
            }

            .progress-bar {
                background-color: var(--primary-color);
            }

            .enroll-button {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                border: none;
                padding: 12px 25px;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .enroll-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(58, 123, 213, 0.4);
            }

            .badge-custom {
                background-color: rgba(58, 123, 213, 0.1);
                color: var(--primary-color);
                font-weight: 500;
            }

            .tab-content {
                background-color: white;
                border-radius: 0 0 10px 10px;
                padding: 25px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            }

            .nav-tabs .nav-link {
                border: none;
                color: var(--dark-text);
                font-weight: 500;
                padding: 15px 25px;
            }

            .nav-tabs .nav-link.active {
                color: var(--primary-color);
                border-bottom: 3px solid var(--primary-color);
                background-color: transparent;
            }

            .assignment-card {
                border-left: 4px solid #ffc107;
            }

            .live-session-card {
                border-left: 4px solid #28a745;
            }

            .announcement-card {
                border-left: 4px solid #dc3545;
            }

            .resource-card {
                border-left: 4px solid #6610f2;
            }

            .resource-icon {
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: rgba(102, 16, 242, 0.1);
                color: #6610f2;
                border-radius: 8px;
                font-size: 20px;
            }

            .live-class-badge {
                position: absolute;
                top: 10px;
                right: 10px;
            }

            .live-class-item {
                transition: all 0.3s ease;
            }

            .live-class-item:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .popup-video {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.8);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .popup-video video {
                max-width: 90%;
                max-height: 80%;
                border-radius: 4px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            }

            .popup-video .close {
                position: absolute;
                top: 20px;
                right: 30px;
                color: white;
                font-size: 40px;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s ease;
            }

            .popup-video .close:hover {
                color: #f8f9fa;
                transform: scale(1.1);
            }
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="fas fa-graduation-cap me-2"></i>
                    Learning Platform
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Courses</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Discussions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Calendar</a>
                        </li>
                    </ul>
                    <div class="d-flex align-items-center">
                        <div class="dropdown me-3">
                            <a class="text-white position-relative" href="#" role="button" id="notificationDropdown" data-bs-toggle="dropdown">
                                <i class="fas fa-bell fs-5"></i>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><h6 class="dropdown-header">Notifications</h6></li>
                                <li><a class="dropdown-item" href="#">New assignment posted</a></li>
                                <li><a class="dropdown-item" href="#">Upcoming live session</a></li>
                                <li><a class="dropdown-item" href="#">Your submission was graded</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <a class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" href="#" id="userDropdown" data-bs-toggle="dropdown">
                                <img src="/api/placeholder/40/40" alt="User Profile" class="rounded-circle me-2" width="32" height="32">
                                <span>John Doe</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="#">Profile</a></li>
                                <li><a class="dropdown-item" href="#">My Courses</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Course Header -->
        <header class="course-header">
            <div class="container py-4">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-3">
                                <li class="breadcrumb-item"><a href="#" class="text-white opacity-75">Courses</a></li>
                                <li class="breadcrumb-item"><a href="#" class="text-white opacity-75">Computer Science</a></li>
                                <li class="breadcrumb-item active text-white" aria-current="page">Database Design & Management</li>
                            </ol>
                        </nav>
                        <h1 class="display-4 fw-bold mb-3">Database Design & Management</h1>
                        <p class="lead mb-4">Learn how to design efficient databases, write complex SQL queries, and manage database systems in this comprehensive course.</p>
                        <div class="d-flex align-items-center mb-3">
                            <img src="/api/placeholder/60/60" alt="Instructor" class="instructor-avatar me-3">
                            <div>
                                <p class="m-0 text-white fw-bold">Dr. Jane Smith</p>
                                <p class="m-0 text-white opacity-75">Database Systems Expert</p>
                            </div>
                        </div>
                        <div class="d-flex flex-wrap gap-3">
                            <span class="badge bg-light text-dark px-3 py-2"><i class="fas fa-users me-2"></i>1,245 Students</span>
                            <span class="badge bg-light text-dark px-3 py-2"><i class="fas fa-star me-2 text-warning"></i>4.8 (356 Reviews)</span>
                            <span class="badge bg-light text-dark px-3 py-2"><i class="fas fa-clock me-2"></i>12 Weeks</span>
                            <span class="badge bg-light text-dark px-3 py-2"><i class="fas fa-signal me-2"></i>Intermediate</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <section class="py-5">
            <div class="container">
                <div class="row g-4">
                    <!-- Course Content -->
                    <div class="col-lg-8">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" id="courseTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="overview-tab" data-bs-toggle="tab" data-bs-target="#overview" type="button" role="tab">Overview</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="liveClasses-tab" data-bs-toggle="tab" data-bs-target="#liveClasses" type="button" role="tab">Live Classes</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="resources-tab" data-bs-toggle="tab" data-bs-target="#resources" type="button" role="tab">Resources</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="assignments-tab" data-bs-toggle="tab" data-bs-target="#assignments" type="button" role="tab">Assignments</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="discussions-tab" data-bs-toggle="tab" data-bs-target="#discussions" type="button" role="tab">Discussions</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="courseTabContent">
                            <!-- Overview Tab -->
                            <div class="tab-pane fade show active" id="overview" role="tabpanel">
                                <h3 class="mb-4">About This Course</h3>
                                <p>This comprehensive course will teach you how to design, implement, and manage relational databases. You'll learn fundamental database concepts, advanced SQL, normalization techniques, and database optimization. By the end of this course, you'll be able to design efficient database schemas and write complex queries to solve real-world problems.</p>

                                <h4 class="mt-4 mb-3">What You'll Learn</h4>
                                <div class="row g-3 mb-4">
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-check-circle text-success me-3 fs-5"></i>
                                            <span>Database design principles and best practices</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-check-circle text-success me-3 fs-5"></i>
                                            <span>Advanced SQL querying techniques</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-check-circle text-success me-3 fs-5"></i>
                                            <span>Normalization and denormalization</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-check-circle text-success me-3 fs-5"></i>
                                            <span>Database indexing and optimization</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-check-circle text-success me-3 fs-5"></i>
                                            <span>Transaction management and concurrency</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-check-circle text-success me-3 fs-5"></i>
                                            <span>Database security and access control</span>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="mb-3">Prerequisites</h4>
                                <p>Basic understanding of programming concepts and data structures. No prior database experience required, though it would be helpful.</p>

                                <div class="mt-4">
                                    <h4 class="mb-3">Next Live Session</h4>
                                    <div class="card mb-3 live-session-card">
                                        <div class="card-body">
                                            <h5 class="card-title">Advanced Query Optimization</h5>
                                            <p class="card-text mb-2"><i class="far fa-calendar-alt me-2"></i> March 20, 2025</p>
                                            <p class="card-text mb-3"><i class="far fa-clock me-2"></i> 2:00 PM - 3:30 PM EST</p>
                                            <div class="progress mb-3" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 40%"></div>
                                            </div>
                                            <div class="d-flex justify-content-between small mb-3">
                                                <span>Module 4 of 10</span>
                                                <span>40% Complete</span>
                                            </div>
                                            <a href="#" class="btn btn-outline-success btn-sm">Add to Calendar</a>
                                            <a href="#" class="btn btn-success btn-sm ms-2">Join Session</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <h4 class="mb-3">Recent Announcements</h4>
                                    <div class="card mb-3 announcement-card">
                                        <div class="card-body">
                                            <h5 class="card-title">Final Project Guidelines Published</h5>
                                            <p class="card-text text-muted mb-2"><i class="far fa-calendar-alt me-2"></i> Posted on March 15, 2025</p>
                                            <p class="card-text">The guidelines for the final project have been published. Please review them and start planning your database design project. Office hours will be extended next week to help with any questions.</p>
                                            <a href="#" class="btn btn-link p-0">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Live Classes Tab -->
                            <div class="tab-pane fade" id="liveClasses" role="tabpanel">
                                <h3 class="mb-4">Live Classes Schedule</h3>

                                <div class="mb-4">
                                    <div class="alert alert-info d-flex align-items-center" role="alert">
                                        <i class="fas fa-info-circle me-2"></i>
                                        <div>All live classes are recorded and will be available 24 hours after the session ends.</div>
                                    </div>
                                </div>

                                <!-- Upcoming Classes -->
                                <h4 class="mb-3">Upcoming Classes</h4>
                                <div class="row g-3 mb-4">

                                    <c:forEach items = "${lclass}" var="l">
                                        <c:if test="${empty l.recordedLink}">
                                            <div class="col-md-6">
                                                <div class="card live-class-item position-relative h-100">
                                                    <span class="badge bg-danger live-class-badge">Upcoming</span>
                                                    <div class="card-body">
                                                        <h5 class="card-title">${l.getLiveClassName()}</h5>
                                                        <p class="text-muted mb-2"><i class="far fa-calendar-alt me-2"></i>${l.getScheduleTime()}</p>
                                                        <p class="card-text">${l.getDescriptions()}</p>
                                                        <div class="mt-3">
                                                            <a href="#" class="btn btn-outline-primary btn-sm">Add to Calendar</a>
                                                            <a href="${l.getMeetingLink()}" class="btn btn-primary btn-sm ms-2">Join</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                    <!-- Live Class 2 -->
                                    <div class="col-md-6">
                                        <div class="card live-class-item position-relative h-100">
                                            <span class="badge bg-danger live-class-badge">Upcoming</span>
                                            <div class="card-body">
                                                <h5 class="card-title">Database Sharding & Partitioning</h5>
                                                <p class="text-muted mb-2"><i class="far fa-calendar-alt me-2"></i> March 27, 2025</p>
                                                <p class="card-text">Understanding horizontal and vertical partitioning strategies for large databases and implementing sharding for scalability.</p>
                                                <div class="mt-3">
                                                    <a href="#" class="btn btn-outline-primary btn-sm">Add to Calendar</a>
                                                    <a href="#" class="btn btn-primary btn-sm ms-2">Join</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Previous Classes -->
                                <h4 class="mb-3 mt-4">Previous Classes</h4>
                                <div class="row g-3" id="recorded">
                                    <!-- Previous Class 1 -->
                                    <c:forEach items = "${lclass}" var="l">
                                        <c:if test="${not empty l.recordedLink}">
                                            <div class="col-md-6">
                                                <div class="card live-class-item h-100">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${l.getLiveClassName()}</h5>
                                                        <p class="text-muted mb-2"><i class="far fa-calendar-alt me-2"></i>${l.getScheduleTime()}</p>
                                                        <p class="card-text mb-3">${l.getDescriptions()}</p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <a href="#" class="btn btn-outline-secondary btn-sm" data-video="${l.getRecordedLink()}"><i class="fas fa-play-circle me-1"></i> Watch Recording</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>           
                                        </c:if>
                                    </c:forEach>



                                    <div class="col-md-6">
                                        <div class="card live-class-item h-100">
                                            <div class="card-body">
                                                <h5 class="card-title">Introduction to Database Design</h5>
                                                <p class="text-muted mb-2"><i class="far fa-calendar-alt me-2"></i> March 6, 2025</p>
                                                <p class="card-text mb-3">Fundamental concepts of relational database design and overview of the course structure.</p>
                                                <div class="d-flex justify-content-between align-items-center ">
                                                    <a href="#" class="btn btn-outline-secondary btn-sm"><i class="fas fa-play-circle me-1"></i> Watch Recording</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="card live-class-item h-100">
                                            <div class="card-body">
                                                <h5 class="card-title">Entity-Relationship Modeling</h5>
                                                <p class="text-muted mb-2"><i class="far fa-calendar-alt me-2"></i> March 13, 2025</p>
                                                <p class="card-text mb-3">Creating effective ER diagrams and translating business requirements into database models.</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <a href="#" class="btn btn-outline-secondary btn-sm"><i class="fas fa-play-circle me-1"></i> Watch Recording</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="popup-video" style="display: none;">
                                    <span class="close">&times;</span>
                                    <video id="popupVideo" controls></video>
                                </div>

                                <!-- Full Schedule Button -->
                                <div class="text-center mt-4">
                                    <button class="btn btn-outline-primary">View Full Schedule</button>
                                </div>
                            </div>

                            <!-- Resources Tab Content -->
                            <div class="tab-pane fade" id="resources" role="tabpanel">
                                <div class="container py-4">
                                    <h3 class="mb-4">Course Resources</h3>

                                    <!-- Books Section -->
                                    <div class="card mb-4">
                                        <div class="card-header bg-light">
                                            <h4 class="mb-0">Recommended Books</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <!-- Book 1 -->
                                                <div class="col-md-6 col-lg-4 mb-4">
                                                    <div class="card h-100 border-0 shadow-sm">
                                                        <div class="card-body">
                                                            <div class="d-flex mb-3">
                                                                <div class="flex-shrink-0">
                                                                    <span class="badge bg-primary p-2"><i class="fas fa-book"></i></span>
                                                                </div>
                                                                <div class="ms-3">
                                                                    <h5 class="card-title">Database System Concepts</h5>
                                                                    <h6 class="card-subtitle mb-2 text-muted">Silberschatz, Korth, Sudarshan</h6>
                                                                </div>
                                                            </div>
                                                            <p class="card-text">Comprehensive coverage of database concepts, design principles, and implementation techniques.</p>
                                                            <div class="text-end">
                                                                <a href="#" class="btn btn-sm btn-outline-primary">View Details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Book 2 -->
                                                <div class="col-md-6 col-lg-4 mb-4">
                                                    <div class="card h-100 border-0 shadow-sm">
                                                        <div class="card-body">
                                                            <div class="d-flex mb-3">
                                                                <div class="flex-shrink-0">
                                                                    <span class="badge bg-primary p-2"><i class="fas fa-book"></i></span>
                                                                </div>
                                                                <div class="ms-3">
                                                                    <h5 class="card-title">SQL Cookbook</h5>
                                                                    <h6 class="card-subtitle mb-2 text-muted">Anthony Molinaro</h6>
                                                                </div>
                                                            </div>
                                                            <p class="card-text">Practical solutions for SQL query challenges with examples applicable to various database systems.</p>
                                                            <div class="text-end">
                                                                <a href="#" class="btn btn-sm btn-outline-primary">View Details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Book 3 -->
                                                <div class="col-md-6 col-lg-4 mb-4">
                                                    <div class="card h-100 border-0 shadow-sm">
                                                        <div class="card-body">
                                                            <div class="d-flex mb-3">
                                                                <div class="flex-shrink-0">
                                                                    <span class="badge bg-primary p-2"><i class="fas fa-book"></i></span>
                                                                </div>
                                                                <div class="ms-3">
                                                                    <h5 class="card-title">Database Design for Mere Mortals</h5>
                                                                    <h6 class="card-subtitle mb-2 text-muted">Michael J. Hernandez</h6>
                                                                </div>
                                                            </div>
                                                            <p class="card-text">A practical approach to relational database design with clear explanations for beginners.</p>
                                                            <div class="text-end">
                                                                <a href="#" class="btn btn-sm btn-outline-primary">View Details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Other Resources -->
                                    <div class="card mb-4">
                                        <div class="card-header bg-light">
                                            <h4 class="mb-0">Online Resources</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                                    <span class="badge bg-info me-3"><i class="fas fa-link"></i></span>
                                                    <div>
                                                        <h5 class="mb-1">W3Schools SQL Tutorial</h5>
                                                        <p class="mb-0 text-muted small">Interactive SQL tutorial with examples and exercises</p>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                                    <span class="badge bg-info me-3"><i class="fas fa-link"></i></span>
                                                    <div>
                                                        <h5 class="mb-1">Database Journal</h5>
                                                        <p class="mb-0 text-muted small">Articles and tutorials on database management and design</p>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                                    <span class="badge bg-info me-3"><i class="fas fa-link"></i></span>
                                                    <div>
                                                        <h5 class="mb-1">Database Normalization Guide</h5>
                                                        <p class="mb-0 text-muted small">Comprehensive guide to database normalization with examples</p>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Downloadable Materials -->
                                    <div class="card">
                                        <div class="card-header bg-light">
                                            <h4 class="mb-0">Downloadable Materials</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                                    <span class="badge bg-success me-3"><i class="fas fa-file-pdf"></i></span>
                                                    <div>
                                                        <h5 class="mb-1">ER Diagram Cheat Sheet</h5>
                                                        <p class="mb-0 text-muted small">Quick reference for creating entity-relationship diagrams (PDF, 2.3MB)</p>
                                                    </div>
                                                    <span class="ms-auto"><i class="fas fa-download"></i></span>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                                    <span class="badge bg-success me-3"><i class="fas fa-file-excel"></i></span>
                                                    <div>
                                                        <h5 class="mb-1">SQL Query Examples</h5>
                                                        <p class="mb-0 text-muted small">Collection of SQL queries for common database operations (Excel, 1.5MB)</p>
                                                    </div>
                                                    <span class="ms-auto"><i class="fas fa-download"></i></span>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                                    <span class="badge bg-success me-3"><i class="fas fa-file-archive"></i></span>
                                                    <div>
                                                        <h5 class="mb-1">Sample Database Files</h5>
                                                        <p class="mb-0 text-muted small">Practice database files for MySQL and PostgreSQL (ZIP, 5.8MB)</p>
                                                    </div>
                                                    <span class="ms-auto"><i class="fas fa-download"></i></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Assignments Tab Content -->
                            <div class="tab-pane fade" id="assignments" role="tabpanel">
                                <div class="container py-4">
                                    <h3 class="mb-4">Course Assignments</h3>

                                    <div class="alert alert-info d-flex align-items-center mb-4" role="alert">
                                        <i class="fas fa-info-circle me-2"></i>
                                        <div>All assignments must be submitted through the platform. Late submissions are subject to a 10% penalty per day.</div>
                                    </div>

                                    <!-- Upcoming Assignments -->
                                    <div class="card mb-4">
                                        <div class="card-header bg-light d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0">Upcoming Assignments</h4>
                                            <span class="badge bg-primary">3 Due Soon</span>
                                        </div>
                                        <div class="card-body p-0">
                                            <div class="list-group list-group-flush">
                                                <!-- Assignment 1 -->
                                                <div class="list-group-item">
                                                    <div class="d-flex w-100 justify-content-between mb-2">
                                                        <h5 class="mb-1">Assignment 3: Database Normalization</h5>
                                                        <span class="badge bg-warning text-dark">Due in 5 days</span>
                                                    </div>
                                                    <p class="mb-2">Normalize the provided database schema to 3NF and explain your process.</p>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">Due: March 25, 2025, 11:59 PM</small>
                                                        <div>
                                                            <button class="btn btn-sm btn-outline-primary me-2">View Details</button>
                                                            <button class="btn btn-sm btn-primary">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Assignment 2 -->
                                                <div class="list-group-item">
                                                    <div class="d-flex w-100 justify-content-between mb-2">
                                                        <h5 class="mb-1">Assignment 4: SQL Query Optimization</h5>
                                                        <span class="badge bg-danger">Due in 2 days</span>
                                                    </div>
                                                    <p class="mb-2">Optimize the provided SQL queries and explain your optimization strategies.</p>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">Due: March 22, 2025, 11:59 PM</small>
                                                        <div>
                                                            <button class="btn btn-sm btn-outline-primary me-2">View Details</button>
                                                            <button class="btn btn-sm btn-primary">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Assignment 3 -->
                                                <div class="list-group-item">
                                                    <div class="d-flex w-100 justify-content-between mb-2">
                                                        <h5 class="mb-1">Assignment 5: Database Indexing</h5>
                                                        <span class="badge bg-info">Due in 12 days</span>
                                                    </div>
                                                    <p class="mb-2">Create an indexing strategy for the provided database schema and demonstrate its performance impact.</p>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">Due: April 1, 2025, 11:59 PM</small>
                                                        <div>
                                                            <button class="btn btn-sm btn-outline-primary me-2">View Details</button>
                                                            <button class="btn btn-sm btn-primary">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Past Assignments -->
                                    <div class="card">
                                        <div class="card-header bg-light d-flex justify-content-between align-items-center">
                                            <h4 class="mb-0">Past Assignments</h4>
                                            <span class="badge bg-secondary">2 Completed</span>
                                        </div>
                                        <div class="card-body p-0">
                                            <div class="list-group list-group-flush">
                                                <!-- Past Assignment 1 -->
                                                <div class="list-group-item">
                                                    <div class="d-flex w-100 justify-content-between mb-2">
                                                        <h5 class="mb-1">Assignment 1: ER Diagram Design</h5>
                                                        <span class="badge bg-success">Completed</span>
                                                    </div>
                                                    <p class="mb-2">Design an ER diagram for an online bookstore system based on the provided requirements.</p>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">Submitted: March 8, 2025</small>
                                                        <div>
                                                            <span class="badge bg-success me-2">Grade: 92/100</span>
                                                            <button class="btn btn-sm btn-outline-secondary">View Feedback</button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Past Assignment 2 -->
                                                <div class="list-group-item">
                                                    <div class="d-flex w-100 justify-content-between mb-2">
                                                        <h5 class="mb-1">Assignment 2: SQL Queries</h5>
                                                        <span class="badge bg-success">Completed</span>
                                                    </div>
                                                    <p class="mb-2">Write SQL queries to extract specific data from the provided database schema.</p>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">Submitted: March 15, 2025</small>
                                                        <div>
                                                            <span class="badge bg-success me-2">Grade: 88/100</span>
                                                            <button class="btn btn-sm btn-outline-secondary">View Feedback</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get all watch recording buttons
            const watchButtons = document.querySelectorAll('.btn-outline-secondary');
            const popupVideo = document.querySelector('.popup-video');
            const video = document.getElementById('popupVideo');
            const closeBtn = document.querySelector('.popup-video .close');

            // Add click event to all watch recording buttons
            watchButtons.forEach(button => {
                button.addEventListener('click', function (e) {
                    e.preventDefault();

                    // Get video source from data attribute or use a default
                    const videoSrc = this.getAttribute('data-video') || 'Video/default-recording.mp4';

                    // Set the video source
                    video.setAttribute('src', videoSrc);

                    // Show the popup
                    popupVideo.style.display = 'flex';

                    // Load and play the video
                    video.load();
                    video.play();
                });
            });

            // Close popup when clicking the close button
            closeBtn.addEventListener('click', function () {
                // Pause the video
                video.pause();

                // Hide the popup
                popupVideo.style.display = 'none';

                // Clear the source to stop loading
                video.setAttribute('src', '');
            });

            // Close popup when clicking outside the video
            popupVideo.addEventListener('click', function (e) {
                if (e.target === popupVideo) {
                    // Pause the video
                    video.pause();

                    // Hide the popup
                    popupVideo.style.display = 'none';

                    // Clear the source to stop loading
                    video.setAttribute('src', '');
                }
            });
        });
    </script>

