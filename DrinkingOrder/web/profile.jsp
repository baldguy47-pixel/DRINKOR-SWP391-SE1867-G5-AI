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
        <section style="background-color: #eee;">
            <div class="alert alert-success" style="visibility: ${param.success ne null ? 'visible' : 'hidden'}" role="alert">
            Thành công!
        </div>
        <div class="alert alert-danger" style="display: ${param.fail ne null ? 'block': 'none'}"  role="alert">
            Thất bại!
        </div>
        <form id="profileForm" onsubmit="return validateForm()" action="profile" method="post">
            <div class="container py-5">

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img id="image0" src="${user.avatar}" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 150px; border: 1px solid black">
                                <h5 class="my-3">${sessionScope.user.fullname}</h5>
                                <div class="d-flex justify-content-center mb-2">
                                    <input type="file" class="form-control" id="imageFile0" accept="image/*" onchange="updateImage(0)">
                                    <input type="hidden" class="form-control" id="imageUrl0" name="avatar" value="${user.avatar}">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Họ và tên</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="fullname" class="form-control" value="${sessionScope.user.fullname}" required/>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" class="form-control" value="${sessionScope.user.email}" disabled/>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Số điện thoại</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="phone" class="form-control" value="${sessionScope.user.phone}" required/>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Giới tính</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <select style="padding: 1.25rem 0rem 1.25rem 1.25rem; 
                                                border: 1px solid rgba(65, 64, 62, 0.20);
                                                border-radius: 0.25rem;
                                                color: #908F8D" name="gender">
                                            <option value="Male" ${sessionScope.user.gender eq 'Male' ? 'selected' : ''}>Nam</option>
                                            <option value="Female" ${sessionScope.user.gender eq 'Female' ? 'selected' : ''}>Nữ</option>
                                        </select>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Địa chỉ</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="address" class="form-control" value="${sessionScope.user.address}" required/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center mb-2">
                            <button  type="submit" class="btn btn-primary">Xác nhận</button>
                            <a  href="change-pass" class="btn btn-outline-primary ms-1">Đổi mật khẩu</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>


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
    <script type="text/javascript">
                                            function validateForm() {
                                                let email = document.getElementById('email').value;
                                                let fullname = document.getElementById('fullname').value;
                                                let gender = document.getElementById('gender').value;
                                                let address = document.getElementById('address').value;
                                                let phone = document.getElementById('phone').value;

                                                if (!validateEmail(email)) {
                                                    alert("Please enter a valid email address.");
                                                    return false;
                                                }
                                                if (fullname.trim() === "") {
                                                    alert("Full name is required.");
                                                    return false;
                                                }
                                                if (gender !== "Male" && gender !== "Female") {
                                                    alert("Please select a valid gender.");
                                                    return false;
                                                }
                                                if (address.trim() === "") {
                                                    alert("Address is required.");
                                                    return false;
                                                }
                                                if (!validatePhone(phone)) {
                                                    alert("Please enter a valid phone number.");
                                                    return false;
                                                }
                                                return true;
                                            }

                                            function validateEmail(email) {
                                                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                                return re.test(String(email).toLowerCase());
                                            }

                                            function validatePhone(phone) {
                                                const re = /^\d{10}$/;
                                                return re.test(phone);
                                            }

                                            function updateImage(sliderId) {
                                                let fileInput = document.getElementById(`imageFile` + sliderId);
                                                let image = document.getElementById(`image` + sliderId);
                                                let hiddenInput = document.getElementById(`imageUrl` + sliderId);
                                                console.log(fileInput, image, hiddenInput)

                                                // check file uploaded
                                                if (fileInput.files && fileInput.files[0]) {
                                                    const file = fileInput.files[0];
                                                    const maxSize = 1 * 1024 * 1024; // 2 MB in bytes

                                                    if (file.size > maxSize) {
                                                        alert("The selected file is too large. Please select a file smaller than 1 MB.");
                                                        fileInput.value = ''; // Clear the file input
                                                        return;
                                                    }

                                                    // dịch image thành url
                                                    const reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        // Update the image src
                                                        image.src = e.target.result;

                                                        // Optionally, update the hidden input with the base64 data URL
                                                        hiddenInput.value = e.target.result;
                                                    };

                                                    reader.readAsDataURL(file);
                                                }
                                            }
    </script>
</body>

</html>