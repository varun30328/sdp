<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BMI Calculator</title>
  <link data-asynced="1" as="style" onload="this.onload=null;this.rel='stylesheet'"  rel="preload" href="style.css">
</head>
    <%@include file="usernavbar.jsp" %>

<style>
 * {
    padding: 0;
    margin: 0;
    font-family: 'Times New Roman', Times, serif;
    font-size: 22px; /* Ensure consistent font size */
   }
body {
 font-family: 'Times New Roman', Times, serif;
    font-size: 22px;
    background: url(https://images.unsplash.com/photo-1495195129352-aeb325a55b65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1776&q=80);
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    height: auto;
}

.container {
  width: 500px;
  margin: 60px auto;
  background: #ffffff;
  padding: 30px;
  border-radius: 30px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  text-align: center;
}

h3 {
  color: #333;
}

.input-container {
  margin-bottom: 10px;
  text-align: center;
}

input[type="number"], select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

button {
  background-color: maroon;
  color: #fff;
  border: thick;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 20px;
}

#result {
  margin-top: 20px;
  font-weight: bold;
}
</style>

<body>
<br><br><br>
  <div class="container">
    <h3>BMI Calculator</h3>
    <div class="input-container">
      <label for="height">Height (cm):</label>
      <input type="number" id="height" placeholder="Enter your height in cm">
    </div>
    <div class="input-container">
      <label for="weight">Weight (kg):</label>
      <input type="number" id="weight" placeholder="Enter your weight in kg">
    </div>
    <div class="input-container">
      <label for="age">Age:</label>
      <input type="number" id="age" placeholder="Enter your age">
    </div>
    <div class="input-container">
      <label for="gender">Gender:</label>
      <select id="gender">
              <option value="select">---select---</option>
      
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
      </select>
    </div>
    <button onclick="calculateBMI()">Calculate BMI</button>
    <div id="result"></div>
  </div>
  <br><br><br> <br><br><br> <br><br><br>

  <!-- JavaScript for calculating BMI -->
  <script>
    function calculateBMI() {
      var heightInput = document.getElementById("height");
      var weightInput = document.getElementById("weight");
      var ageInput = document.getElementById("age");
      var genderInput = document.getElementById("gender");
      var resultDiv = document.getElementById("result");

      var height = parseFloat(heightInput.value);
      var weight = parseFloat(weightInput.value);
      var age = parseInt(ageInput.value);
      var gender = genderInput.value;

      if (isNaN(height) || isNaN(weight) || isNaN(age)) {
        resultDiv.innerHTML = "Please enter valid height, weight, and age.";
        return;
      }

      var bmi = weight / ((height / 100) ** 2);
      var category = "";

      if (bmi < 18.5) {
        category = "Underweight";
      } else if (bmi < 25) {
        category = "Normal weight";
      } else if (bmi < 30) {
        category = "Overweight";
      } else {
        category = "Obese";
      }

      var ageMessage = (age < 18) ? "Note: BMI may not be accurate for people under 18." : "";

      resultDiv.innerHTML = "Your BMI is " + bmi.toFixed(2) + " (" + category + ")<br>" + ageMessage;
    }
  </script>

  <!-- Lazy Load Scripts -->
  <script type="litespeed/javascript" data-src="script.js"></script>
  <script data-no-optimize="1">!function(t,e){"object"==typeof exports&&"undefined"!=typeof module?module.exports=e():"function"==typeof define&&define.amd?define(e):(t="undefined"!=typeof globalThis?globalThis:t||self).LazyLoad=e()}(this,function(){"use strict";function e(){return(e=Object.assign||function(t){for(var e=1;e<arguments.length;e++){var n,a=arguments[e];for(n in a)Object.prototype.hasOwnProperty.call(a,n)&&(t[n]=a[n])}return t}).apply(this,arguments)}function i(t){return e({},it,t)}function o(t,e){var n,a="LazyLoad::Initialized",i=new t(e);try{n=new CustomEvent(a,{detail:{instance:i}})}catch(t){(n=document.createEvent("CustomEvent")).initCustomEvent(a,!1,!1,{instance:i})}window.dispatchEvent(n)}function l(t,e){return t.getAttribute(gt+e)}function c(t){return l(t,bt)}function s(t,e){return function(t,e,n){e=gt+e;null!==n?t.setAttribute(e,n):t.removeAttribute(e)}(t,bt,e)}function r(t){return s(t,null),0}function u(t){return null===c(t)}function d(t){return c(t)===vt}function f(t,e,n,a){t&&(void 0===a?void 0===n?t(e):t(e,n):t(e,n,a))}function _(t,e){nt?t.classList.add(e):t.className+=(t.className?" ":"")+e}function v(t,e){nt?t.classList.remove(e):t.className=t.className.replace(new RegExp("(^|\\s+)"+e+"(\\s+|$)")," ").replace(/^\s+/,"").replace(/\s+$/,"")}function g(t){return t.llTempImage}function b(t,e){!e||(e=e._observer)&&e.unobserve(t)}function p(t,e){t&&(t.loadingCount+=e)}function h(t,e){t&&(t.toLoadCount=e)}function n(t){for(var e,n=[],a=0;e=t.children[a];a+=1)"SOURCE"===e.tagName&&n.push(e);return n}function m(t,e){(t=t.parentNode)&&"PICTURE"===t.tagName&&n(t).forEach(e)}function a(t,e){n(t).forEach(e)}function E(t){return!!t[st]}function I(t){return t[st]}function y(t){return delete t[st]}function A(e,t){var n;E(e)||(n={},t.forEach(function(t){n[t]=e.getAttribute(t)}),e[st]=n)}function k(a,t){var i;E(a)&&(i=I(a),t.forEach(function(t){var e,n;e=a,(t=i[n=t])?e.setAttribute(n,t):e.removeAttribute(n)}))}function L(t,e,n){_(t,e.class_loading),s(t,ut),n&&(p(n,1),f(e.callback_loading,t,n))}function w(t,e,n){n&&t.setAttribute(e,n)}function x(t,e){w(t,ct,l(t,e.data_sizes)),w(t,rt,l(t,e.data_srcset)),w(t,ot,l(t,e.data_src))}function O(t,e,n){var a=l(t,e.data_bg_multi),i=l(t,e.data_bg_multi_hidpi);(a=at&&i?i:a)&&(t.style.backgroundImage=a,n=n,_(t=t,(e=e).class_applied),s(t,ft),n&&(e.unobserve_completed&&b(t,e),f(e.callback_applied,t,n)))} function N(t,e){!e||0<e.loadingCount||0<e.toLoadCount||f(t.callback_finish,e)} function C(t,e,n){t.addEventListener(e,n),t.llEvLisnrs[e]=n} function M(t){return!!t.llEvLisnrs} function z(t){if(M(t)){var e,n,a=t.llEvLisnrs;for(e in a){var i=a[e];n=e,i=i,t.removeEventListener(n,i)}delete t.llEvLisnrs}} function R(t,e,n){var a;delete t.llTempImage,p(n,-1),(a=n)&&--a.toLoadCount,v(t,e.class_loading),e.unobserve_completed&&b(t,n)} function T(o,r,c){var l=g(o)||o;M(l)||function(t,e,n){M(t)||(t.llEvLisnrs={});var a="VIDEO"===
