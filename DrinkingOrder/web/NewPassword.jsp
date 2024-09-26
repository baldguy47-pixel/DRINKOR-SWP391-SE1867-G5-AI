<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>User - profile</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
    </head>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css2/vendor.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style2.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
          rel="stylesheet">
    <style>
        .custom-user-profile {
            position: relative;
            display: inline-block;
        }

        .custom-user-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .custom-dropdown {
            display: inline-block;
        }

        .custom-dropbtn {
            background-color: #F9F3EC;
            ;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .custom-dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        .custom-dropdown-item {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .custom-dropdown-item:hover {
            background-color: #f1f1f1;
        }

        .custom-dropdown:hover .custom-dropdown-content {
            display: block;
        }

    </style>

</head>

<body>

    <div class="preloader-wrapper">
        <div class="preloader">
        </div>
    </div>

    <jsp:include page="Header.jsp"></jsp:include>
        <div class="w-100 d-flex justify-content-center my-5 ">
            <div class="card text-center" style="width: 500px;">
                <div class="card-header h5 text-white bg-primary">Đặt lại mật khẩu</div>
                <div class="card-body px-5">
                    <!-- Display error message if any -->
                <c:if test="${errorMessage != null}">
                    <div style="color: red">
                        ${errorMessage}
                    </div>
                </c:if>
                    <form class="login-form" action="new-password" method="post" id="_form">
                    <input type="hidden" name="email" value="${email}">
                    <input type="hidden" name="otp" value="${otp}">
                    <div data-mdb-input-init class="form-outline">
                        <input type="password" id="password" name="password" required oninput="validatePassword()" class="form-control my-3" placeholder="Mật khẩu"/>
                        <div id="passwordError" style="color: red"></div>
                    </div>
                    <div data-mdb-input-init class="form-outline">
                        <input type="password" id="retypePassword" name="retypePassword" required oninput="validateRetypePassword()" class="form-control my-3" placeholder="Nhập lại mật khẩu"/>
                        <div id="retypePasswordError" style="color: red"></div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đặt lại mật khẩu</button>
                </form>

                <div class="d-flex justify-content-between mt-4">
                    <a class="" href="login">Đăng nhập</a>
                    <a class="" href="register">Đăng ký</a>
                </div>
            </div>
        </div>
    </div>


    <footer id="footer" class="my-5">
        <div class="container py-5 my-5">
            <div class="row">

                <div class="col-md-3">
                    <div class="footer-menu">
                        <img src="${pageContext.request.contextPath}/Image/logo.png" alt="logo">
                        <p class="blog-paragraph fs-6 mt-3">Subscribe to our newsletter to get updates about our grand offers.</p>
                        <div class="social-links">
                            <ul class="d-flex list-unstyled gap-2">
                                <li class="social">
                                    <a href="#">
                                        <iconify-icon class="social-icon" icon="ri:facebook-fill"></iconify-icon>
                                    </a>
                                </li>
                                <li class="social">
                                    <a href="#">
                                        <iconify-icon class="social-icon" icon="ri:twitter-fill"></iconify-icon>
                                    </a>
                                </li>
                                <li class="social">
                                    <a href="#">
                                        <iconify-icon class="social-icon" icon="ri:pinterest-fill"></iconify-icon>
                                    </a>
                                </li>
                                <li class="social">
                                    <a href="#">
                                        <iconify-icon class="social-icon" icon="ri:instagram-fill"></iconify-icon>
                                    </a>
                                </li>
                                <li class="social">
                                    <a href="#">
                                        <iconify-icon class="social-icon" icon="ri:youtube-fill"></iconify-icon>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer-menu">
                        <h3>Quick Links</h3>
                        <ul class="menu-list list-unstyled">
                            <li class="menu-item">
                                <a href="#" class="nav-link">Home</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="nav-link">About us</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="nav-link">Offer </a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="nav-link">Services</a>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="nav-link">Conatct Us</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer-menu">
                        <h3>Help Center</h5>
                            <ul class="menu-list list-unstyled">
                                <li class="menu-item">
                                    <a href="#" class="nav-link">FAQs</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#" class="nav-link">Payment</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#" class="nav-link">Returns & Refunds</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#" class="nav-link">Checkout</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#" class="nav-link">Delivery Information</a>
                                </li>
                            </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div>
                        <h3>Our Newsletter</h3>
                        <p class="blog-paragraph fs-6">Subscribe to our newsletter to get updates about our grand offers.</p>
                        <div class="search-bar border rounded-pill border-dark-subtle px-2">
                            <form class="text-center d-flex align-items-center" action="" method="">
                                <input type="text" class="form-control border-0 bg-transparent" placeholder="Enter your email here" />
                                <iconify-icon class="send-icon" icon="tabler:location-filled"></iconify-icon>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/js2/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js2/script.js"></script> 
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
    <script>
        let validateFullname = true;
        let validatepassword = true;
        let validateRePassword = true;


        function validatePassword() {
            var passwordInput = document.getElementById('password');
            var passwordError = document.getElementById('passwordError');

            if (passwordInput.value.trim().length < 8) {
                passwordError.textContent = 'Mật khẩu ít nhất 8 chữ số';
                validatepassword = false;
            } else {
                passwordError.textContent = '';
                validatepassword = true;
            }
        }

        function validateRetypePassword() {
            var passwordInput = document.getElementById('password');
            var retypePasswordInput = document.getElementById('retypePassword');
            var retypePasswordError = document.getElementById('retypePasswordError');

            if (retypePasswordInput.value !== passwordInput.value) {
                validateRePassword = false;
                retypePasswordError.textContent = 'Mật khẩu không khớp';
            } else {
                retypePasswordError.textContent = '';
                validateRePassword = true;
            }
        }
        document.getElementById('_form').addEventListener('submit', function (event) {
            event.preventDefault();
            if (!validateFullname || !validatepassword || !validateRePassword)
                return;
            event.target.submit();
        });
    </script>

</body>

</html>