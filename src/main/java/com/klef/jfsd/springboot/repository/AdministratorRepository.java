package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.springboot.models.Administrator;

@Repository
public interface AdministratorRepository extends JpaRepository<Administrator,Integer>
{
	@Query("select a from Administrator a where a.email=?1 and a.password=?2")
	public Administrator checkadministratorlogin(String email,String pwd);
}
