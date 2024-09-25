<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="css2/vendor.css">
        <link rel="stylesheet" type="text/css" href="style2.css">

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

            <section id="banner" style="background: #F9F3EC;">
                <div class="container">
                    <div class="swiper main-swiper">
                        <div class="swiper-wrapper">


                        <c:forEach var="slider" items="${sliders}">
                            <div class="swiper-slide py-5">
                                <div class="row banner-content align-items-center">
                                    <div class="img-wrapper col-md-5">
                                        <img src="${slider.imageUrl}" class="img-fluid">
                                    </div>
                                    <div class="content-wrapper col-md-7 p-5 mb-5">
                                        <div class="banner-title display-1 fw-normal"><h2>${slider.title}</h2></div>
                                        <p class="secondary-font text-primary text-uppercase mb-4 ">${slider.notes}</p>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="swiper-pagination mb-5"></div>

                </div>
            </div>
        </section>


        <section id="clothing" class="my-5 overflow-hidden">
            <div class="container pb-5">

                <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
                    <h2 class="display-3 fw-normal">New product</h2>
                    <div>
                        <a href="public/list-product" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
                            See more
                            <svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
                            <use xlink:href="#arrow-right"></use>
                            </svg></a>
                    </div>
                </div>

                <div class="products-carousel swiper">
                    <div class="swiper-wrapper">

                        <c:forEach items="${products}" var="p">

                            <div class="swiper-slide">
                                <c:if test="${p.productDetail.discount != null && p.productDetail.discount != 0}">
                                    <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle bg-light ">
                                        -${p.productDetail.discount}%
                                    </div>
                                </c:if>

                                <div class="card position-relative">
                                    <a href="single-product.html"><img src="${p.productDetail.imageURL}" class="img-fluid rounded-4" alt="image"></a>
                                    <div class="card-body p-0">
                                        <a href="single-product.html">
                                            <h3 class="card-title pt-4 m-0">${p.productName}</h3>
                                        </a>

                                        <div class="card-text">
                                            <span class="rating secondary-font">
                                                <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                                                <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                                                <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                                                <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                                                <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                                                5.0</span>

                                            <h3 class="secondary-font text-primary">${p.productDetail.price}</h3>

                                            <div class="d-flex flex-wrap mt-3">
                                                <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                                                    <h5 class="text-uppercase m-0">Add to Cart</h5>
                                                </a>
                                                <a href="#" class="btn-wishlist px-4 pt-3 ">
                                                    <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                                                </a>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>

                        </c:forEach>



                    </div>
                </div>
                <!-- / products-carousel -->


            </div>
        </section>


        <section id="latest-blog" class="my-5">
            <div class="container py-5 my-5">
                <div class="row mt-5">
                    <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
                        <h2 class="display-3 fw-normal">Latest Blog Post</h2>
                        <div>
                            <a href="#" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
                                Read all
                                <svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
                                <use xlink:href="#arrow-right"></use>
                                </svg></a>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <c:forEach var="post" items="${posts}" begin="0" end="3" step="1">
                        <div class="col-md-4 my-4 my-md-0">
                            <div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
                                <h3 class="secondary-font text-primary m-0">20</h3>
                                <p class="secondary-font fs-6 m-0">Feb</p>

                            </div>
                            <div class="card position-relative">
                                <a href="single-post.html"><img src="${post.imgURL}" class="img-fluid rounded-4" alt="image"></a>
                                <div class="card-body p-0">
                                    <a href="single-post.html">
                                        <h3 class="card-title pt-4 pb-3 m-0">${post.title}</h3>
                                    </a>

                                    <div class="card-text">
                                        <p class="blog-paragraph fs-6">${fn:substring(post.content, 0, 50)}...</p>
                                        <a href="single-post.html" class="blog-read">read more</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
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
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js2/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js2/script.js"></script>
        <script src="${pageContext.request.contextPath}/js2/customjs.js"></script>
        <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
    </body>

</html>
