<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JamesEdition | The World's Luxury Marketplace</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a533d3691d.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-1.11.0.min.js"></script>
	<script src="login.js"></script>
</head>

<body onload="javascript:window_onload()">
<div class="container-logo">
        <div class="navbar">
            <div class="logo">
                <a href="../main.jsp"><img src="../images2/logo3.png" width="180px" height="50px" alt="로고"></a>
            </div>
            <nav>
                <ul id="MenuItems">
                    <li><a href="allproduct/allproduct-1.html">All products</a></li>
                    <li><a href="real_estate/real_estate-1.html">Real Estate</a></li>
                    <li><a href="car/car-1.html">Cars</a></li>
                    <li><a href="yacht/yacht-1.html">Yachts</a></li>
                    <li><a href="jet/jet-1.html">Jets</a></li>
                </ul>
            </nav>
            <a href="contact.html" class="menu-r">Contact</a>
            <a href="loginForm.jsp" class="menu-r">Account</a>
            <a href="cart.html"><img src="../images2/bookmark-regular.svg" width="40px" height="30px"></a>
            <img src="../images/menu.png" class="menu-icon" onclick="menutoggle()">
        </div>   
    </div>
<%
String id ="";
try{
	//id세션 속성의 값을 얻어내서 id변수에 저장
	//인증된 사용자의 경우  id세션 속성의 값 null또는 공백이 아님
	id = (String)session.getAttribute("id");
%>

<%if(id == null || id.equals("")){ //인증되지 않은 사용자 영역%>

 <div class="account-page">
    <div class="container">
        <div class="row">
            <div class="col-2">
                <img src="../images2/image1.png" width="100%">
            </div>
            <div class="col-2">
                <div class="form-container">
                <div id="status">
                    <form id="LoginForm">
                        <input id="id" name="id" size="20" maxlength="50" type="email" placeholder="example@kings.com">
                        <input id="passwd" name="passwd" size="20" type="password" placeholder="6~16자 Password" maxlength="16">
                        <button id="login" class="btn" >Login</button>
                        <button id="register" class="btn" >Register</button>
                    </form>
                   </div>
                </div>
            </div>
        </div>
    </div>
 </div>

<%}else{//인증된 사용자 영역%>	
<div class="container">
    <div class="row">
	  <div class="col-2">
         <img src="../images2/image1.png" width="100%">
      </div> 
	  <div id="status">
	     <ul class="b">
	        
	        <form id="LogoutForm">
	        <li class="c"><b><%=id %></b>님이 로그인 하셨습니다.
		        <li class="label2">
			        <button id="logout" class="btn">로그아웃</button>
			        <button id="update" class="btn">회원 정보 변경</button>
	         </form>
	     </ul>
	  </div>
	</div>
</div>

<%}}catch(Exception e){e.printStackTrace();}%>

<div class="footer">
        <div class="contatiner">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Download Our App</h3>
                    <p>Download App for Android and ios mobile phone.</p>
                    <div class="app-logo">
                        <img src="../images/play-store.png">
                        <img src="../images/app-store.png">
                    </div>
                </div>
                <div class="footer-col-2">
                    <img src="../images2/logo2.png">
                    <p>Hight Quality pictures, all the information you need, and a number to contact in case of interest. Also a very user-friendly and easy site to navigate.</p>
                </div>
                <div class="footer-col-3">
                    <h3>FOR BUSINESS</h3>
                    <ul>
                        <li>List With Us</li>
                        <li>Partner</li>
                        <li>Linking</li>
                        <li>Help & FAQ</li>
                    </ul>
                </div>
                <div class="footer-col-3">
                    <h3>Follow us</h3>
                    <ul>
                        <li>Facebook</li>
                        <li>Twitter</li>
                        <li>Instagram</li>
                        <li>Youtube</li>
                    </ul>
                </div>
            </div>
            <hr>
            <p class="copyright">Copyright &copy; 2022 - 김태형</p>
        </div>
   </div>
   
   <script>
        var MenuItems = document.getElementById("MenuItems");

        MenuItems.style.maxHeight = "0px";

        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                 } 
            else 
                {
                MenuItems.style.maxHeight = "0px";
                }
        }
    </script>
    

    
</body>
</html>