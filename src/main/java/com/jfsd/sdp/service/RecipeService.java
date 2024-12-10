package com.jfsd.sdp.service;

import java.util.List;

import com.jfsd.sdp.model.Recipe;

public interface RecipeService 
{
   public String AddRecipe(Recipe recipe);
   public List<Recipe> viewallrecipebycategory(String category);
}