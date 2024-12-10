package com.jfsd.sdp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.sdp.model.Recipe;
import com.jfsd.sdp.repository.RecipeRepository;

@Service
public class RecipeServiceImpl implements RecipeService
{
  @Autowired
  private RecipeRepository recRepository;

  @Override
  public String AddRecipe(Recipe recipe) 
  {
    recRepository.save(recipe);
    return "Recipe Added Successfully";
  }


  @Override
  public List<Recipe> viewallrecipebycategory(String category) 
  {
    return recRepository.viewallrecipebycategory(category);
  }

}