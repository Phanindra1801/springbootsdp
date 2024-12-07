package com.klef.jfsd.springboot.controller;

import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import java.sql.Blob;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.ExamQuestionPaper;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;
import com.klef.jfsd.springboot.models.Sports;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.service.AdministratorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class AdministratorController 
{
	@Autowired
	private AdministratorService administratorService;
	@GetMapping("administratorhome")
	public ModelAndView administratorhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("administratorhome");
		return mv;
	}
	
	@GetMapping("administratorlogin")
	public ModelAndView administratorlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("administratorlogin");
		return mv;
	}
	@PostMapping("checkadministratorlogin")
	public ModelAndView checkAdministratorLogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    String auname = request.getParameter("auname");
	    String apwd = request.getParameter("apwd");
	    Administrator admin = administratorService.checkadministratorlogin(auname, apwd);
	    
	    if (admin != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("administrator", admin);
	        mv.setViewName("administratorhome");
	    } else {
	        mv.setViewName("loginfail");
	        mv.addObject("message", "Login Failed");
	    }
	    return mv;
	}


	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.removeAttribute("administrator");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("administratorlogin");
		return mv;
	}
	@GetMapping("empsessionexpiry")
	public ModelAndView empsessionexpiry(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.removeAttribute("administrator");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("administratorlogin");
		return mv;
	}
	@GetMapping("addcourse")
	 public ModelAndView addcourse(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addcourse");
		return mv;

		
	}
	@PostMapping("insertcourse")
	public ModelAndView insertCourse(HttpServletRequest request) {
	    String courseName = request.getParameter("courseName");
	    String courseCode = request.getParameter("courseCode");
	    int credits = Integer.parseInt(request.getParameter("credits"));
	    String department = request.getParameter("department");
	    String ltps = request.getParameter("ltps");
	    String courseCoordinator = request.getParameter("courseCoordinator");

	    Course course = new Course();
	    course.setCourseName(courseName);
	    course.setCourseCode(courseCode);
	    course.setCredits(credits);
	    course.setDepartment(department);
	    course.setLtps(ltps);
	    course.setCourseCoordinator(courseCoordinator);
	    
	    
	    String msg = administratorService.addCourse(course);

	    ModelAndView mv = new ModelAndView("coursesuccess");
	    mv.addObject("message", msg);

	    return mv;
	}
@GetMapping("viewallcourses")
public ModelAndView viewallcourses() {
	
      ModelAndView mv = new ModelAndView();
      List<Course> clist = administratorService.ViewAllCourses();
      mv.setViewName("viewallcourses");
      mv.addObject("courseslist",clist);
  
      return mv;
    }
@GetMapping("deletecourse")
public String deleteopration(@RequestParam("id") int cid)
{
 administratorService.deletecourse(cid);

  return "redirect:/viewallcourses";
}

@GetMapping("fcoursemapping")
public ModelAndView facultycoursemapping()
{
	  ModelAndView mv = new ModelAndView("facultycoursemapping");
	  
    List<Course> courselist = administratorService.displayAllCourses();
    mv.addObject("coursedata", courselist);
	  
	  List<Faculty> facultylist = administratorService.displayAllFaculty();
	  mv.addObject("facultydata", facultylist);
	  
	  return mv;
}
@PostMapping("fcoursemappinginsert")
public ModelAndView fcoursemappinginsert(HttpServletRequest request)
{
	  String msg=null;
	  
	  ModelAndView mv = new ModelAndView("facultycoursemapping");
	  
	  int fid = Integer.parseInt(request.getParameter("fid"));
	  int cid = Integer.parseInt(request.getParameter("cid"));
	  int section = Integer.parseInt(request.getParameter("section"));
	  String ftype = request.getParameter("ftype");
	  
	  long n = administratorService.checkFacultyCourseMapping(administratorService.displayFacultyById(fid), administratorService.displayCourseById(cid), section);
	  
	  if(n>0)
	  {
		  msg = "Mapping Already Done";
	  }
	  else
	  {
		  FacultyCourseMapping fcm = new FacultyCourseMapping();
		  
		  fcm.setCourse(administratorService.displayCourseById(cid));
		  fcm.setFaculty(administratorService.displayFacultyById(fid));
		  fcm.setSection(section);
		  fcm.setFacultytype(ftype);
		  
		  msg = administratorService.facultyCourseMapping(fcm);
		  
	  }
	  
	  mv.addObject("message", msg);
	  
	  
	  
	  return mv;
}
@GetMapping("addexampaper")
public ModelAndView addexampaper() {
	
      ModelAndView mv = new ModelAndView();
      mv.setViewName("addexampaper");
 
      return mv;
    }

