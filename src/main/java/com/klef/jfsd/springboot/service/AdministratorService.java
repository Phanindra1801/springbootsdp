package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.ExamQuestionPaper;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;
import com.klef.jfsd.springboot.models.Sports;
import com.klef.jfsd.springboot.models.Student;
public interface AdministratorService
{
	public Administrator checkadministratorlogin(String eemail,String epwd);
	public String addCourse(Course course);
	public List<Student> ViewAllStudents();
	public List<Course> ViewAllCourses();
	public String deletecourse(int cid);
	public String facultyCourseMapping(FacultyCourseMapping fcm);
	 public long checkFacultyCourseMapping(Faculty f,Course c,int section);
	 public List<Course> displayAllCourses();
	  public List<Faculty> displayAllFaculty();
	  public Faculty displayFacultyById(int fid);
	  public Course displayCourseById(int cid); 
	  
	  public String addExamQuestionPaper(ExamQuestionPaper paper);
      public ExamQuestionPaper getExamPaperById(int examPaperId);
      public List<ExamQuestionPaper> getAllExamPapers();
      public String addEvent(Sports event);
      public List<Sports> getAllSportsEvents();
      
      
      public Administrator ViewAdministratorByID(int productid);
}
