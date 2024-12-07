package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.Feedback;
import com.klef.jfsd.springboot.service.AdministratorService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StudentController 
{
	@Autowired
	private AdministratorService administratorService;
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("studenthome")
	public ModelAndView studenthome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studenthome");
		return mv;
	}
	
	@GetMapping("viewcourses")
	public ModelAndView viewcourses()
	{
		ModelAndView mv = new ModelAndView();
		List<Course> clist = administratorService.ViewAllCourses();
		mv.setViewName("viewcourses");
		mv.addObject("courseslist",clist);
		return mv;
	}
	
	@GetMapping("feedback")
	public ModelAndView feedback()
	{
		ModelAndView mv = new ModelAndView("feedback");
		return mv;
	}
	
	@PostMapping("givefeedback")
	public ModelAndView givefeedback(HttpServletRequest request)
	{
	   int fid = Integer.parseInt(request.getParameter("fid"));
	   String fname = request.getParameter("fname");
	   String description = request.getParameter("description");
	   
	   Feedback f = new Feedback();
	   f.setFacultyid(fid);
	   f.setFacultyname(fname);
	   f.setDescription(description);
			  
	   String msg=studentService.givefeedback(f);
			  
	   ModelAndView mv = new ModelAndView("feedbackmsg");
	   mv.addObject("message", msg);
	   return mv;
	}
}
