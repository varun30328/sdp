package com.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin,String>
{
	@Query("select a from Admin a where a.username=?1 and a.password=?2")
	public Admin checkadminlogin(String uname,String pwd);
	
	@Query("SELECT COUNT(u) FROM User u")
	 long countAllUsers();

	 @Query("SELECT COUNT(n) FROM Nutritionist n")
	    long countAllNutritionists();
	 
	 @Query("SELECT COUNT(r) FROM Recipe r")
	 long countAllRecipes();
	
}