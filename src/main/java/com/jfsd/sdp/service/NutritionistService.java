package com.jfsd.sdp.service;

import java.util.List;

import com.jfsd.sdp.model.Dietary;
import com.jfsd.sdp.model.Nutritionist;
import com.jfsd.sdp.model.Resource;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.model.Workout;

public interface NutritionistService
{
	public String NutritionistRegistration(Nutritionist nutritionist);
	public Nutritionist checknutrilogin(String email,String password);
	public  Nutritionist displaynutribyID(int id);
	public String updateNutriprofile(Nutritionist nutritionist);
	public String AddResource(Resource resource);
    public List<Resource> ViewAllResource();
    public String Adddiet(Dietary dietary);
    public List<Dietary> ViewAlldiet();

}
