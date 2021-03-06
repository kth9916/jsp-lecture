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
<body onload="slider()">
    <div class="header" >
        <div class="container-logo">
            <div class="navbar">
                <div class="logo">
                    <a href="./mainpage.jsp"><img src="../images2/logo3.png" width="180px" height="50px" alt="로고"></a>
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
                
        <% 
        String id = "";
        	try{
        		id = (String)session.getAttribute("id");
        %>
        <%if(id == null || id.equals("")){ //인증되지 않은 사용자 영역%>
         	<div id="status">
         		<ul class="c">
                    <form id="MainLoginForm">
                        <input id="id" name="id" size="40" maxlength="50" type="email" placeholder="ID(email)">
                        <input id="passwd" name="passwd" size="40" type="password" placeholder="6~16자 Password" maxlength="16">
                        <button id="login" class="btn2" >Login</button>
                        <button id="register" class="btn2" >Register</button>
                    </form>
                 </ul>
             </div>
        <%}else{//인증된 사용자 영역%>	
       <div id="status">
	     <ul class="c">
	        
	        <form id="MainLogoutForm">
	        <li class="out1"><b><%=id %></b>님</li>
		        <li class="label2">
			        <button id="logout" class="btn3">로그아웃</button>
			        <button id="update" class="btn3">회원 정보변경</button>
			     </li>
	         </form>
	     </ul>
	  </div>
    <%}}catch(Exception e){e.printStackTrace();}%>
    
    
    
                <a href="contact.html" class="menu-r">Contact</a>
                <a href="./loginForm.jsp" class="menu-r">Account</a>
                <a href="cart.html"><img src="../images2/bookmark-regular.svg" width="40px" height="30px"></a>
                <img src="../images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>   
        </div>
        
        <div class="banner">
            <div class="slider">
                <img src="../../images2/highest home.jpg" id="slideImg">
            </div>
            <div class="overlay">
                <div class="banner-content">
                    <h1>The World's Luxury Market</h1>
                    <h3>당신이 위대함을 추구한다면, 그 원대한 목적지로 삼을 수 있는 곳을 제공합니다.</h3>
                    <div class="container-search">
                        <a href="allproduct/allproduct-1.html"><button type="button">더 보기</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!--------- featured categories ------------>    

    <div class="categories">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <a href="real_estate/real_estate-1.html"><img src="../images2/category-1.jpg"></a>
                    <a href="real_estate/real_estate-1.html"><h2>Real Estate</h2></a>
                </div>
                <div class="col-3">
                    <a href="car/car-1.html"><img src="../images2/category-2.jpg"></a>
                    <a href="car/car-1.html"><h2>Cars</h2></a>
                </div>
                <div class="col-3">
                    <a href="yacht/yacht-1.html"><img src="../images2/category-3.jpg"></a>
                    <a href="yacht/yacht-1.html"><h2>Yachts</h2></a>
                </div>
                <div class="col-3">
                    <a href="jet/jet-1.html"><img src="../images2/category-4.jpg"></a>
                    <a href="jet/jet-1.html"><h2>Jets</h2></a>
                </div>
            </div>
        </div>
    </div>
<!--------- featured products ------------>
    <div class="small-container">
        <h1 class="title">Popular Products</h1>
        <div class="row">
            <div class="col-4">
                <a href="product/product-1.html"><img src="../images2/수정됨_product-1.webp"></a>
                <a href="product/product-1.html"><h4>The Art Luxury Villa With 5 Bedrooms</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star-half-stroke"></i>
                </div>
                <p>₩7,381,888,729</p>
            </div>
            <div class="col-4">
                <a href="product/product-2.html"><img src="../images2/product-2.jpg"></a>
                <a href="product/product-2.html"><h4>2023 Bugatti Centodieci</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half-stroke"></i>
                </div>
                <p>₩16,777,019,840</p>
            </div>
            <div class="col-4">
                <a href="product/product-3.html"><img src="../images2/수정됨_product-3.webp"></a>
                <a href="product/product-3.html"><h4>Delta Gregory C Marshall 63m NFT</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </div>
                <p>₩111,599,538,655</p>
            </div>
            <div class="col-4">
                <a href="product/product-4.html"><img src="../images2/수정됨_product-4.webp"></a>
                <a href="product/product-4.html"><h4>2010 Legacy 650</h4></a>
                <div class="rating">
                    <i class="fa-regular fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>Price On Request</p>
            </div>
        </div>
        <h1 class="title">New & Trending</h1>
        <div class="row">
            <div class="col-4">
                <a href="product/product-5.html"><img src="../images2/수정됨_product-5.webp"></a>
                <a href="product/product-5.html"><h4>Vivre Lake Deux Montagnes</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>₩14,367,096,062</p>
            </div>
            <div class="col-4">
                <a href="product/product-6.html"><img src="../images2/수정됨_product-6.webp"></a>
                <a href="product/product-6.html"><h4>Antilopvägen 13</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half-stroke"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>₩3,874,937,263</p>
            </div>
            <div class="col-4">
                <a href="product/product-7.html"><img src="../images2/수정됨_product-7.webp"></a>
                <a href="product/product-7.html"><h4>Il Sogno The Dream</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half-stroke"></i>
                </div>
                <p>₩48,065,071,335</p>
            </div>
            <div class="col-4">
                <a href="product/product-8.html"><img src="../images2/수정됨_product-8.webp"></a>
               <a href="product/product-8.html"><h4>A Completed Resort in Virgin Island</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>₩79,094,421,185</p>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <a href="product/product-9.html"><img src="../images2/수정됨_product-9.webp"></a>
                <a href="product/product-9.html"><h4>Magnificent Historical Villa</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>₩7,784,537,205</p>
            </div>
            <div class="col-4">
                <a href="product/product-10.html"><img src="../images2/수정됨_product-10.webp"></a>
                <a href="product/product-10.html"><h4>Alia</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half-stroke"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>₩9,395,131,110</p>
            </div>
            <div class="col-4">
                <a href="product/product-11.html"><img src="../images2/수정됨_product-11.webp"></a>
                <a href="product/product-11.html"><h4>An Architectural Delight In The Innovation</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half-stroke"></i>
                </div>
                <p>₩9,046,169,097</p>
            </div>
            <div class="col-4">
                <a href="product/product-12.html"><img src="../images2/수정됨_product-12.webp"></a>
                <a href="product/product-12.html"><h4>Namur I Castle Of Ostemerée</h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p>₩7,381,888,729</p>
            </div>
        </div>
    </div>
