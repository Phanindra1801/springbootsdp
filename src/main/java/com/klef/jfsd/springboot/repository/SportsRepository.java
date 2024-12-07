package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.models.Admin;
import com.klef.jfsd.springboot.models.Sports;

public interface SportsRepository  extends JpaRepository<Sports, Integer>{

}
