<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In Page</title>
<link rel="stylesheet" href="/resources/css/user/login.css">
</head>
<body>
    <form action="/user/login" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="cid" id="exampleFormControlInput1" placeholder=" ">
            <label for="exampleFormControlInput1" class="form-label">Please Enter your ID</label>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="cpw" id="exampleFormControlInput2" placeholder=" ">
            <label for="exampleFormControlInput2" class="form-label">Please Enter your PW</label>
        </div>
        <button type="submit" class="btn btn-dark">Log In</button>
    </form>
</body>
</html>