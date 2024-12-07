package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.FacultyCourseMapping;

public interface FacultyCourseMappingRepository extends CrudRepository<FacultyCourseMapping, Integer>
{
  @Query("SELECT COUNT(fcm) FROM FacultyCourseMapping fcm where fcm.faculty = ?1 and fcm.course = ?2 AND fcm.section = ?3")
  public long checkfcoursemapping(Faculty faculty,Course course,int section);
  
  List<FacultyCourseMapping> findByFaculty_Id(int facultyId);
}
