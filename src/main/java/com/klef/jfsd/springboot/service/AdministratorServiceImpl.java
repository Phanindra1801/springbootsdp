package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.ExamQuestionPaper;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;
import com.klef.jfsd.springboot.models.Sports;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.repository.AdministratorRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.ExamQuestionPaperRepository;
import com.klef.jfsd.springboot.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.SportsRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdministratorServiceImpl implements AdministratorService
{
	@Autowired
	private AdministratorRepository administratorRepository;
	
	@Autowired
	private CourseRepository repository;
	@Autowired
	private StudentRepository  studentRepository;
	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Autowired
	private FacultyRepository facultyRepository;

	@Autowired
	private ExamQuestionPaperRepository  questionPaperRepository;
	@Autowired
	private SportsRepository sportsRepository;
	
	@Override
	public Administrator checkadministratorlogin(String eemail, String epwd) 
	{
		return administratorRepository.checkadministratorlogin(eemail, epwd);
	}

	@Override
	public String addCourse(Course course) {
		// TODO Auto-generated method stub
		repository.save(course);
		return "Course  Added Successfully";
	}

	@Override
	public List<Student> ViewAllStudents() {
		// TODO Auto-generated method stub
		return studentRepository.findAll();
	}

	@Override
	public List<Course> ViewAllCourses() {
		// TODO Auto-generated method stub
		return repository.findAll() ;
	}

	@Override
	public String deletecourse(int cid) {
		// TODO Auto-generated method stub
		repository.deleteById(cid);
	 return "Course Deleted Successfully";
	}

	@Override
	public String facultyCourseMapping(FacultyCourseMapping fcm) {
		facultyCourseMappingRepository.save(fcm);
		return "Faculty Course Mapping Done";
	}

	@Override
	public long checkFacultyCourseMapping(Faculty f, Course c, int section) 
	{
		return facultyCourseMappingRepository.checkfcoursemapping(f, c, section);
	}

	@Override
	public List<Course> displayAllCourses() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public List<Faculty> displayAllFaculty() {
		// TODO Auto-generated method stub
		return facultyRepository.findAll();
	}

	@Override
	public Faculty displayFacultyById(int fid) {
		// TODO Auto-generated method stub
		return facultyRepository.findById(fid).get();
	}

	@Override
	public Course displayCourseById(int cid) {
		// TODO Auto-generated method stub
		return repository.findById(cid).get();
	}

	@Override
	public String addExamQuestionPaper(ExamQuestionPaper paper) {
		questionPaperRepository.save(paper);
		return "Product Added Successfully";
	}

	@Override
	public ExamQuestionPaper getExamPaperById(int examPaperId) {
		// TODO Auto-generated method stub
		return questionPaperRepository.findById(examPaperId).get();
	}

	@Override
	public List<ExamQuestionPaper> getAllExamPapers() {
		// TODO Auto-generated method stub
		return questionPaperRepository.findAll();
	}

	@Override
	public String addEvent(Sports event) {
		// TODO Auto-generated method stub
		 sportsRepository.save(event);
		 return "Event Added Successfully";
	}

	@Override
	public List<Sports> getAllSportsEvents() {
		// TODO Auto-generated method stub
		return sportsRepository.findAll();
	}

	@Override
	public Administrator ViewAdministratorByID(int aid) {
		return administratorRepository.findById(aid).get();
	}

	
}
