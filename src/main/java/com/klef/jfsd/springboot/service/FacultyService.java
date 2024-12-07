package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;
import com.klef.jfsd.springboot.models.Student;

public interface FacultyService 
{
	public Faculty checkfacultylogin(String email,String pwd);
	public List<Student> viewallstudents(); 
	public String updateFacultyProfile(Faculty faculty);
	public Faculty displayFacultybyID(int fid);
	public List<FacultyCourseMapping> displayAllCourses(int facultyId);
}
