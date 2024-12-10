package com.jfsd.sdp.service;


import java.util.List;

import com.jfsd.sdp.model.DailyTrackerEntry;
import com.jfsd.sdp.model.Dietary;
import com.jfsd.sdp.model.NutriProfile;
import com.jfsd.sdp.model.Recipe;
import com.jfsd.sdp.model.Resource;
import com.jfsd.sdp.model.User;

public interface UserService 
{
	public String UserRegistration(User user);
	public User checkuserlogin(String email,String password);
    public String updateUserProfile(User user);
    public  User displayUserbyID(int uid);
    public List<Recipe> ViewAllRecipe();
    public Recipe ViewRecipeByID(int recipeid);
    public String adddailytracker(DailyTrackerEntry d);
    public NutriProfile nutriprofileregistration(NutriProfile nutriProfile);
    public List<Resource> ViewAllResource();

    
}
