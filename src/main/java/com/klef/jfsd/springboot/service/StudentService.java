package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.models.Feedback;
import com.klef.jfsd.springboot.models.Student;

public interface StudentService 
{
	public Student checkstudentlogin(String eemail,String epwd);
	public String givefeedback(Feedback f);
}
