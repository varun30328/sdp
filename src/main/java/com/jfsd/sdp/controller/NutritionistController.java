package com.jfsd.sdp.controller;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.sdp.model.Dietary;
import com.jfsd.sdp.model.Nutritionist;
import com.jfsd.sdp.model.Resource;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.model.Workout;
import com.jfsd.sdp.service.DietaryService;
import com.jfsd.sdp.service.NutritionistService;
import com.jfsd.sdp.service.WorkoutService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class NutritionistController
{
   @Autowired
   private NutritionistService nutritionistService;
   
   @Autowired
   private DietaryService dietaryService;
   
   @GetMapping("/nhome")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("nhome");
		return mv;
	}
   
   @GetMapping("nlogin")
	  public ModelAndView emplogin()
	  {
	    ModelAndView mv= new ModelAndView();
	    mv.setViewName("nutrilogin");
	    return mv;
	  }
   
   @GetMapping("dietplan")
	  public ModelAndView dietplan()
	  {
	    ModelAndView mv= new ModelAndView();
	    mv.setViewName("dietplan");
	    return mv;
	  }
   
   @PostMapping("checknutrilogin")
   @ResponseBody
   public ModelAndView checknutrilogin(HttpServletRequest request)
   {
   	ModelAndView mv = new ModelAndView();
   	String email = request.getParameter("email");
   	String password = request.getParameter("password");
   	
   	Nutritionist nutri= nutritionistService.checknutrilogin(email, password);
   	if(nutri!=null)
   	{
   		HttpSession session = request.getSession();
       	session.setAttribute("nutri",nutri);
       	//session.setMaxInactiveInterval(10);
   		mv.setViewName("nhome");
   	}
   	else
   	{
   		mv.setViewName("nlogin");
   		mv.addObject("message","Login Failed!");
   	}
   	return mv;
   }

   @GetMapping("nutriprofile")
   public ModelAndView userprofile()
   {
     ModelAndView mv=new ModelAndView();
     mv.setViewName("nutriprofile");
     return mv;
   }


   
	@GetMapping("nutritionist")
	public ModelAndView nutritionistreg()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("nutritionistregistration");
		return mv;
	}
	
	@GetMapping("nlogout")
	public ModelAndView nlogout(HttpServletRequest request)
	{
		  HttpSession session = request.getSession();
		   
	      ModelAndView mv=new ModelAndView();
	      mv.setViewName("nutrilogin");
	      return mv;
	}
	
	@PostMapping("insertnutritionist")
	   public ModelAndView insertNutritionist(HttpServletRequest request) {
	       String name = request.getParameter("fullname");
	       String gender = request.getParameter("gender");
	       String email = request.getParameter("email");
	       String password = request.getParameter("password");
	       String contact = request.getParameter("contact");
	       String qualification = request.getParameter("qualifications");
	       String specialization = request.getParameter("specializations");
	       double experience = Double.parseDouble(request.getParameter("experience"));
	       long licenseno = Long.parseLong(request.getParameter("licenseno"));
	       String availablehours = request.getParameter("availablehours");
	       String preferedConsultation = request.getParameter("preferedConsultation");

	       // Create a new Nutritionist object and set the values from the form
	       Nutritionist nutritionist = new Nutritionist();
	       nutritionist.setFullname(name);
	       nutritionist.setGender(gender);
	       nutritionist.setEmail(email);
	       nutritionist.setPassword(password);
	       nutritionist.setContact(contact);
	       nutritionist.setQualifications(qualification);
	       nutritionist.setSpecializations(specialization);
	       nutritionist.setExperience(experience);
	       nutritionist.setLicenseno(licenseno);
	       nutritionist.setAvailablehours(availablehours);
	       nutritionist.setPreferedConsultation(preferedConsultation);
	       nutritionist.setRegistrationDate(new java.sql.Date(new Date().getTime())); // Set current date as registration date

	       // Call the service to save the nutritionist to the database
	       String msg = nutritionistService.NutritionistRegistration(nutritionist);

	       // Create the ModelAndView object to display success message
	       ModelAndView mv = new ModelAndView();
	       mv.setViewName("nregsuccess");
	       mv.addObject("message", msg);

	       return mv;
	   }
	
	
	@GetMapping("nutriupdate")
	public ModelAndView nutriprofile()
	{
	  ModelAndView mv=new ModelAndView();
	  mv.setViewName("nutriprofile");
	  return mv;
	}
	
	
	
	@PostMapping("updatenutriprofile")
	public ModelAndView updatenutriprofile(HttpServletRequest request)
	{
	 ModelAndView mv = new ModelAndView();
	 
	try
	{
	    int id = Integer.parseInt(request.getParameter("id"));
	    String fullname = request.getParameter("fullname");
	    String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact =  request.getParameter("contact");
		String qualification = request.getParameter("qualifications");
		String specialization = request.getParameter("specializations");
		double experience = Double.parseDouble(request.getParameter("experience"));
		long licenseno = Long.parseLong(request.getParameter("licenseno"));
		String availablehours = request.getParameter("availablehours");
		String preferedConsultation = request.getParameter("preferedConsultation");
	   
		Nutritionist nutritionist = new Nutritionist();
		nutritionist.setId(id);
		nutritionist.setFullname(fullname);
		nutritionist.setGender(gender);
		nutritionist.setEmail(email);
		nutritionist.setPassword(password);
		nutritionist.setContact(contact);
		nutritionist.setQualifications(qualification);
		nutritionist.setSpecializations(specialization);
		nutritionist.setExperience(experience);
		nutritionist.setLicenseno(licenseno);
		nutritionist.setAvailablehours(availablehours);
		nutritionist.setPreferedConsultation(preferedConsultation);
		
		String msg = nutritionistService.NutritionistRegistration(nutritionist);
	    
	      Nutritionist nutri = nutritionistService.displaynutribyID(id);
	    		
	     HttpSession session = request.getSession();
	     session.setAttribute("nutri",nutri); 
	    mv.setViewName("nutriprofile");
	    mv.addObject("message", msg);
	  
	}
	catch(Exception e)
	{
	  mv.setViewName("updateerror");
	  mv.addObject("message",e);
	}
	  return mv;
	}
	
	@GetMapping("addresource")
	   public ModelAndView addResourcePage() {
	       ModelAndView mv = new ModelAndView("addresource"); 
	       return mv;
	   }

	   @PostMapping("insertresource")
	   public ModelAndView insertResource(HttpServletRequest request) {
	       String msg = null;

	       ModelAndView mv = new ModelAndView();
	       try {
	           // Fetch form parameters
	           String title = request.getParameter("title");
	           String description = request.getParameter("description");
	           String url = request.getParameter("url");
	           String recommendedBy = request.getParameter("recommendedBy");

	           // Create and set fields in the Resource object
	           Resource resource = new Resource();
	           resource.setTitle(title);
	           resource.setDescription(description);
	           resource.setUrl(url);
	           resource.setRecommendedBy(recommendedBy);

	           // Call service to save the resource
	           msg = nutritionistService.AddResource(resource);
	           System.out.println(msg);

	           mv.setViewName("resourcemsg"); // JSP page for displaying success message
	           mv.addObject("message", msg);

	       } catch (Exception e) {
	           msg = e.getMessage();
	           System.out.println(msg.toString());

	           mv.setViewName("resourceerror"); // JSP page for displaying error message
	           mv.addObject("message", msg);
	       }

	       return mv;
	   }
	   
	   
	   
	   
	   // Workout
	   
	   
	   @Autowired
	   private WorkoutService workService;
	   
	    
	    @GetMapping("/addworkout")
	    public ModelAndView addproductdemo()
	    {
	      ModelAndView mv = new ModelAndView("addworkout");
	      return mv;
	    }
	    
	    // enctype="multipart/form-data" is used in HTML forms to enable file uploads. 
	    // It ensures that form data, including binary files, is encoded correctly when submitted to the server. 
	   
	    @PostMapping("/insertworkout")
	    public ModelAndView insertWorkout(@RequestParam("name") String name,
	                                      @RequestParam("type") String type,
	                                      @RequestParam("equipment") String equipment,
	                                      @RequestParam("difficulty") String difficulty,
	                                      @RequestParam("instructions") String instructions,
	                                      @RequestParam("setsandrepetitions") String setsAndRepetitions,
	                                      @RequestParam("duration") String duration,
	                                      @RequestParam("url") String url,
	                                      @RequestParam("workoutimage") MultipartFile file) {
	        String msg;
	        ModelAndView mv = new ModelAndView();
	        try {
	            // Convert image file to Blob
	            byte[] bytes = file.getBytes();
	            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	            // Create Workout object and set properties
	            Workout workout = new Workout();
	            workout.setName(name);
	            workout.setType(type);
	            workout.setEquipment(equipment);
	            workout.setDifficulty(difficulty);
	            workout.setInstructions(instructions);
	            workout.setSetsandrepetitions(setsAndRepetitions);
	            workout.setDuration(duration);
	            workout.setUrl(url);
	            workout.setImage(blob);
	            workout.setRegistrationDate(new java.sql.Date(System.currentTimeMillis())); // Explicit conversion to java.sql.Date
	            // Call the service to add the workout
	            msg = workService.addWorkout(workout);
	            System.out.println(msg);

	            // Set success view
	            mv.setViewName("workoutmsg");
	            mv.addObject("message", msg);
	        } catch (Exception e) {
	            // Handle exceptions
	            msg = e.getMessage();
	            System.out.println(msg);

	            // Set error view
	            mv.setViewName("workouterror");
	            mv.addObject("message", msg);
	        }
	        return mv;
	    }



	    @GetMapping("viewallworkouts")
	    public ModelAndView viewallprodsdemo()
	    {
	      List<Workout> list = workService.ViewAllworkouts();
	      
	      ModelAndView mv = new ModelAndView("viewallworkouts");
	      
	      mv.addObject("list", list);
	      
	      return mv;
	    }
	    
	 @GetMapping("displayworkoutimage")
	 public ResponseEntity<byte[]> displayworkoutimagedemo(@RequestParam("id") int id) throws Exception
	 {
	   Workout workout = workService.ViewworkoutsByID(id);
	   byte [] imageBytes = null;
	   imageBytes = workout.getImage().getBytes(1,(int) workout.getImage().length());

	   return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	   
	 // Response Body, HTTP Status Code, Headers
	 }

	    @GetMapping("viewworkoutbyid")
	 public ModelAndView  viewworkoutbyiddemo()
	 {
	      List<Workout> list=workService.ViewAllworkouts();
	      ModelAndView mv=new ModelAndView("viewworkoutbyid");
	      mv.addObject("list",list);
	      return mv;
	 }

	    @GetMapping("adddiet")
	    public ModelAndView adddiet() {
	        ModelAndView mv = new ModelAndView("adddiet"); 
	        return mv;
	    }

	    @PostMapping("insertdiet")
	    public ModelAndView insertdiet(HttpServletRequest request) {
	        String msg = null;

	        ModelAndView mv = new ModelAndView();
	        try {
	       // Get parameters from the request
	          String dietType = request.getParameter("dietType");
	          String dietaryCustom = request.getParameter("DietaryCustom");
	          String breakfast = request.getParameter("breakfast");
	          String lunch = request.getParameter("lunch");
	          String dinner = request.getParameter("dinner");
	          String snack = request.getParameter("snack");

	          // Create and set fields in the Resource object
	          Dietary resource = new Dietary();
	          resource.setDietType(dietType);
	          resource.setDietaryCustom(dietaryCustom);
	          resource.setBreakfast(breakfast);
	          resource.setLunch(lunch);
	          resource.setDinner(dinner);
	          resource.setSnack(snack);


	            // Call service to save the resource
	            msg = nutritionistService.Adddiet(resource);
	            System.out.println(msg);

	            mv.setViewName("adddiet"); // JSP page for displaying success message
	            mv.addObject("message", msg);

	        } catch (Exception e) {
	            msg = e.getMessage();
	            System.out.println(msg.toString());

	            mv.setViewName("producterror"); // JSP page for displaying error message
	            mv.addObject("message", msg);
	        }

	        return mv;
	    }
	    
	    @GetMapping("viewalldietplan")
	    public ModelAndView viewalldietplan()
	    {
	      List<Dietary> lists = nutritionistService.ViewAlldiet();
	      
	      ModelAndView mv = new ModelAndView("viewalldietplan");
	      
	      mv.addObject("lists", lists);
	      
	      return mv;
	    }


	    
}
