package com.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.Nutritionist;

import jakarta.transaction.Transactional;


@Repository
public interface NutritionistRepository  extends JpaRepository<Nutritionist,Integer>
{
@Query("select n from Nutritionist n where n.email=?1 and n.password=?2")
	
	public Nutritionist checknutrilogin(String email,String password);

@Query("update Nutritionist n set n.qualifications=?1 where n.id=?2")
@Modifying  // DML Operation
@Transactional  // to enable auto commit
public int updatenutriqualifications(String qualifications,int id);

@Query("SELECT FUNCTION('MONTHNAME', n.registrationDate) AS month, COUNT(n) AS count "
	     + "FROM Nutritionist n "
	     + "GROUP BY FUNCTION('MONTHNAME', n.registrationDate), FUNCTION('MONTH', n.registrationDate) "
	     + "ORDER BY FUNCTION('MONTH', n.registrationDate)")
	List<Object[]> countRegistrationsByMonth();






}