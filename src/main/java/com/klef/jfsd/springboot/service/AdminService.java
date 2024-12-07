package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.models.Admin;
import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.Feedback;
import com.klef.jfsd.springboot.models.Student;

public interface AdminService 
{
	//Admin
	public Admin checkadminlogin(String uname,String pwd);
	public String AddAdministrator(Administrator a);
	public String AddFaculty(Faculty f);
	public String AddStudent(Student s);
	
	public List<Administrator> ViewAllAdministrators();
	public Administrator displayadministratorbyid(int aid);
	public List<Faculty> ViewAllFacultys();
	public Faculty displayfacultybyid(int fid);
	public List<Student> ViewAllStudents();
	public Student displaystudentbyid(int sid);
	
	public String updatefacultystatus(String status,int fid);
	
	public String deleteadministrator(int aid);
	public String deletefaculty(int fid);
	public String deletestudent(int sid);
	
	public List<Feedback> ViewAllFeedbacks();
}
