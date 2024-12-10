package com.jfsd.sdp.controller;

import java.sql.Date;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jfsd.sdp.model.DailyTrackerEntry;
import com.jfsd.sdp.model.Dietary;
import com.jfsd.sdp.model.NutriProfile;
import com.jfsd.sdp.model.Recipe;
import com.jfsd.sdp.model.Resource;
import com.jfsd.sdp.model.User;
import com.jfsd.sdp.model.Workout;
import com.jfsd.sdp.repository.DailyTrackerRepository;
import com.jfsd.sdp.service.DietaryService;
import com.jfsd.sdp.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/api/form")
//@CrossOrigin(origins = "http://localhost:8080") 
public class UserController
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private DailyTrackerRepository dailyTrackerRepository;
	
	@Autowired
	private DietaryService dietaryService; 
	
	
	@PostMapping("/submit")
    public ResponseEntity<String> submitProfile(@RequestBody NutriProfile profile) {
        NutriProfile savedProfile = userService.nutriprofileregistration(profile);
        return ResponseEntity.ok("Profile saved successfully with ID: " + savedProfile.getId());
    }
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	
	@GetMapping("user")
	public ModelAndView userreg()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userregistration");
		return mv;
	}
	
	@GetMapping("bmicalculator")
	public ModelAndView bmi()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bmicaculator");
		return mv;
	}
	
	@GetMapping("form")
	public ModelAndView form()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form");
		return mv;
	}

	@GetMapping("login")
	  public ModelAndView emplogin()
	  {
	    ModelAndView mv= new ModelAndView();
	    mv.setViewName("userlogin");
	    return mv;
	  }
	
	@PostMapping("insertuser")
	public ModelAndView insertUser(@RequestParam("uname") String name,
	                               @RequestParam("ugender") String gender,
	                               @RequestParam("uage") double age,
	                               @RequestParam("uemail") String email,
	                               @RequestParam("upassword") String password,
	                               @RequestParam("ucontact") String contact,
	                               @RequestParam("ulocation") String location) {

		
		
	    // Create the User object and set the properties
	    User user = new User();
	    user.setName(name);
	    user.setGender(gender);
	    user.setAge(age);
	    user.setEmail(email);
	    user.setPassword(password);
	    user.setContact(contact);
	    user.setLocation(location);
	    user.setRegistrationDate(new Date(System.currentTimeMillis())); // Set registration date
	    

	    // Call the service to register the user
	    String msg = userService.UserRegistration(user);

	    // Return success view
	    return new ModelAndView("regsuccess");
	}
	
//@PostMapping("insertprofile")
//	
//	public ModelAndView insertprofile(HttpServletRequest request)
//	{
//		double height = Double.parseDouble(request.getParameter("height"));
//		double weight = Double.parseDouble(request.getParameter("weight"));
//		String HealthConditions = request.getParameter("healthCondition");
//		String Supplements = request.getParameter("supplements"); 
//		String DietType = request.getParameter("dietType");
//		String Allergies = request.getParameter("allergies");
//		String Goal = request.getParameter("goal");
//		
//		
//		
//		NutriProfile profile = new NutriProfile();
//		profile.setHeight(height);
//		profile.setWeight(weight);
//		profile.setHealthCondition(HealthConditions);
//		profile.setSupplements(Supplements);
//		profile.setDietType(DietType);
//		profile.setAllergies(Allergies);
//		profile.setGoal(Goal);
//	   
//		
//		
//		String msg = userService.nutriprofileregistration(profile);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("regsuccess");
//		
//		return mv;
//		
//	}
	
@PostMapping("checkuserlogin")
@ResponseBody
public ModelAndView checkuserlogin(HttpServletRequest request)
{
	ModelAndView mv = new ModelAndView();
	String uemail = request.getParameter("uemail");
	String upassword = request.getParameter("upassword");
	
	User user = userService.checkuserlogin(uemail, upassword);
	if(user!=null)
	{
		HttpSession session = request.getSession();
    	session.setAttribute("buyer",user);
    	//session.setMaxInactiveInterval(10);
		mv.setViewName("userhome");
	}
	else
	{
		mv.setViewName("userlogin");
		mv.addObject("message","Login Failed!");
	}
	return mv;
}

@GetMapping("userhome")
public ModelAndView userhome()
{
  ModelAndView mv=new ModelAndView();
  mv.setViewName("userhome");
  return mv;
}


@GetMapping("userlogout")
public ModelAndView userlogout(HttpServletRequest request)
{
	  HttpSession session = request.getSession();
	  
	 
      ModelAndView mv=new ModelAndView();
      mv.setViewName("userlogin");
      return mv;
}

@GetMapping("usersessionexpiry")
public ModelAndView usersessionexpiry()
{
  ModelAndView mv=new ModelAndView();
  mv.setViewName("usersessionexpiry");
  return mv;
}

