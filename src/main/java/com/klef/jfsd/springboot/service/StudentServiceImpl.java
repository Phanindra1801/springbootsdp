package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.models.Feedback;
import com.klef.jfsd.springboot.models.Student;
import com.klef.jfsd.springboot.repository.FeedbackRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	

	@Autowired
	private FeedbackRepository feedbackRepository;

	@Override
	public Student checkstudentlogin(String eemail, String epwd) 
	{
		return studentRepository.checkstudentlogin(eemail, epwd);
	}

	@Override
	public String givefeedback(Feedback f) 
	{
		feedbackRepository.save(f);
		return "Feedback Added Successfully";
	}
	
}
