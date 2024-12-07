<%@page import="com.klef.jfsd.springboot.models.Faculty"%>
<%@page import="com.klef.jfsd.springboot.models.Administrator"%>
<%
 Faculty faculty = (Faculty) session.getAttribute("faculty");
 if (faculty == null) {
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
            
            <button class="header__toggle" id="header-toggle">
               <i class="ri-menu-line"></i>
            </button>
         </div>
      </header>
      <nav class="sidebar" id="sidebar">
         <div class="sidebar__container">
            <div class="sidebar__user">
               <div class="sidebar__img">
                  <img src='displayprofileimage?id=${faculty.id}' alt="image">
               </div>
   
               <div class="sidebar__info">
                  <h3><%=faculty.getName()%></h3>
                  <span><%=faculty.getEmail()%></span>
               </div>
            </div>

            <div class="sidebar__content">
             

                  <div class="sidebar__list">
                    <a href="viewcourses" class="sidebar__link">
                       <i class="ri-git-repository-fill"></i>
                        <span>View Courses</span>
                     </a>
                     <a href="viewallstudentsf" class="sidebar__link active-link">
                       <i class="ri-team-line"></i>
                        <span>View All Students</span>
                     </a>
                     
                     <a href="postattendance" class="sidebar__link">
                       <i class="ri-calculator-line"></i>
                        <span>Post Attendence</span>
                     </a>
                     
                      <a href="contact" class="sidebar__link">
                        <i class="ri-calendar-fill"></i>
                        <span>Apply Leave</span>
                     </a>

                     <a href="#" class="sidebar__link">
                        <i class="ri-calendar-fill"></i>
                        <span>Time Table</span>
                     </a>

                     <a href="facultyprofile" class="sidebar__link">
                       <i class="ri-user-2-fill"></i>
                        <span>Profile</span>
                     </a>
                     
                     <a href="login" class="sidebar__link">
                     <i class="ri-logout-box-r-line"></i>
                        <span>Logout</span>
                     </a>

                    
                  </div>
               </div>

              
            </div>

            <div class="sidebar__actions">
               <button>
                  <i class="ri-moon-clear-fill sidebar__link sidebar__theme" id="theme-button">
                     <span>Theme</span>
                  </i>
               </button>

               <button class="sidebar__link">
                  <i class="ri-logout-box-r-fill"></i>
                  <span>Log Out</span>
               </button>
            </div>
         </div>
      </nav>
      
      <script src="resources/js/navbar.js"></script>
   </body>
</html>