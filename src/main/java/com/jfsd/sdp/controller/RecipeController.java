package com.jfsd.sdp.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.sdp.model.Recipe;
import com.jfsd.sdp.service.RecipeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class RecipeController 
{
  
  @Autowired
  private RecipeService recipeService;
  
   @GetMapping("addrecipe")
   public ModelAndView addrecipedemo()
   {
     ModelAndView mv = new ModelAndView("addrecipe");
     return mv;
   }
   
   // enctype="multipart/form-data" is used in HTML forms to enable file uploads. 
   // It ensures that form data, including binary files, is encoded correctly when submitted to the server. 
  
   @PostMapping("insertrecipe")
   public ModelAndView insertproductdemo(HttpServletRequest request,@RequestParam("recipeimage") MultipartFile file) throws Exception
   {
     String msg = null;
     
     ModelAndView mv = new ModelAndView();
     
     try
     {
     String category = request.getParameter("category");
     String name = request.getParameter("name");
     String level=request.getParameter("level");
     String description = request.getParameter("description");
     String prep=request.getParameter("prep");
     String nutritionfacts=request.getParameter("nutritionfacts");
     Double calorie = Double.valueOf(request.getParameter("calorie"));
     
      byte[] bytes = file.getBytes();
      Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
      //  creates a Blob object in Java from a byte array (bytes).
      
      Recipe p = new Recipe();
      p.setCategory(category);
      p.setName(name);
      p.setLevel(level);
      p.setDescription(description);
      p.setPrep(prep);
      p.setNutritionfacts(nutritionfacts);
      p.setCalorie(calorie);
      p.setImage(blob);
      
      msg=recipeService.AddRecipe(p);
      System.out.println(msg);
      mv.setViewName("recipemsg");
      mv.addObject("message",msg);
     }    
     catch(Exception e)
     {
       msg = e.getMessage();
       System.out.println(msg.toString());
       mv.setViewName("producterror");
       mv.addObject("message",msg);
     }
     return mv;
   }
  
//   
//   @PostMapping("displayproduct")
//   public ModelAndView displayproductdemo(HttpServletRequest request)
//   {
//     int pid=Integer.parseInt(request.getParameter("pid"));
//     Recipe product=productService.ViewProductByID(pid);
//     ModelAndView mv=new ModelAndView("displayproduct");
//     mv.addObject("product",product);
//     return mv;
//   }
//   
//   @GetMapping("viewproductsbycategory")
//   public ModelAndView  viewproductsbycategorydemo()
//   {
//        ModelAndView mv=new ModelAndView("viewproductsbycategory");
//        return mv;
//   }
//   
//   @PostMapping("displayproductsbycategory")
//   public ModelAndView  viewproductsbycategorydemo(HttpServletRequest request)
//   {
//      String category = request.getParameter("category");
//      
//        List<Recipe> productlist=productService.viewallproductsbycategory(category);
//        ModelAndView mv=new ModelAndView("displayproductsbycategory");
//        mv.addObject("productlist",productlist);
//        return mv;
//   }
   
   
  }