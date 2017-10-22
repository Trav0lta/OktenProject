<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/header.jsp" %>

<nav class="navbar navbar-light bg-light ">
    <form class="form-inline">
        <a href="/registration"><button class="btn btn-outline-success mr-sm-2" type="button">Registration</button></a>
        <a href="/index" class="btn btn-outline-danger">Back</a>
    </form>
</nav>

<section class="container" >
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
                            <input type="submit" class="form-check-input" type="checkbox"/>
                        </label>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="tmp/footer.jsp"%>