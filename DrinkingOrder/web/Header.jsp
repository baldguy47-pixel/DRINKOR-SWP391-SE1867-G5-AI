<%-- 
    Document   : Header
    Created on : Sep 15, 2024, 2:12:19 PM
    Author     : MSI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Jumbotron -->
<header>
    <div class="container py-2">
        <div class="row py-4 pb-0 pb-sm-4 align-items-center ">

            <div class="col-sm-4 col-lg-3 text-center text-sm-start">
                <div class="main-logo">
                    <a href="${pageContext.request.contextPath}/home">
                        <img src="${pageContext.request.contextPath}/Image/logo.png" alt="logo" class="img-fluid">
                    </a>
                </div>
            </div>

            <div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
                <div class="search-bar border rounded-2 px-3 border-dark-subtle">
                    <form id="search-form" class="text-center d-flex align-items-center" action="${pageContext.request.contextPath}/public/list-product">
                        <input type="text" class="form-control border-0 bg-transparent"
                               placeholder="Search ..." name="searchQuery" value="${searchQuery}"/>
                        <button type="submit" style="background: none; border: 0">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
                            </svg>
                        </button>
                    </form>
                </div>
            </div>

            <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
                <c:if test="${sessionScope.user == null}">
                    <div class="support-box text-end d-none d-xl-block">
                        <a href="${pageContext.request.contextPath}/login" class="btn" style="background: none; border: 0">
                            <h5 class="mb-0">login</h5>
                        </a>
                    </div>
                    <div class="support-box text-end d-none d-xl-block">
                        <a href="${pageContext.request.contextPath}/register" class="btn" style="background: none; border: 0">
                            <h5 class="mb-0">Register</h5>
                        </a>
                    </div>
                </c:if>

                <c:if test="${sessionScope.user != null}">
                    <div class="custom-user-profile">
                        <div class="custom-dropdown">
                            <button class="custom-dropbtn" id="custom-dropbtn">
                                <img src="${sessionScope.user.avatar}" alt="User Profile" class="custom-user-image" id="customUserImage">
                            </button>
                            <div class="custom-dropdown-content" id="customDropdownContent">
                                <a href="${pageContext.request.contextPath}/common/profile" class="custom-dropdown-item">Profile</a>
                                <a href="#" class="custom-dropdown-item">Setting</a>
                                <a href="${pageContext.request.contextPath}/logout" class="custom-dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                </c:if>


            </div>
        </div>
    </div>

    <div class="container-fluid">
        <hr class="m-0">
    </div>


</header>