@PostMapping("insertExamPaper")
public String insertExamPaper(HttpServletRequest request, @RequestParam("questionPaperPdf") MultipartFile file) throws Exception {
    String msg = null;
    ModelAndView mv = new ModelAndView();


    try {
        String subjectName = request.getParameter("subjectName");
        String courseCode = request.getParameter("courseCode");
        int semester = Integer.parseInt(request.getParameter("semester"));
        String examDate = request.getParameter("examDate");
        String paperType = request.getParameter("examType"); 
        
        byte[] bytes = file.getBytes();
        Blob pdfBlob = new javax.sql.rowset.serial.SerialBlob(bytes);
        ExamQuestionPaper examPaper = new ExamQuestionPaper();
        examPaper.setSubjectName(subjectName);
        examPaper.setCourseCode(courseCode);
        examPaper.setSemester(semester);
        examPaper.setExamDate(examDate);
        examPaper.setExamType(paperType);
        examPaper.setQuestionPaperPdf(pdfBlob);
        msg = administratorService.addExamQuestionPaper(examPaper);
        System.out.println(msg);
        
        mv.setViewName("examPaperMsg");
        mv.addObject("message", msg);

    } catch (Exception e) {
        msg = e.getMessage();
        System.out.println(msg);
        
        mv.setViewName("examPaperError");
        mv.addObject("message", msg);
        System.out.println("catch");
    }

    return "addcourse";
}
@GetMapping("viewexampapers")
public ModelAndView viewexampapers() {
    ModelAndView mv = new ModelAndView();
    List<ExamQuestionPaper> examPapers = administratorService.getAllExamPapers(); // Assuming a service method to fetch all exam papers
    mv.setViewName("viewexampapers");
    mv.addObject("examPapers", examPapers);
    return mv;
}

@GetMapping("downloadExamPaper")
public ResponseEntity<byte[]> downloadExamPaper(@RequestParam("id") int examPaperId) {
    ExamQuestionPaper examPaper = administratorService.getExamPaperById(examPaperId);
    if (examPaper != null && examPaper.getQuestionPaperPdf() != null) {
        byte[] pdfContent;
        try {
            pdfContent = examPaper.getQuestionPaperPdf().getBytes(1, (int) examPaper.getQuestionPaperPdf().length());
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDisposition(ContentDisposition.inline().filename("examPaper.pdf").build());

            return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
        } catch (SQLException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
}
@GetMapping("sportsevent")
public ModelAndView sportsevent() {
    ModelAndView mv = new ModelAndView();
    
    List<Sports> eventList = administratorService.getAllSportsEvents();

    mv.addObject("eventList", eventList);
    
    mv.setViewName("sportsevent");
    
    return mv;
}
@GetMapping("displayprofileimage")
public ResponseEntity<byte[]> displayprofileimage(@RequestParam("id") int id) throws Exception
{
  Administrator administrator =  administratorService.ViewAdministratorByID(id);
  byte [] imageBytes = null;
  imageBytes = administrator.getImage().getBytes(1,(int) administrator.getImage().length());

  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
  
}

@GetMapping("addEventForm")
public ModelAndView addEventForm()
{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("addEventForm");
	return mv;
}
@GetMapping("viewallstudentsa")
public ModelAndView viewallstudentsa()
{
  ModelAndView mv = new ModelAndView();
  List<Student> studentlist = administratorService.ViewAllStudents();
  mv.setViewName("viewallstudentsa");
  mv.addObject("studentlist",studentlist);
  return mv;
}
@PostMapping("insertSportsEvent")
public String insertSportsEvent(HttpServletRequest request, @RequestParam("eventImage") MultipartFile eventImage) {
    String eventName = request.getParameter("eventName");
    String eventDescription = request.getParameter("eventDescription");
    LocalDate eventDate = LocalDate.parse(request.getParameter("eventDate"));
    String eventLocation = request.getParameter("eventLocation");
    String sportType = request.getParameter("sportType");

    Sports event = new Sports();
    event.setName(eventName);
    event.setDescription(eventDescription);
    event.setDate(eventDate);
    event.setLocation(eventLocation);
    event.setType(sportType);

   
    String msg = administratorService.addEvent(event);

  
    return "redirect:/sportsevent";
    
}


}
