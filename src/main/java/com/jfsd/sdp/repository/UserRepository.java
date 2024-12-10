package com.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.User;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User,Integer>
{
	@Query("select u from User u where u.email=?1 and u.password=?2")
	
	public User checkuserlogin(String email,String password);
	
	
	 @Query("update User u set u.location=?1 where u.id=?2 ")
	  @Modifying  // DML Operation
	  @Transactional  // to enable auto commit
	  
	  public int updateUserLocation(String location,int uid);
	 @Query("SELECT FUNCTION('MONTHNAME', u.registrationDate) AS month, COUNT(u) AS count "
		     + "FROM User u "
		     + "GROUP BY FUNCTION('MONTHNAME', u.registrationDate), FUNCTION('MONTH', u.registrationDate) "
		     + "ORDER BY FUNCTION('MONTH', u.registrationDate)")
		List<Object[]> countRegistrationsByMonth();

}