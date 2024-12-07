	package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private FacultyCourseMappingRepository courseMappingRepository;
	@Override
	public Faculty checkfacultylogin(String email, String pwd) 
	{
		return facultyRepository.checkfacultylogin(email, pwd);
	}

	@Override
	public List<Student> viewallstudents() {
		return studentRepository.findAll();
	}

	@Override
	public String updateFacultyProfile(Faculty faculty) 
	{
		Faculty f = facultyRepository.findById(faculty.getId()).get();
	    
	    f.setContact(faculty.getContact());
	    f.setDateofbirth(faculty.getDateofbirth());
	    f.setName(faculty.getName());
	    f.setPassword(faculty.getPassword());
	    f.setSalary(faculty.getSalary());
	    
       
	    
	    facultyRepository.save(f);
	    
	    return "Faculty Updated Successfully";
	}

		@Override
		public Faculty displayFacultybyID(int fid) {
			return facultyRepository.findById(fid).get();
		}

		

		@Override
		public List<FacultyCourseMapping> displayAllCourses(int facultyId) {
		    return courseMappingRepository.findByFaculty_Id(facultyId);
		}
		
	
}

