package com.jfsd.sdp.service;

import java.sql.Date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.sdp.model.DailyTrackerEntry;
import com.jfsd.sdp.model.Dietary;
import com.jfsd.sdp.model.NutriProfile;
import com.jfsd.sdp.model.Recipe;
import com.jfsd.sdp.model.Resource;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.model.Workout;
import com.jfsd.sdp.repository.DailyTrackerRepository;
import com.jfsd.sdp.repository.DietaryRepository;
import com.jfsd.sdp.repository.NutriProfileRepository;
import com.jfsd.sdp.repository.RecipeRepository;
import com.jfsd.sdp.repository.ResourceRepository;
import com.jfsd.sdp.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService
{
  @Autowired
  private UserRepository userRepository;
  
  @Autowired
  private RecipeRepository recipeRepository;
	
  @Autowired
  private DailyTrackerRepository dailyTrackerRepository;
  
  @Autowired
  private NutriProfileRepository nutriProfileRepository;
  
  @Autowired
  private ResourceRepository resrepository;
  
  @Autowired
  private DietaryRepository dietaryRepository;
  @Override
  public String UserRegistration(User user) {
      user.setRegistrationDate(new Date(System.currentTimeMillis())); // Set the current date
      userRepository.save(user);
      return "User Registered Successfully";
  }

	@Override
	public User checkuserlogin(String email, String password) {
		return userRepository.checkuserlogin(email,password);
	}

	@Override
	public String updateUserProfile(User user) {
		
		User u = userRepository.findById(user.getId()).get();
		
		u.setName(user.getName());
		u.setGender(user.getGender());
		u.setAge(user.getAge());
		u.setPassword(user.getPassword());
		u.setContact(user.getContact());
		u.setLocation(user.getLocation());
		
		userRepository.save(u);
		
		
		return "User Updated Successfully";
	}

	@Override
	public User displayUserbyID(int uid) {
		
		return userRepository.findById(uid).get();
	}
	
	@Override
	  public List<Recipe> ViewAllRecipe() 
	  {
	    return (List<Recipe>) recipeRepository.findAll();
	  }

	  @Override
	  public Recipe ViewRecipeByID(int recipeid) 
	  {
	    return recipeRepository.findById(recipeid).get();
	  }
	  
	  @Override
	  public String adddailytracker(DailyTrackerEntry dailyTrackerEntry) 
	  {
	      dailyTrackerRepository.save(dailyTrackerEntry);
	      return "Daily Tracker Entry Added Successfully";
	  }

	@Override
	public NutriProfile nutriprofileregistration(NutriProfile nutriProfile)
	{
		
	        return nutriProfileRepository.save(nutriProfile);
	    }


@Override
public List<Resource> ViewAllResource() {
  
  return (List<Resource>) resrepository.findAll();

    }


}