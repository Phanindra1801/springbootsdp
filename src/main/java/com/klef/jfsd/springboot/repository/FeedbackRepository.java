package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.models.Faculty;
import com.klef.jfsd.springboot.models.Feedback;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback,Integer>
{

}
