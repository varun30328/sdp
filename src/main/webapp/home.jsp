<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
</head>
<body>
<br>
<br>
<%@include file="mainnavbar.jsp" %>
<section id="home" class="hero">
        <div class="overlay">
           
        </div>
    </section>

    <main>
        <section id="start-here" class="content">
    <h2>ABOUT US</h2>
    <P>
     Nutrifine is an innovative and user-centric nutrition web app that serves as a comprehensive platform to help individuals achieve their 
     unique health and wellness goals.
     Designed with accessibility, personalization, and ease-of-use in mind, Nutrifine integrates
     a host of features that make nutrition tracking, meal planning, and goal-setting a seamless experience.
     Whether you are aiming to lose weight, build muscle, maintain a balanced diet, 
     or simply track your daily intake, Nutrifine provides the tools and guidance needed to 
     reach those objectives effectively.
     </p>
     <br>
     <h2>Personalized User Profiles</h2>
<p>
Each user begins by creating a personalized profile, where they can input essential details
such as age, gender, height, weight, activity level, and dietary preferences.
Based on this information, Nutrifine calculates recommended daily nutritional goals, 
including calorie intake and macro distribution (carbohydrates, proteins, fats), 
adapting recommendations to reflect each user’s health objectives, such as weight loss, muscle gain,
 or general wellness.
 </p>
 <br>
 <h2>Data Privacy and Security</h2>
<p>
Recognizing the sensitive nature of personal health data, Nutrifine takes 
data privacy and security seriously. The app employs robust encryption standards 
to protect user information and complies with all relevant data privacy regulations.
Users can trust that their data is secure and used solely to improve their experience and 
help them reach their goals.
</p>
<br>
<h2>User-Friendly Interface</h2>
<p>
Nutrifine is designed with a clean, intuitive interface that makes navigating the app effortless. 
Even users who are new to digital health tools will find it easy to set up their profile, 
log meals, browse recipes, and track progress. The app’s visually appealing dashboard offers a snapshot of
 daily nutrition, with simple icons, progress bars, and color-coded charts for quick insights at a glance.
</p>
<br> 
<p>
Nutrifine is a powerful, all-in-one nutrition app that caters to individuals who want a more informed, 
data-driven approach to wellness. By combining a wide range of features—meal logging, 
recipe recommendations, progress tracking, and community support—Nutrifine empowers users to take 
control of their health and make nutrition an enjoyable, sustainable part of their lifestyle.
</p>
<br><br/>  
            <h2>Start Here</h2>
            <p>Nutrifine is designed to empower you with personalized nutrition plans tailored to your health goals. Whether you're aiming to lose weight, gain muscle, or improve your overall well-being, we’ve got you covered.</p>
            <div class="button-container">
                <button class="start-button"><a href="userlogin.jsp">Start Now</a></button>
            </div>
        </section>
       
        <!-- Left Image, Right Content Section -->
        <section class="parallax-section">
            <div class="parallax-content">
                <img src="./images/home2.png" alt="Nutrifine Benefits">
                <div>
                    <h2>Discover the Benefits</h2>
                    <p>A simple nutrition website can be very helpful for both users and businesses. For users, it provides easy access to important health and diet information through a simple design, making it quick to find tips and guides on healthy eating. These sites often have features that let users input basic health details to get personalized meal suggestions or track their nutrient intake. This helps users learn about their eating habits and identify any missing nutrients. For businesses, a simple website is cheaper and easier to build and maintain compared to more complex platforms. Interactive features, like calculators and quizzes, can keep users engaged, while community areas such as comment sections can help users share advice and support each other. Over time, visiting these sites can encourage users to make healthier choices. The website can also gather anonymous feedback, helping businesses learn more about what people need and improve their content. Good content can attract more visitors through search engines, creating more chances to earn money through ads or partnerships. Starting simple means the site can grow over time, adding new features like recipe videos or expert advice services. In short, a simple nutrition website is a great way to spread health information, support users, and help businesses grow.</p>
                </div>
            </div>
        </section>

        <!-- Right Image, Left Content Section -->
        <section class="parallax-section">
            <div class="parallax-content reverse">
                <div>
                    <h2>Why Choose Nutrifine?</h2>
                    <p>Nutrifine is your all-in-one solution for personalized nutrition, combining expert advice with modern tracking tools to ensure your success.</p>
                </div>
                <img src="./images/home1.png" alt="Healthy Choices">
            </div>
        </section>

        <!-- Image Gallery Section -->
        <section class="image-gallery">
            <h2>Explore More</h2>
            <div class="gallery">
                
                <img src="./images/footer1.jpg" alt="Balanced Diet" >
                <img src="./images/footer2.jpg" alt="Healthy Lifestyle">
                <img src="./images/footer3.jpg" alt="Nutritious Food">
            </div>
        </section>
    </main>

    <footer>
        <p>© 2024 Nutrifine. All Rights Reserved.</p>
    </footer>
</body>

</body>
</html>