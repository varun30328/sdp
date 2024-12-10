package com.jfsd.sdp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.sdp.model.Admin;
import com.jfsd.sdp.model.Nutritionist;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.model.Workout;
import com.jfsd.sdp.service.AdminService;
import com.jfsd.sdp.service.WorkoutService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private WorkoutService workoutService;
	
	
	@PostMapping("checkadminlogin")
	public String checkadminlogin(HttpServletRequest request) {
	    String auname = request.getParameter("auname");
	    String apwd = request.getParameter("apwd");
	    Admin admin = adminService.checkadminlogin(auname, apwd);

	    if (admin != null) {
	        return "redirect:/adminhome"; // Redirect to adminhome endpoint
	    } else {
	        return "adminloginfail"; // Directly return the login failure page
	    }
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminHome() {
	    ModelAndView mv = new ModelAndView();
	    long userCount = adminService.getUserCount(); // Fetch total user count
	    long nutritionistCount = adminService.getNutritionistCount(); // Fetch total nutritionist count
	    long recipeCount = adminService.getRecipeCount(); // Fetch total recipe count

	    mv.setViewName("adminhome");
	    mv.addObject("userCount", userCount); // Pass userCount to the view
	    mv.addObject("nutritionistCount", nutritionistCount); // Pass nutritionistCount to the view
	    mv.addObject("recipeCount", recipeCount); // Pass recipeCount to the view

	    return mv;
	}
	
	
	  @GetMapping("viewallusers")
	    public ModelAndView viewallusers()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<User> userlist = adminService.viewallUsers();
	      mv.setViewName("viewallusers");
	      mv.addObject("userlist",userlist);
	      return mv;
	    }
	  
	  @GetMapping("viewallnutrisionists")
	    public ModelAndView viewallnutrisiosinists()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Nutritionist> nutrilist = adminService.viewallnutrisiosinists();
	      mv.setViewName("viewallnutrisionists");
	      mv.addObject("nutrilist",nutrilist);
	      return mv;
	    }
	  
	  @GetMapping("delete")
	  public String deleteoperation(@RequestParam("id")  int uid)
	  {
	    adminService.deleteuser(uid);
	    return "redirect:/viewallusers";//redirection to specific path URI
	  }
	  
	  
	  
	  @GetMapping("deletenutri")
	  public String deletenutrioperation(@RequestParam("id")  int nid)
	  {
	    adminService.deleteNutrisionist(nid);
	    return "redirect:/viewallnutrisionists";//redirection to specific path URI
	  }
	  
	  
	  @GetMapping("/activityStats")
	    @ResponseBody
	    public Map<String, Map<String, Integer>> getActivityStats() {
	        Map<String, Integer> userRegistrations = adminService.getUserRegistrationsByMonth();
	        Map<String, Integer> nutritionistRegistrations = adminService.getNutritionistRegistrationsByMonth();

	        Map<String, Map<String, Integer>> stats = new HashMap<>();
	        stats.put("userRegistrations", userRegistrations);
	        stats.put("nutritionistRegistrations", nutritionistRegistrations);
	        return stats;
	    }
	  
	  
	  @GetMapping("/dailyTrackerInsights")
	    @ResponseBody
	    public Map<String, Double> getDailyTrackerInsights() {
	        Map<String, Double> insights = adminService.getDailyTrackerInsights();
	        System.out.println("Daily Tracker Insights: " + insights);
	        return insights;
	    }
	  
	  @GetMapping("/workoutStats")
	  @ResponseBody
	  public Map<String, Map<String, Integer>> getWorkoutStats() {
	      List<Workout> workouts = workoutService.ViewAllworkouts();
	      Map<String, Map<String, Integer>> stats = new HashMap<>();
	      Map<String, Integer> typeCount = new HashMap<>();
	      Map<String, Integer> difficultyCount = new HashMap<>();

	      workouts.forEach(workout -> {
	          typeCount.put(workout.getType(), typeCount.getOrDefault(workout.getType(), 0) + 1);
	          difficultyCount.put(workout.getDifficulty(), difficultyCount.getOrDefault(workout.getDifficulty(), 0) + 1);
	      });

	      stats.put("type", typeCount);
	      stats.put("difficulty", difficultyCount);
	      
	      // Log the data being returned
	      System.out.println("Workout Stats: " + stats);

	      return stats;
	  }

}