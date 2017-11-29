<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/header.jsp" %>

<nav class="navbar navbar-light bg-light ">
    <form class="form-inline">
        <ul class="pull-left">
            <li><a href="/registration"><button class="btn btn-header btn-sign-in mr-sm-2" type="button"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</button></a></li>
        </ul>
        <ul class="pull-right">
            <li><a href="/index" class="btn btn-header btn-back"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a></li>
        </ul>
    </form>
</nav>

<section class="container login-page">
    <div class="row align-items-center" style="height: 500px">
        <div class="col-8">
            <form method="POST" action="${contextPath}/login">

                <div class="${error != null ? 'has-error' : ''}">
                    <span>${message}</span>
                    <div class="form-group">
                        <label for="validationCustom01">Login</label>
                        <input name="username" type="text" class="form-control" id="validationCustom01" placeholder="Enter login"/>
                    </div>

                    <div class="form-group">
                        <label for="validationCustom02">Password</label>
                        <input name="password" type="password"  class="form-control" id="validationCustom02" placeholder="Password"/>
                    </div>
                    <span>${error}</span>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <c:if test="${not empty error}">
                        <span class="error"${error}></span>
                    </c:if>

                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="submit" class="form-check-input btn" value="Sign In"/>
                        </label>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="tmp/footer.jsp"%>