<!----------- offer ----------- -->
    <div class="offer">
        <div class="small-container">
            <div class="row">
                <div class="col-2">
                    <img src="../images2/exculsive3.png" class="offer-img">
                </div>
                <div class="col-2">
                    <p style="font-weight: bold;font-size: large;" >세상에서 가장 가치 있는 것을 모아 놓은 곳</p>
                    <h1>JamesEdition</h1>
                    <h4>앞만 보고 몰두하며 달려 드디어 꼭대기가 보인다고 느껴졌을 때<br> 정신 없이 달려왔던 다리 <br> 무거운 짐을 지느라 축처진 어깨<br>땀에 흠뻑 젖어 있는 자신에게 트로피를 선물하세요<h4>
                    <a href="" class="btn">선물하기 &nbsp;&#8594;</a>
                </div>
            </div>
        </div>
    </div>

<!-- ------ testimonial ------- -->
    <div class="testimonial">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <i class="fa-solid fa-quote-left"></i>
                    <p>인생에서 공짜로 얻은 건 하나도 없다. 드리블, 슈팅, 컨디션, 부상 방지 등은 전부 죽어라 노력해 얻은 결과물이라 믿는다. </p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <img src="../images2/수정됨_user-1.jpg">
                    <h3>Heung-min Son</h3>
                </div>
                <div class="col-3">
                    <i class="fa-solid fa-quote-left"></i>
                    <p>처음부터 겁먹지 말자. 막상 가보면 아무것도 아닌게 세상엔 참으로 많다.</p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <img src="../images2/수정됨_user-2.jpg">
                    <h3>Yu-na Kim</h3>
                </div>
                <div class="col-3">
                    <i class="fa-solid fa-quote-left"></i>
                    <p>남들과 똑같이 해서는 살아남을 수 없었다. 완벽주의는 내게 불가피한 선택이었다. 쓰러질지언정 무릎은 꿇지 않았다.</p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <img src="../images2/수정됨_user-3.jpg">
                    <h3>Ji-sung Park</h3>
                </div>
            </div>
        </div>
    </div>

<!-- --------------- brands --------------  -->
    <div class="brands">
        <div class="small-container">
            <div class="row">
                <div class="col-5">
                    <img src="../images/logo-philips.png">
                </div>
                <div class="col-5">
                    <img src="../images/logo-paypal.png">
                </div>
                <div class="col-5">
                    <img src="../images/logo-godrej.png">
                </div>
                <div class="col-5">
                    <img src="../images2/수정됨_logo-cnbc.png">
                </div>
                <div class="col-5">
                    <img src="../images/logo-coca-cola.png">
                </div>
            </div>
        </div>
    </div>

<!-- --------- footer ------------  -->

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
<!-- --------- js for toggle menu -----------  -->
    <script>
        var MenuItems = document.getElementById("MenuItems");

        MenuItems.style.maxHeight = "0px";

        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "300px";
                 } 
            else 
                {
                MenuItems.style.maxHeight = "0px";
                }
        }
    </script>

    <!-- -------- slide banner --------  -->
    <script>
        var slideImg = document.getElementById("slideImg");

        var images = new Array(
                "../images2/highest home.jpg",
                "../images2/highest car.jpg",
                "../images2/highest jet.jpg",
                "../images2/highest yacht.jpg"
            );

        var len = images.length;
        var i = 0;

        function slider(){
            if(i > len-1){
                i = 0;
            }
            slideImg.src = images[i];
            i++;
            setTimeout('slider()',3000);
        }

    </script>

</body>
</html>
