<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Nutritiosinists</title>
<link rel="stylesheet" type="text/css" href="viewusers.css">
 <style>
    body
{
    background-image:url("images/imageb.jpg");
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
}
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
    <div class="dashboard-container">
        <h1>View All Health Specialists</h1>
           <div class="user-cards">
            <c:forEach items="${nutrilist}" var="nutri">
            <div class="user-card">
              <div class="user-info">
            <h2><c:out value="${nutri.fullname}"/></h2>
             <p>ID: <c:out value="${nutri.id}"/></p>
              <p>Gender: <c:out value="${nutri.gender}"/></p>
               <p>E-mail: <c:out value="${nutri.email}"/></p>
                <p>Password: <c:out value="${nutri.password}"/></p>
                 <p>Qualifications: <c:out value="${nutri.qualifications}"/></p>
                  <p>Specializations: <c:out value="${nutri.specializations}"/></p>
                   <p>Experience: <c:out value="${nutri.experience}"/></p>
                    <p>LicenseNo: <c:out value="${nutri.licenseno}"/></p>
                     <p>Availablehours: <c:out value="${nutri.availablehours}"/></p>
                       <p>PreferedConsultation: <c:out value="${nutri.preferedConsultation}"/></p>
             </div>
                 <div class="user-actions">
                      <button class="delete-btn"><a href='<c:url value="deletenutri?id=${nutri.id}"></c:url>'>Delete</a></button> 
                   </div>
            </div> 
            </c:forEach>
           </div>
        </div>
</body>
</html>