<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="usernavbar.jsp" %>
<link rel="stylesheet" href="contact.css" />
<style>
 * {
            padding: 0;
            margin: 0;
            font-family: 'Times New Roman', Times, serif;
            font-size: 22px;
        }

        body {
            background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 10px;
        }
h3 {
  color: white;
  text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
  padding-top: 20px;
}
</style>
</head>
<body>
 <h3 align="center">Contact Us</h3>
<!-- 
  ****************************************
  Contest Entry for Treehouse:
  "Design a Contact Form"
  Submitted by Lisa Wagner
  ****************************************
-->
<br/><br/>
<div id="contact-form">
  <div>
 
    <h1>Nice to Meet You!</h1> 
    <h4>Have a question or just want to get in touch? Let's chat.</h4> 
  </div>
    <p id="failure">Oopsie...message not sent.</p>  
    <p id="success">Your message was sent successfully. Thank you!</p>

       <form method="post" action="sendemail">
      <div>
          <label for="name">
            <span class="required">Name: *</span> 
            <input type="text" id="name" name="name" value="" placeholder="Your Name" required="required" tabindex="1" autofocus="autofocus" />
          </label> 
      </div>
      <div>
          <label for="email">
            <span class="required">Email: *</span>
            <input type="email" id="email" name="email" value="" placeholder="Your Email" tabindex="2" required="required" />
          </label>  
      </div>
      
      <div>
          <label for="subject">
            <span class="required">Subject: *</span>
            <input type="subject" id="subject" name="subject" value="" placeholder="please enter subject" tabindex="2" required="required" />
          </label>  
      </div>
       
      <div>             
          <label for="message">
            <span class="required">Message: *</span> 
            <textarea id="message" name="message" placeholder="Please write your message here." tabindex="5" required="required"></textarea> 
          </label>  
      </div>
      <div>              
          <input type="submit" value="Send"/>
                        <input type="reset" value="Clear"/>
      </div>
       </form>

  </div>
</body>
</html>