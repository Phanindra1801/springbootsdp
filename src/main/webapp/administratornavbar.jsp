<%@page import="com.klef.jfsd.springboot.models.Administrator"%>

<%
 Administrator administrator=(Administrator) session.getAttribute("administrator");
if(administrator==null)
{
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
	   <img src='displayprofileimage?id=${administrator.id}' alt="image">
	</div>


            <div class="sidebar__info">
               <h3><%=administrator.getName()%></h3>
               <span> <%=administrator.getEmail()%></span>
            </div>
         </div>

         <div class="sidebar__content">
            <div>
               <h3 class="sidebar__title">Welcome</h3>

               <div class="sidebar__list">
                  <a href="administratorhome" class="sidebar__link">
                     <i class="ri-home-line"></i>
                     <span>Home</span>
                  </a>

                  <a href="viewallstudentsa" class="sidebar__link">
                     <i class="ri-user-3-fill"></i>
                     <span>Students</span>
                  </a>

                  <div class="sidebar__dropdown">
                     <a href="addcourse" class="sidebar__link">
                        <i class="ri-add-circle-fill"></i>
                        <span>Add Course</span>
                     </a>
                  </div>

                  <a href="viewallcourses" class="sidebar__link">
                     <i class="ri-book-3-fill"></i>
                     <span>All Courses</span>
                  </a>

                  <a href="fcoursemapping" class="sidebar__link">
                     <i class="ri-exchange-dollar-line"></i>
                     <span>Allocate Courses</span>
                  </a>
               </div>
            </div>
            
           <div class="sidebar__list">
   <!-- Existing "Exam Papers" link -->
   <a href="addexampaper" class="sidebar__link">
      <i class="ri-file-add-line"></i>
      <span>Add Question Paper</span>
   </a>

   <a href="viewexampapers" class="sidebar__link">
      <i class="ri-file-list-3-line"></i>
      <span>Question Papers</span>
   </a>

   <a href="#" class="sidebar__link">
      <i class="ri-award-line"></i>
      <span>Results</span>
   </a>
<div class="sidebar__list">
              <a href="#" class="sidebar__link">
   <i class="ri-calendar-2-line"></i>
   <span>TimeTable</span>
</a>


  
</div>


              

               <a href="#" class="sidebar__link">
                  <i class="ri-football-line"></i>
                  <span>Sports</span>
               </a>
            </div>
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
