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
        <section class="mt-5">
            <div class="container">
                <div class="row">
                    <!-- sidebar -->
                    <div class="col-lg-3">
                        <!-- Toggle button -->
                        <button
                            class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
                            type="button"
                            data-mdb-toggle="collapse"
                            data-mdb-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation"
                            >
                            <span>Lọc</span>
                        </button>
                        <!-- Collapsible wrapper -->
                        <div class="collapse card d-lg-block mb-5" id="navbarSupportedContent">
                            <form action="list-product">
                                <input type="hidden" name="searchQuery" value="${searchQuery}" />
                            <div class="accordion" id="accordionPanelsStayOpenExample">

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button
                                            class="accordion-button text-dark bg-light"
                                            type="button"
                                            >
                                            Danh mục
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
                                        <div class="accordion-body">
                                            <div>
                                                <!-- Checked checkbox -->
                                                <c:forEach items="${categories}" var="c">
                                                    <div class="form-check">
                                                        <input class="border-1" name="category" type="checkbox" value="${c.ID}" ${categoriesCheckBox.contains(c.ID.toString()) == true ? 'checked' : ''}/>
                                                        <label class="form-check-label">${c.categoryName}</label>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 >
                                        <button
                                            class="accordion-button text-dark bg-light"
                                            type="button"
                                            >
                                            Giá
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
                                        <div class="accordion-body">

                                            <div class="row mb-3">
                                                <div class="col-6">
                                                    <p class="mb-0">
                                                        Từ
                                                    </p>
                                                    <div class="form-outline rounded-2" style="border: 1px solid black">
                                                        <input  type="number" value="${minPrice}" name="minPrice" id="typeNumber" class="form-control border" />

                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">
                                                        Đến
                                                    </p>
                                                    <div class="form-outline rounded-2" style="border: 1px solid black">
                                                        <input type="number" value="${maxPrice}" name="maxPrice" id="typeNumber" class="form-control border" />

                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn-cart w-100 border border-secondary" >Tìm kiếm</button>
                                        </div>
                                    </div>
                                </div>


                            </div>

                    </div>
                </div>
                <!-- sidebar -->
                <!-- content -->
                <div class="col-lg-9">
                    <header class="d-sm-flex align-items-center border-bottom mb-4 pb-3">
                        <div class="ms-auto">
                            <select class="form-select d-inline-block w-auto pt-1" name="arrange" style="border: 1px solid black">
                                <option value="ASC" ${arrange eq 'ASC' ? 'selected' : ''}>Giá tăng dần</option>
                                <option value="DESC" ${arrange eq 'DESC' ? 'selected' : ''}>Giá giảm dần</option>
                            </select>
                        </div>
                    </header>

                    <div class="row">

                        <c:forEach items="${products}" var="p">
                            <div class="col-lg-4 col-md-6 col-sm-6 d-flex my-3">
                                <div class="swiper-slide">
                                    <c:if test="${p.productDetail.discount != null && p.productDetail.discount != 0}">
                                        <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle bg-light ">
                                            -${p.productDetail.discount}%
                                        </div>
                                    </c:if>

                                    <div class="card position-relative">
                                        <a href="product-detail?id=${p.productId}"><img src="${p.productDetail.imageURL}" class="img-fluid rounded-4" alt="image"></a>
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


                                                <c:if test="${p.productDetail.discount != null && p.productDetail.discount != 0}">
                                                    <div class="d-flex flex-row">
                                                        <h5 class="mb-1 me-1">${p.productDetail.price*(100 - (p.productDetail.discount eq null ? 100 : p.productDetail.discount)) / 100}</h5>
                                                        <span style="color: red"><s>${p.productDetail.price}</s></span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${p.productDetail.discount == null || p.productDetail.discount == 0}">
                                                    <div class="d-flex flex-row">
                                                        <h5 class="mb-1 me-1">${p.productDetail.price*(100 - (p.productDetail.discount eq null ? 100 : p.productDetail.discount)) / 100}</h5>
                                                    </div>
                                                </c:if>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>

                    <hr />

                    <!-- Pagination -->
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                        <button style="margin-right: 10px; width: fit-content; padding: 0" class="btn btn-primary">Tới trang:</button>
                        <input class="form-control" oninput="valid(this)" style="width: 30px; font-size: 15px; padding: 5px; height: 25px; margin-right: 5px" pattern="\d{1,}" title="Enter number" type="text" name="page" value="${page}" min="1" max="${endPage}">
                        / ${endPage}
                        </form>
                    </nav>
                    <!-- Pagination -->
                </div>
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
    <script src="${pageContext.request.contextPath}/js2/script.js"></script> 
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>


</body>

</html>