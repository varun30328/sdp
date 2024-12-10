package com.jfsd.sdp.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.sdp.model.Admin;
import com.jfsd.sdp.model.DailyTrackerEntry;
import com.jfsd.sdp.model.Nutritionist;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.repository.AdminRepository;
import com.jfsd.sdp.repository.DailyTrackerRepository;
import com.jfsd.sdp.repository.NutritionistRepository;
import com.jfsd.sdp.repository.RecipeRepository;
import com.jfsd.sdp.repository.UserRepository;

@Service
public class AdminServiceImpl implements AdminService 
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RecipeRepository recipeRepository;
	
	@Autowired
	private NutritionistRepository nutritionistRepository;
	
	@Autowired
	private DailyTrackerRepository dailyTrackerRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
		
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public List<User> viewallUsers() 
	{
		return userRepository.findAll();
	}

	@Override
	public String deleteuser(int uid) 
	{
		userRepository.deleteById(uid);
		return "user deleted successfully";
	}

	@Override
	public List<Nutritionist> viewallnutrisiosinists() 
	{
		return nutritionistRepository.findAll();
	}

	@Override
	public String deleteNutrisionist(int id) 
	{
		nutritionistRepository.deleteById(id);
		return "Nutritisionist Deleted Successfully ";
	}
	
	
	@Override
	public long getUserCount() {
	    long count = userRepository.count(); // Verify this returns the correct count
	    System.out.println("User count: " + count); // Add a debug print
	    return count;
	}

	@Override
	public long getNutritionistCount() {
		 return nutritionistRepository.count();
	}

	@Override
	public long getRecipeCount() {
		 return recipeRepository.count(); 
	}

	@Override
    public Map<String, Integer> getUserRegistrationsByMonth() {
        List<Object[]> results = userRepository.countRegistrationsByMonth();
        return convertResultsToMap(results);
    }

    @Override
    public Map<String, Integer> getNutritionistRegistrationsByMonth() {
        List<Object[]> results = nutritionistRepository.countRegistrationsByMonth();
        return convertResultsToMap(results);
    }

    private Map<String, Integer> convertResultsToMap(List<Object[]> results) {
        Map<String, Integer> data = new LinkedHashMap<>();
        // Initialize map with all months to ensure consistent order
        List<String> months = Arrays.asList("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
        for (String month : months) {
            data.put(month, 0); // Default count is 0
        }

        // Fill map with results from database
        for (Object[] result : results) {
            String month = (String) result[0];
            Integer count = ((Number) result[1]).intValue();
            data.put(month, count);
        }

        return data;
    }
	
    @Override
    public Map<String, Double> getDailyTrackerInsights() {
        List<DailyTrackerEntry> entries = dailyTrackerRepository.findAll();

        if (entries.isEmpty()) {
            System.out.println("No data found in DailyTrackerEntry table.");
            return Map.of("No Data Available", 0.0); // Handle empty data gracefully
        }

        System.out.println("Fetched " + entries.size() + " entries from DailyTrackerEntry table.");

        // Aggregating data
        double totalMeals = entries.stream().mapToDouble(DailyTrackerEntry::getMeals).sum();
        double totalCalories = entries.stream().mapToDouble(DailyTrackerEntry::getCalories).sum();
        double totalWater = entries.stream().mapToDouble(DailyTrackerEntry::getWater).sum();
        double totalProtein = entries.stream().mapToDouble(DailyTrackerEntry::getProtein).sum();
        double totalWorkout = entries.stream().mapToDouble(DailyTrackerEntry::getWorkout).sum();
        double totalSteps = entries.stream().mapToDouble(DailyTrackerEntry::getSteps).sum();
        double totalSleep = entries.stream().mapToDouble(DailyTrackerEntry::getSleep).sum();

        System.out.println("Total Meals: " + totalMeals);
        System.out.println("Total Calories: " + totalCalories);
        System.out.println("Total Water: " + totalWater);
        System.out.println("Total Protein: " + totalProtein);
        System.out.println("Total Workout: " + totalWorkout);
        System.out.println("Total Steps: " + totalSteps);
        System.out.println("Total Sleep: " + totalSleep);

        // Creating a response map
        Map<String, Double> insights = new HashMap<>();
        insights.put("Meals", totalMeals);
        insights.put("Calories", totalCalories);
        insights.put("Water", totalWater);
        insights.put("Protein", totalProtein);
        insights.put("Workout", totalWorkout);
        insights.put("Steps", totalSteps);
        insights.put("Sleep", totalSleep);

        return insights;
    }

}