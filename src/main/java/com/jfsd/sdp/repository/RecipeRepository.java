package com.jfsd.sdp.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.sdp.model.Recipe;

@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Integer>
{
   @Query("from Recipe p where p.category=?1")
   public List<Recipe> viewallrecipebycategory(String category);
   
   public List<Recipe> findByCategory(String category);
}