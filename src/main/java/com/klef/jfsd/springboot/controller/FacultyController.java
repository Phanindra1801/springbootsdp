package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.models.Attendance;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.repository.AttendanceRepository;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyController 
{
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AttendanceRepository attendanceRepository;
	@Autowired
	 private JavaMailSender mailSender;
	
	 @PostMapping("sendemail")
	 public ModelAndView sendEmail(HttpServletRequest request) throws Exception
	 {
	 String name = request.getParameter("name");
	 String toemail = request.getParameter("email");
	 String subject = request.getParameter("subject");
	 String msg = request.getParameter("message");
	 MimeMessage mimeMessage = mailSender.createMimeMessage();
	 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	 int otp = (int)(Math.random() * 99999); // random number generation
	 helper.setTo(toemail);
	 helper.setSubject(subject);
	 helper.setFrom("suryakiranmtechcse@gmail.com");
	 String htmlContent =
	 "<h3>Contact Form Details</h3>" +
	 "<p><strong>Name:</strong> " + name + "</p>" +
	 "<p><strong>Email:</strong> " + toemail + "</p>" +
	 "<p><strong>Subject:</strong> " + subject + "</p>" +
	 "<p><strong>Message:</strong> " + msg + "</p>" +
	 "<p><strong>OTP:</strong> " + otp + "</p>";
	 helper.setText(htmlContent, true);
	 mailSender.send(mimeMessage);

	 ModelAndView mv = new ModelAndView("mailsuccess");
	 mv.addObject("message", "Email Sent Successfully");
	 return mv;
	 }
	 @GetMapping("contact")
		public ModelAndView contact()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("contact");
			return mv;
		}
	@GetMapping("facultylogin")
	public ModelAndView facultylogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultylogin");
		return mv;
	}
	@PostMapping("checkfacultylogin")
	@ResponseBody
	public ModelAndView checkfacultylogin(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		Faculty faculty = facultyService.checkfacultylogin(email, pwd);
		if(faculty!=null)
		{
			//session
			
			HttpSession session=request.getSession();
			session.setAttribute("faculty", faculty);  //Faculty is session variable
			
			//session.setMaxInactiveInterval(5);
			
		     mv.setViewName("facultyhome");
		}
		else
		{
			//return "Faculty login fail";
			mv.setViewName("facultylogin");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	@GetMapping("facultyhome")
	public ModelAndView facultyhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyhome");
		return mv;
	}
	

	@GetMapping("postattendance")
    public ModelAndView postattendance()
    {
      ModelAndView mv = new ModelAndView();
       List<Student> stulist=facultyService.viewallstudents();
       mv.addObject("stulist",stulist);
       mv.setViewName("postattendance");
		
      return mv;
    }
	
	@PostMapping("/postatt")
	public ModelAndView postatt(HttpServletRequest request)
	{
		
		List<Student> stulist=facultyService.viewallstudents();
	     int sz=stulist.size();
		
		for(int i=1;i<=sz;i++)
		{
			String id=request.getParameter("id"+i);
			int vid=Integer.parseInt(id);
			
			String at=request.getParameter("att"+i);
			
			String name=request.getParameter("name"+i);
			
			Attendance attendance=new Attendance();
			attendance.setStudentid(vid);
			attendance.setStudentname(name);
			
			if(at!=null)
			{
				attendance.setStatus("Absent");
			}
			else
				attendance.setStatus("Present");
			
			attendanceRepository.save(attendance);
		}
		
		ModelAndView mv = new ModelAndView();
	       
	       mv.addObject("stulist",stulist);
	       mv.setViewName("facultyhome");
			
	      return mv;
	}
	
	@GetMapping("facultyprofile")
	public ModelAndView facultyprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyprofile");
		return mv;
	}
	
	@GetMapping("facultysessionexpirey")
	public ModelAndView empsessionexpirey()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultysessionexpirey");
		return mv;
	}

	@GetMapping("updatefaculty")
	public ModelAndView updatefaculty()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatefaculty");
		return mv;
	}
	@PostMapping("updatefacultyprofile")
	public ModelAndView updatefacultyprofile(HttpServletRequest request) {
		
	    ModelAndView mv = new ModelAndView();
	    try {
	        int id = Integer.parseInt(request.getParameter("fid"));
	        String name = request.getParameter("fname");
	        String pwd = request.getParameter("fpassword");
	        String email = request.getParameter("femail");
	        String contact = request.getParameter("fcontact");
	        String dob = request.getParameter("fdob");
//	        String gender = request.getParameter("fgender");

	  
	        Faculty faculty = new Faculty();
	        faculty.setId(id);
	        faculty.setName(name);
//	        faculty.setGender(gender);
	        faculty.setDateofbirth(dob);
	        faculty.setPassword(pwd);
	        faculty.setContact(contact);
	        faculty.setEmail(email);

	        String msg = facultyService.updateFacultyProfile(faculty);
	        Faculty f = facultyService.displayFacultybyID(id);
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("faculty", f);

	        // Set success message and vie
	        mv.setViewName("facultyhome");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        // Log the exception for debugging
	        e.printStackTrace();
	        
	        // Set error message and view
	        mv.setViewName("facultyhome");
	        mv.addObject("message", "Error updating profile: " + e.getMessage());
	    }
	    return mv;
	}

	
	@GetMapping("facultylogout")
	public ModelAndView emplogout(HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		session.removeAttribute("faculty");
		//session.invalidate();  to remove all session attributes...
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("facultylogin");
		return mv;
	}
	
	@GetMapping("displaycourses/{facultyId}")
	public ModelAndView viewCoursesByFaculty(@PathVariable int facultyId) {
	    ModelAndView mv = new ModelAndView();
	    List<FacultyCourseMapping> courselist = facultyService.displayAllCourses(facultyId);
	    mv.setViewName("displaycourses");
	    mv.addObject("courselist", courselist);
	    return mv;
	}
	@GetMapping("viewallstudentsf")
    public ModelAndView viewallstudentsf()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> studentlist = adminService.ViewAllStudents();
      mv.setViewName("viewallstudentsf");
      mv.addObject("studentlist",studentlist);
      return mv;
    }
	
}
