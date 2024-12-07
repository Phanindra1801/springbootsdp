package com.klef.jfsd.springboot.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="course_table")
public class Course 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="course_id")
	private int id;

	@Column(name="course_name", nullable=false, length=100)
	private String courseName;

	@Column(name="course_code", nullable=false, unique=true, length=20)
	private String courseCode;

	@Column(name="course_credits", nullable=false)
	private int credits;

	@Column(name="course_department", nullable=false, length=50)
	private String department;

	@Column(name="course_ltps", nullable=false, length=20)
	private String ltps; // Example: "3-1-0-2" format for lecture, tutorial, practical, self-study hours

	@Column(name="course_coordinator", nullable=false, length=50)
	private String courseCoordinator;

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getLtps() {
		return ltps;
	}

	public void setLtps(String ltps) {
		this.ltps = ltps;
	}

	public String getCourseCoordinator() {
		return courseCoordinator;
	}

	public void setCourseCoordinator(String courseCoordinator) {
		this.courseCoordinator = courseCoordinator;
	}
}
