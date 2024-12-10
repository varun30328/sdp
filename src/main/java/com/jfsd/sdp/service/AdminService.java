package com.jfsd.sdp.service;

import java.util.List;
import java.util.Map;

import com.jfsd.sdp.model.Admin;
import com.jfsd.sdp.model.Nutritionist;
import com.jfsd.sdp.model.User;

public interface AdminService
{
	public Admin checkadminlogin(String uname,String pwd);
    public List<User> viewallUsers();
    public List<Nutritionist> viewallnutrisiosinists();
    public String deleteuser(int uid);
    public String deleteNutrisionist(int id);
    
    
    public long getUserCount();
    
    public long getNutritionistCount();
    Map<String, Integer> getUserRegistrationsByMonth();

    Map<String, Integer> getNutritionistRegistrationsByMonth();
    
    public long getRecipeCount();
    
    Map<String, Double> getDailyTrackerInsights();
    
    
}