@GetMapping("userprofile")
public ModelAndView userprofile()
{
  ModelAndView mv=new ModelAndView();
  mv.setViewName("userprofile");
  return mv;
}



@PostMapping("updateuserprofile")
public ModelAndView updateuserprofile(HttpServletRequest request)
{
 ModelAndView mv = new ModelAndView();
 
try
{
    int id = Integer.parseInt(request.getParameter("uid"));
    String name = request.getParameter("uname");
  String gender = request.getParameter("ugender");
  String age = request.getParameter("uage");
  String email = request.getParameter("uemail");
  String password = request.getParameter("upassword");
  String contact = request.getParameter("ucontact");
  String location = request.getParameter("ulocation");
  
    User user = new User();
    user.setId(id);
    user.setName(name);
    user.setGender(gender);
    user.setAge(id);
    user.setEmail(email);
    user.setPassword(password);
    user.setContact(contact);
    user.setLocation(location);
    
    String msg = userService.updateUserProfile(user);
    
    User u = userService.displayUserbyID(id);
    		
     HttpSession session = request.getSession();
     session.setAttribute("buyer",u); //employee is session variable
   
   
    mv.setViewName("userprofile");
    mv.addObject("message", msg);
  
}
catch(Exception e)
{
  mv.setViewName("updateerror");
  mv.addObject("message", e);
}
  return mv;
}

@GetMapping("/viewallrecipe")
public ModelAndView viewallrecipedemo()
{
  List<Recipe> recipelist = userService.ViewAllRecipe();
  
  ModelAndView mv = new ModelAndView("viewallrecipe");
  
  mv.addObject("recipelist",recipelist);
  
  return mv;
}

@GetMapping("displayrecipeimage")
public ResponseEntity<byte[]> displayprodimagedemo(@RequestParam("id") int id) throws Exception
{
Recipe recipe =  userService.ViewRecipeByID(id);
byte [] imageBytes = null;
imageBytes = recipe.getImage().getBytes(1,(int) recipe.getImage().length());

return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

//Response Body, HTTP Status Code, Headers
}
@GetMapping("viewrecipebyid")
public ModelAndView  viewrecipebyiddemo()
{
  List<Recipe> recipelist=userService.ViewAllRecipe();
  ModelAndView mv=new ModelAndView("viewrecipebyid");
  mv.addObject("recipelist",recipelist);
  return mv;
}


@GetMapping("/dailytracker")
public String showDailyTracker(Model m) {
    m.addAttribute("dailyTrackerEntry", new DailyTrackerEntry());
    return "DailyTracker"; // This maps to /WEB-INF/jsp/DailyTracker.jsp
}

@PostMapping("/savedailytracker")
public String saveDailyTracker(@ModelAttribute DailyTrackerEntry dailyTrackerEntry, Model model) {
    String message = userService.adddailytracker(dailyTrackerEntry);
    model.addAttribute("message", message);
    return "DailyTrackerSuccess"; // Redirects to a success page
}

@GetMapping("/viewdailytracker")
public String showDailyTrackerViewPage() {
    return "ViewDailyTracker"; // JSP page for the date search form
}

@PostMapping("/fetchdailytracker")
public String fetchDailyTrackerEntry(
        @RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
        RedirectAttributes redirectAttributes) {
    
    Optional<DailyTrackerEntry> entry = dailyTrackerRepository.findByDate(date);
    
    redirectAttributes.addFlashAttribute("date", date);
    redirectAttributes.addFlashAttribute("entry", entry.orElse(null));
    
    // Redirect to a GET endpoint
    return "redirect:/viewdailytracker";
}

@GetMapping("viewallresource")
public ModelAndView viewallresource()
{
  List<Resource> list = userService.ViewAllResource();
  
  ModelAndView mv = new ModelAndView("viewallresource");
  
  mv.addObject("list", list);
  
  return mv;
}


@Autowired		
private JavaMailSender mailSender;
@PostMapping("sendemail")
public ModelAndView sendEmail(HttpServletRequest request) throws Exception
{
String name = request.getParameter("name");
String toemail = request.getParameter("email");
String subject = request.getParameter("subject");
String msg = request.getParameter("message");
MimeMessage mimeMessage = mailSender.createMimeMessage();
MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

int otp = (int)(Math.random() * 99999); // random number generation
helper.setTo(toemail);
helper.setSubject(subject);
helper.setFrom("nutrifine23@gmail.com");
String htmlContent =
"<h3>Contact Form Details</h3>" +
"<p><strong>Name:</strong> " + name + "</p>" +
"<p><strong>Email:</strong> " + toemail + "</p>" +
"<p><strong>Subject:</strong> " + subject + "</p>" +
"<p><strong>Message:</strong> " + msg + "</p>" +
"<p><strong>OTP:</strong> " + otp + "</p>";
helper.setText(htmlContent, true);
mailSender.send(mimeMessage);

ModelAndView mv = new ModelAndView("mailsuccess");
mv.addObject("message", "Email Sent Successfully");
return mv;
}



}
