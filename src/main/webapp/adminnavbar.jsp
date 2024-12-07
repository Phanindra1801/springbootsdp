<%@page import="com.klef.jfsd.springboot.models.Admin"%>
<%
Admin admin =(Admin)session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("login?message=sessionExpired");
    return;
}
%>
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
               <img src="resources/img/perfil.png" alt="image">
            </div>
            <div class="sidebar__info">
               <h2><%= admin.getUsername() %></h2>
            </div>
         </div>

         <div class="sidebar__content">
            <div>
               <h3 class="sidebar__title">MANAGE</h3>
               <div class="sidebar__list">
                  <!-- Add Section -->
                  <a href="adminhome" class="sidebar__link" id="add-link">
                     <i class="ri-home-fill"></i>
                     <span>Home</span>
                  </a>
                  <a href="#" class="sidebar__link" id="add-link">
                     <i class="ri-pie-chart-2-fill"></i>
                     <span>Add</span>
                  </a>
                  <div class="sidebar__submenu" id="add-submenu" style="display: none;">
                     <a href="addadministrator" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>Add Administrator</a><br/>
                     <a href="addfaculty" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>Add Faculty</a><br/>
                     <a href="addstudent" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>Add Student</a><br/>
                  </div>

                  <!-- View Section -->
                  <a href="#" class="sidebar__link" id="view-link">
                     <i class="ri-wallet-3-fill"></i>
                     <span>View</span>
                  </a>
                  <div class="sidebar__submenu" id="view-submenu" style="display: none;">
                     <a href="viewalladministrators" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>View Administrators</a><br/>
                     <a href="viewallfacultys" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>View Faculty</a><br/>
                     <a href="viewallstudents" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>View Students</a><br/>
                  </div>

                  <!-- Update Section -->
                  <a href="updatefacultystatus" class="sidebar__link">
                     <i class="ri-calendar-fill"></i>
                     <span>Update Faculty</span>
                  </a>

                  <!-- Fee Section -->
                  <a href="#" class="sidebar__link">
                     <i class="ri-arrow-up-down-line"></i>
                     <span>Fee</span>
                  </a>

                  <!-- Delete Section -->
                  <a href="#" class="sidebar__link" id="delete-link">
                     <i class="ri-bar-chart-box-fill"></i>
                     <span>Delete</span>
                  </a>
                  <div class="sidebar__submenu" id="delete-submenu" style="display: none;">
                     <a href="deleteadministrator" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>Delete Administrators</a><br/>
                     <a href="deletefaculty" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>Delete Faculty</a><br/>
                     <a href="deletestudent" class="sidebar__link"><i class="ri-pie-arrow-2-fill"></i>Delete Students</a><br/>
                  </div>
               </div>
            </div>

            <div>
               <h3 class="sidebar__title">Information</h3>
               <div class="sidebar__list">
                  <a href="viewfeedback" class="sidebar__link">
                     <i class="ri-settings-3-fill"></i>
                     <span>Feedbacks</span>
                  </a>

                  <a href="#" class="sidebar__link">
                     <i class="ri-mail-unread-fill"></i>
                     <span>Emails</span>
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

            <a href="login" class="sidebar__link">
               <i class="ri-logout-box-r-fill"></i>
               <span>Log Out</span>
            </a>
         </div>
      </div>
   </nav>
   
   <script src="resources/js/navbar.js"></script>
   <script>
      document.querySelectorAll('.sidebar__link').forEach(link => {
         link.addEventListener('click', function (e) {
            const submenu = this.nextElementSibling;
            if (submenu && submenu.classList.contains('sidebar__submenu')) {
               if (this.id === 'add-link' || this.id === 'view-link' || this.id === 'delete-link') {
                  const isVisible = submenu.style.display === 'block';
                  submenu.style.display = isVisible ? 'none' : 'block';
                  e.preventDefault();
               }
            }
         });
      });

      document.querySelectorAll('.sidebar__submenu a').forEach(submenuLink => {
         submenuLink.addEventListener('click', function (e) {
            // Prevent closing of Add/View/Delete dropdowns
            e.stopPropagation();
         });
      });

      document.addEventListener('click', function (e) {
         document.querySelectorAll('.sidebar__submenu').forEach(submenu => {
            if (
               submenu.style.display === 'block' &&
               !submenu.previousElementSibling.contains(e.target) &&
               !submenu.contains(e.target)
            ) {
               submenu.style.display = 'none';
            }
         });
      });
   </script>
</body>
</html>
