<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Users</title>
    <style>
    body
{
    background-image:url("images/imageb.jpg");
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    height: 80vh;
}
    </style>
    <link rel="stylesheet" type="text/css" href="viewusers.css">
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <div class="dashboard-container">
        <h1>View All Users</h1>
        <div class="user-cards">
            <c:forEach items="${userlist}" var="user">
                <div class="user-card">
                    <div class="user-info">
                        <h2><c:out value="${user.name}"/></h2>
                        <p>ID: <c:out value="${user.id}"/></p>
                        <p>Gender: <c:out value="${user.gender}"/></p>
                        <p>Age: <c:out value="${user.age}"/></p>
                        <p>Email: <c:out value="${user.email}"/></p>
                        <p>Contact: <c:out value="${user.contact}"/></p>
                        <p>Location: <c:out value="${user.location}"/></p>
                    </div>
                    <div class="user-actions">
                      <button class="delete-btn"><a href='<c:url value="delete?id=${user.id}"></c:url>'>Delete</a></button> 
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
