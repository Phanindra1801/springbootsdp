package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.models.Admin;
import com.klef.jfsd.springboot.models.Administrator;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.Feedback;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.AdministratorRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.FeedbackRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private AdministratorRepository administratorRepository;
	
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private FeedbackRepository feedbackRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd)
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public String AddAdministrator(Administrator a) 
	{
		administratorRepository.save(a);
		return "Administrator Added Successfully";
	}

	@Override
	public String AddFaculty(Faculty f) 
	{
		facultyRepository.save(f);
		return "Faculty Added Successfully";
	}

	@Override
	public String AddStudent(Student s)
	{
		studentRepository.save(s);
		return "Student Added Successfully";
	}


	@Override
	public List<Administrator> ViewAllAdministrators()
	{
		return administratorRepository.findAll();
	}


	@Override
	public Administrator displayadministratorbyid(int aid) 
	{
		return administratorRepository.findById(aid).get();
	}


	@Override
	public List<Faculty> ViewAllFacultys()
	{
		return facultyRepository.findAll();
	}


	@Override
	public Faculty displayfacultybyid(int fid)
	{
		return facultyRepository.findById(fid).get();
	}


	@Override
	public List<Student> ViewAllStudents() 
	{
		return studentRepository.findAll();

	}

	@Override
	public List<Feedback> ViewAllFeedbacks() 
	{
		return feedbackRepository.findAll();
	}


	@Override
	public Student displaystudentbyid(int sid) 
	{
		return studentRepository.findById(sid).get();
	}


	@Override
	public String updatefacultystatus(String status, int fid) 
	{
		adminRepository.updateFacultyStatus(status, fid);
		return "Faculty Status Updated Successfully";
	}

	@Override
	public String deleteadministrator(int aid)
	{
		administratorRepository.deleteById(aid);
		return "Administrator Deleted Successfully";
	}

	@Override
	public String deletefaculty(int fid)
	{
		facultyRepository.deleteById(fid);
		return "Faculty Deleted Successfully";
	}

	@Override
	public String deletestudent(int sid)
	{
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}

	
}
