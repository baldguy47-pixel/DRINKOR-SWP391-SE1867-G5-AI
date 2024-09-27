<%-- 
    Document   : product-detail
    Created on : May 18, 2024, 5:58:36 PM
    Author     : Legion
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.CartDAO"%>
<%@page import="Model.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Product Detail</title>
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
    <style>

        /* Chỉ định phạm vi CSS cho trang chi tiết sản phẩm */

        .container.product-detail {
            margin-bottom: 100px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .preview {
            flex: 1 1 40%;
        }

        .preview-pic img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .preview-thumbnail img {
            width: 70px;
            height: 70px;
            margin-right: 10px;
            border-radius: 5px;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .preview-thumbnail img:hover {
            transform: scale(1.1);
        }

        .details {
            flex: 1 1 60%;
        }

        .product-title {
            font-size: 2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }

        .rating .stars {
            color: #FFD700;
        }

        .rating .review-no {
            font-size: 1rem;
            color: #777;
        }

        .product-description {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 20px;
        }

        .price {
            font-size: 1.5rem;
            color: #e74c3c;
        }


        .vote {
            font-size: 1rem;
            color: #27ae60;
        }

        .sizes {
            margin: 20px 0;
        }

        .size {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .size:hover {
            border-color: #27ae60;
            background-color: #ecf9f1;
        }

        .size.active {
            border-color: #27ae60;
            background-color: #F9F3EC;
            color: black;
        }

        .colors {
            margin: 20px 0;
        }

        .topping-card {
            display: inline-block;
            width: 120px;
            padding: 10px;
            margin: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .topping-card img {
            width: 100%;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }

        .topping-card:hover {
            border-color: #27ae60;
            background-color: #ecf9f1;
        }

        .topping-card.selected {
            border-color: #2ecc71;
            background-color: #2ecc71;
            color: #fff;
        }

        .action {
            margin-top: 30px;
        }

        .add-to-cart {
            background-color: #F9F3EC;
            color: black;
            border: none;
            padding: 12px 20px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-to-cart:hover {
            background-color: #27ae60;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .wrapper {
                flex-direction: column;
            }

            .preview, .details {
                flex: 1 1 100%;
            }
        }


    </style>

</head>

<body>

    <div class="preloader-wrapper">
        <div class="preloader">
        </div>
    </div>

    <jsp:include page="Header.jsp"></jsp:include>
        <div class="container product-detail" style="margin-bottom: 100px">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <form id="form" action="payment" method="post" style="display: flex;">
                            <div class="preview col-md-6 me-5">
                                <div class="preview-pic tab-content">
                                    <div class="tab-pane active" id="pic-1"><img src="${product.productDetail.imageURL}" /></div>
                            </div>
                            <ul class="preview-thumbnail nav nav-tabs">
                                <c:forEach items="${listDetails}" var="pd">
                                    <li class="active"><a href="product-detail?pdid=${pd.productDetailId}&id=${product.productId}"><img
                                                src="${pd.imageURL}"/></a></li>
                                        </c:forEach>
                            </ul>
                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title">${product.productName}</h3>
                            <div class="rating">
                                <div class="stars">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">41 đánh giá</span>
                            </div>
                            <p class="product-description">${product.description}</p>
                            <h4 class="price">Giá: <span><span style="color: grey; text-decoration: line-through; margin: 0 10px">${product.productDetail.price}$</span> ${String.format("%.2f", product.productDetail.price * (1 - product.productDetail.discount/100))}VND </span></h4>
                            <p class="vote"><strong>91%</strong> người hài lòng với sản phẩm! <strong>(87 đánh giá)</strong></p>
                            <h5 class="sizes">sizes:
                                <span style="margin-right: 20px"></span>
                                <c:set var="check" value=""/>
                                <c:forEach items="${listDetails}" var="pd">
                                    <c:if test="${!check.contains(String.valueOf(pd.size))}">
                                        <span class="color size ${pd.size == product.productDetail.size ? 'active' : ''}" data-toggle="tooltip" style="border: 1px solid black; text-align: center; align-content: center;" onclick="window.location.href = 'product-detail?pdid=${pd.productDetailId}&id=${product.productId}'" title="small">
                                            ${pd.size}
                                        </span>
                                    </c:if>
                                </c:forEach>
                            </h5>
                            <h5 class="colors">Số lượng: 
                                <input oninput="valid(this)" id="quantity" type="number" style="padding: 5px; width: 60px;
                                       padding: 5px;
                                       font-size: 1rem;
                                       border: 1px solid #ccc;
                                       border-radius: 5px;
                                       text-align: center;" value="1" name="quantity"> 
                                <input  type="hidden" id="productdetailId" value="${product.productDetail.productDetailId}" name="productdetailId"> 
                                <span style="font-weight: normal; font-style: italic"> (Còn lại: ${product.productDetail.stock - product.productDetail.hold}) </span>
                            </h5>


                            <h1 class="my-4">Chọn topping:</h1>
                            <div id="toppingContainer">
                                <c:forEach var="topping" items="${toppings}">
                                    <div class="topping-card" data-id="${topping.id}">
                                        <img src="${topping.img}" alt="${topping.toppingName}">
                                        <h5>${topping.toppingName}</h5>
                                        <p>$${topping.price}</p>
                                    </div>
                                </c:forEach>
                            </div>


                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button" onclick="addToCart(${product.productDetail.productDetailId})">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </form>

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
    <script defer>
                                    function valid(input) {
                                        input.value = input.value.replace(/[^0-9]/g, '');
                                        if (input.value > ${product.productDetail.stock})
                                            input.value = ${product.productDetail.stock};
                                        if (input.value < 1)
                                            input.value = 1;
                                    }


    </script>
    <script>
        // JavaScript to handle click events and toggle the background color
        const toppingCards = document.querySelectorAll('.topping-card');

        toppingCards.forEach(card => {
            card.addEventListener('click', function () {
                this.classList.toggle('selected');
            });
        });
    </script>
</body>

</html>
