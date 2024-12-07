<%@page import="com.klef.jfsd.springboot.models.Student"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
    Student student = (Student)session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login?message=sessionExpired");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css">
   <link rel="stylesheet" href="resources/css/styles.css">
   <title>ERP</title>
</head>
<body>
   <header class="header" id="header">
      <div class="header__container">
<!--          <button class="header__toggle" id="header-toggle"> -->
            <i class="ri-menu-line"></i>
         </button>
      </div>
   </header>
   <nav class="sidebar" id="sidebar">
      <div class="sidebar__container">
         <div class="sidebar__user">
	           <div class="sidebar__img">
	   <img src='displayprofileimage?id=${student.id}' alt="image">
	</div>


            <div class="sidebar__info">
               <h3><%=student.getName()%></h3>
               <span> <%=student.getEmail()%></span>
            </div>
         </div>

         <div class="sidebar__content">
            <div>
               <h3 class="sidebar__title">Welcome</h3>

               <div class="sidebar__list">
                  <a href="#" class="sidebar__link">
                     <i class="ri-home-line"></i>
                     <span>Home</span>
                  </a>

                  <a href="#" class="sidebar__link">
                     <i class="ri-calendar-check-fill"></i>
                     <span>Attendance</span>
                  </a>

                  <div class="sidebar__dropdown">
                     <a href="viewcourses" class="sidebar__link">
                        <i class="ri-book-3-fill"></i>
                        <span>Courses</span>
                     </a>
                  </div>

                  <a href="#" class="sidebar__link">
                     <i class="ri-wallet-line"></i>
                     <span>Fee Payments</span>
                  </a>

                  <a href="#" class="sidebar__link">
                     <i class="ri-calendar-2-line"></i>
                     <span>Time Table</span>
                  </a>
               </div>
            </div>
            
           <div class="sidebar__list">
   <!-- Existing "Exam Papers" link -->
   <a href="feedback" class="sidebar__link">
      <i class="ri-feedback-line"></i>
      <span>Feedback</span>
   </a>

   <a href="#" class="sidebar__link">
      <i class="ri-user-settings-line"></i>
      <span>Profile</span>
   </a>

		   <a href="#" class="sidebar__link">
		      <i class="ri-football-line"></i>
		      <span>Sports</span>
		   </a>
         </div>

         <div class="sidebar__actions">
            <button>
               <i class="ri-moon-clear-fill sidebar__link sidebar__theme" id="theme-button">
                  <span>Theme</span>
               </i>
            </button>

            <a href="login" class="sidebar__link">
               <i class="ri-logout-box-r-fill"></i>
               <span>Log Out</span>
            </a>
         </div>
      </div>
   </nav>
   <script src="resources/js/navbar.js"></script>
</body>
</html>
