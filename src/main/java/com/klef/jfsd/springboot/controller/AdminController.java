package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.klef.jfsd.springboot.models.Admin;
import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.Feedback;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.AdministratorService;
import com.klef.jfsd.springboot.service.FacultyService;
import com.klef.jfsd.springboot.service.StudentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdministratorService administratorService;
	
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("login")
	public ModelAndView index(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		session.removeAttribute("administrator");
		session.removeAttribute("faculty");
		session.removeAttribute("student");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/")
	public ModelAndView front()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front");
		return mv;
	}
	@GetMapping("sessionexpiry")
	public ModelAndView sessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpiry");
		return mv;
	}
	@GetMapping("loginfail")
	public ModelAndView loginfail()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginfail");
		return mv;
	}
	
	@PostMapping("checklogin")
	public ModelAndView checklogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
	
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");
		Admin admin = adminService.checkadminlogin(auname, apwd);
		Administrator administrator = administratorService.checkadministratorlogin(auname, apwd);
		Faculty faculty = facultyService.checkfacultylogin(auname, apwd);
		Student student = studentService.checkstudentlogin(auname, apwd);
		if(admin!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			mv.setViewName("adminhome");
		}
		else if(administrator!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("administrator", administrator);
			mv.setViewName("administratorhome");
		}
		else if(faculty!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("faculty", faculty);
			mv.setViewName("facultyhome");
		}
		else if(student!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("student", student);
			mv.setViewName("studenthome");
		}
		else
		{
			mv.setViewName("index");
			mv.addObject("message", "Invalid Credentials");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	@GetMapping("addadministrator")
	public ModelAndView addadministrator()
	{
		ModelAndView mv = new ModelAndView("addadministrator");
		return mv;
	}
	
	@PostMapping("insertadministrator")
	   public ModelAndView insertadministrator(HttpServletRequest request,@RequestParam("profileimage") MultipartFile file) throws Exception
	   {
		   String msg = null;
		   
		   ModelAndView mv = new ModelAndView();
		   
		   try
		   {
		   String name = request.getParameter("name");
		   String gender = request.getParameter("gender");
		   String dateofbirth = request.getParameter("dateofbirth");
		   String education = request.getParameter("education");
		   double salary = Double.valueOf(request.getParameter("salary"));
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String location = request.getParameter("location");
		   String contact = request.getParameter("contact");
		   
			  byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			  //  creates a Blob object in Java from a byte array (bytes).
			  
			  Administrator a = new Administrator();
			  a.setName(name);
			  a.setGender(gender);
			  a.setDateofbirth(dateofbirth);
			  a.setEducation(education);
			  a.setSalary(salary);
			  a.setEmail(email);
			  a.setPassword(password);
			  a.setLocation(location);
			  a.setContact(contact);
			  a.setImage(blob);
			  
			  msg=adminService.AddAdministrator(a);
			  System.out.println(msg);
			  mv.setViewName("administratormsg");
			  mv.addObject("message",msg);
		   }	  
		   catch(Exception e)
		   {
			   msg = e.getMessage();
			   System.out.println(msg.toString());
			   mv.setViewName("administratormsg");
			   mv.addObject("message",msg);
		   }
		   return mv;
	   }
	
	@GetMapping("addfaculty")
	   public ModelAndView addfaculty()
	   {
		   ModelAndView mv = new ModelAndView("addfaculty");
		   return mv;
	   }
	
	@PostMapping("insertfaculty")
	   public ModelAndView insertfaculty(HttpServletRequest request,@RequestParam("profileimage") MultipartFile file) throws Exception
	   {
		   String msg = null;
		   
		   ModelAndView mv = new ModelAndView();
		   
		   try
		   {
		   String name = request.getParameter("name");
		   String gender = request.getParameter("gender");
		   String dateofbirth = request.getParameter("dateofbirth");
		   String department = request.getParameter("department");
		   double salary = Double.valueOf(request.getParameter("salary"));
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String location = request.getParameter("location");
		   String contact = request.getParameter("contact");
		   String status = "Registered";
		   
			  byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			  //  creates a Blob object in Java from a byte array (bytes).
			  
			  Faculty f = new Faculty();
			  f.setName(name);
			  f.setGender(gender);
			  f.setDateofbirth(dateofbirth);
			  f.setDepartment(department);
			  f.setSalary(salary);
			  f.setEmail(email);
			  f.setPassword(password);
			  f.setLocation(location);
			  f.setContact(contact);
			  f.setStatus(status);
			  f.setImage(blob);
			  
			  msg=adminService.AddFaculty(f);
			  System.out.println(msg);
			  mv.setViewName("facultymsg");
			  mv.addObject("message",msg);
		   }	  
		   catch(Exception e)
		   {
			   msg = e.getMessage();
			   System.out.println(msg.toString());
			   mv.setViewName("facultymsg");
			   mv.addObject("message",msg);
		   }
		   return mv;
	   }
	@GetMapping("addstudent")
	   public ModelAndView addstudent()
	   {
		   ModelAndView mv = new ModelAndView("addstudent");
		   return mv;
	   }
	
	@PostMapping("insertstudent")
	   public ModelAndView insertstudent(HttpServletRequest request,@RequestParam("profileimage") MultipartFile file) throws Exception
	   {
		   String msg = null;
		   
		   ModelAndView mv = new ModelAndView();
		   
		   try
		   {
		   String name = request.getParameter("name");
		   String gender = request.getParameter("gender");
		   String dateofbirth = request.getParameter("dateofbirth");
		   String department = request.getParameter("department");
		   int year = Integer.parseInt(request.getParameter("yearofstudy"));
		   double fee = Double.valueOf(request.getParameter("fee"));
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String location = request.getParameter("location");
		   String contact = request.getParameter("contact");
		   String pcontact = request.getParameter("parentcontact");
		   
			  byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			  //  creates a Blob object in Java from a byte array (bytes).
			  
			  Student s = new Student();
			  s.setName(name);
			  s.setGender(gender);
			  s.setDateofbirth(dateofbirth);
			  s.setDepartment(department);
			  s.setYearofstudy(year);
			  s.setFee(fee);
			  s.setEmail(email);
			  s.setPassword(password);
			  s.setAddress(location);
			  s.setContact(contact);
			  s.setParentcontact(pcontact);
			  s.setImage(blob);
			  
			  msg=adminService.AddStudent(s);
			  System.out.println(msg);
			  mv.setViewName("studentmsg");
			  mv.addObject("message",msg);
		   }	  
		   catch(Exception e)
		   {
			   msg = e.getMessage();
			   System.out.println(msg.toString());
			   mv.setViewName("studentmsg");
			   mv.addObject("message",msg);
		   }
		   return mv;
	   }
	
	@GetMapping("viewalladministrators")
    public ModelAndView viewalladministrators()
    {
      ModelAndView mv = new ModelAndView();
      List<Administrator> administratorslist = adminService.ViewAllAdministrators();
      mv.setViewName("viewalladministrators");
      mv.addObject("administratorslist",administratorslist);
		
      return mv;
    }
	@GetMapping("viewallfacultys")
    public ModelAndView viewallfacultys()
    {
      ModelAndView mv = new ModelAndView();
      List<Faculty> facultylist = adminService.ViewAllFacultys();
      mv.setViewName("viewallfacultys");
      mv.addObject("facultylist",facultylist);
		
      return mv;
    }
	@GetMapping("viewallstudents")
    public ModelAndView viewallstudents()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> studentlist = adminService.ViewAllStudents();
      mv.setViewName("viewallstudents");
      mv.addObject("studentlist",studentlist);
      return mv;
    }
	
	@GetMapping("viewfeedback")
    public ModelAndView viewfeedback()
    {
      ModelAndView mv = new ModelAndView();
      List<Feedback> feedbacklist = adminService.ViewAllFeedbacks();
      mv.setViewName("viewfeedback");
      mv.addObject("feedbacklist",feedbacklist);
      return mv;
    }
	
	@GetMapping("updatefacultystatus")
    public ModelAndView updatefacultystatus()
    {
      ModelAndView mv = new ModelAndView();
      List<Faculty> facultylist = adminService.ViewAllFacultys();
      mv.setViewName("updatefacultystatus");
      mv.addObject("facultylist",facultylist);
      return mv;
    }
	
	@GetMapping("updatestatus")
    public String updatestatus(@RequestParam("id") int fid,@RequestParam("status") String status)
    {
      adminService.updatefacultystatus(status, fid);
      return "redirect:/updatefacultystatus";
    }
	
	@GetMapping("deleteadministrator1")
	public String deleteadministrator1(@RequestParam("id") int aid)
	{
		adminService.deleteadministrator(aid);
		return "redirect:/deleteadministrator";
	}
	
	@GetMapping("deleteadministrator")
    public ModelAndView deleteadministrator()
    {
      ModelAndView mv = new ModelAndView();
      List<Administrator> administratorlist = adminService.ViewAllAdministrators();
      mv.setViewName("deleteadministrator");
      mv.addObject("administratorlist",administratorlist);
      return mv;
    }
	
	@GetMapping("deletefaculty2")
	public String deletefaculty1(@RequestParam("id") int fid)
	{
		adminService.deletefaculty(fid);
		return "redirect:/deletefaculty";
	}
	
	@GetMapping("deletefaculty")
    public ModelAndView deletefaculty()
    {
      ModelAndView mv = new ModelAndView();
      List<Faculty> facultylist = adminService.ViewAllFacultys();
      mv.setViewName("deletefaculty");
      mv.addObject("facultylist",facultylist);
      return mv;
    }
	
	@GetMapping("deletestudent3")
	public String deletestudent3(@RequestParam("id") int sid)
	{
		adminService.deletestudent(sid);
		return "redirect:/deletestudent";
	}
	
	@GetMapping("deletestudent")
    public ModelAndView deletestudent()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> studentlist = adminService.ViewAllStudents();
      mv.setViewName("deletestudent");
      mv.addObject("studentlist",studentlist);
      return mv;
    }
}
