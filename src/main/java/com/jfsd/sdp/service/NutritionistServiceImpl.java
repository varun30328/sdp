package com.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.jfsd.sdp.model.Dietary;
import com.jfsd.sdp.model.Nutritionist;
import com.jfsd.sdp.model.Resource;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.repository.DietaryRepository;
import com.jfsd.sdp.repository.NutritionistRepository;
import com.jfsd.sdp.repository.ResourceRepository;


@Service
public class NutritionistServiceImpl implements NutritionistService
{
	@Autowired
	private NutritionistRepository nutritionistRepository;
	
	@Autowired
	  private ResourceRepository resrepository;

	@Autowired
	 private DietaryRepository dietaryRepository;
	@Override
    public String NutritionistRegistration(Nutritionist nutritionist) {
        nutritionistRepository.save(nutritionist); // Save to the database
        return "Nutritionist Registered Successfully";
    }

	@Override
	public Nutritionist checknutrilogin(String email, String password) {
		return nutritionistRepository.checknutrilogin(email, password);

	}

	@Override
	public Nutritionist displaynutribyID(int id) 
	{
		return nutritionistRepository.findById(id).get();

	}

	@Override
	public String updateNutriprofile(Nutritionist nutritionist) 
	{
	Nutritionist nutri =  nutritionistRepository.findById(nutritionist.getId()).get();
	nutri.setFullname(nutritionist.getFullname());
	nutri.setGender(nutritionist.getGender());
	nutri.setPassword(nutritionist.getPassword());
	nutri.setContact(nutritionist.getContact());
	nutri.setQualifications(nutritionist.getQualifications());
	nutri.setExperience(nutritionist.getExperience());
	nutri.setAvailablehours(nutritionist.getAvailablehours());
	nutri.setPreferedConsultation(nutritionist.getPreferedConsultation());
	
	nutritionistRepository.save(nutri);
	return "Nutrition Updated Successfully";
	}

	@Override
	  public String AddResource(Resource resource) {
	    resrepository.save(resource);
	    return "Resource Added Successfully";
	  }

	  @Override
	  public List<Resource> ViewAllResource() {
	    
	    return (List<Resource>) resrepository.findAll();

	      }
	  @Override
	  public String Adddiet(Dietary dietary) {
	    dietaryRepository.save(dietary);
	    return " Added Successfully";
	  }

	  @Override
	  public List<Dietary> ViewAlldiet() {
	    return (List<Dietary>) dietaryRepository.findAll();

	  }
	
}
