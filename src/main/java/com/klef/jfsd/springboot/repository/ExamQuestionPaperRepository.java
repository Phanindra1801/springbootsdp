package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.models.Course;
import com.klef.jfsd.springboot.models.ExamQuestionPaper;

@Repository
public interface ExamQuestionPaperRepository extends JpaRepository<ExamQuestionPaper,Integer>{

}

