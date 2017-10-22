<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/header.jsp" %>

<nav class="navbar navbar-light bg-light ">
    <form class="form-inline">
        <a href="/login"><button class="btn btn-outline-success mr-sm-2" type="button">Log in</button></a>
        <a href="/index" class="btn btn-outline-danger">Back</a>
    </form>
</nav>
<section class="container" >
    <div class="row align-items-center" style="height:700px">
        <div class="col-8">

            <form:form action="saveUserSpringForm" method="POST" modelAttribute="emptyUser" enctype="multipart/form-data">
                    <div class="field">
                        <label for="firstName">First name</label>
                        <form:input type="text" path="firstName" class="form-control" id="firstName" placeholder="Enter first name"/>
                    </div>

                    <div class="field">
                        <label for="lastName">Last name</label>
                        <form:input type="text" path="lastName" class="form-control" id="lastName" placeholder="Enter last name"/>
                    </div>
                <div class="field">
                    <label for="exampleFormControlFile1">Upload an avatar</label>
                    <input type="file" name="avatar" class="form-control-file" formenctype="multipart/form-data" id="exampleFormControlFile1">
                </div>
                <%--<spring:bind path="email">--%>
                    <div class="field">
                        <label for="validationRegisterEmail">Email</label>
                        <form:input type="email" path="email" class="form-control" id="validationRegisterEmail" placeholder="Enter email"/>
                    </div>

                    <div class="field">
                        <div class="${status.error ? 'has-error' : ''}">
                            <label for="validationRegister01">Login</label>
                            <form:input type="text" path="username" class="form-control" id="validationRegister01" placeholder="Enter login"/>
                            <form:errors path="username" class="cs"/>
                        </div>
                    </div>

                    <div class="field">
                        <div class="${status.error ? 'has-error' : ''}">
                            <label for="validationRegister02">Password</label>
                            <form:input type="password" path="password" class="form-control" id="validationRegister02" placeholder="Create password"/>
                            <form:errors path="password" class="cs"/>
                        </div>
                    </div>
                    <div class="field">
                        <div class="${status.error ? 'has-error' : ''}">
                            <label for="validationRegister02">confirmPassword</label>
                            <form:input type="password" path="confirmPassword" class="form-control" id="validationRegister02" placeholder="Confirm your password"/>
                            <form:errors path="confirmPassword" class="cs"/>
                        </div>
                    </div>

                <br>
                <input type="submit" class="btn btn-primary"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>
        </div>
    </div>
</section>
<!-- /container -->
<%@include file="tmp/footer.jsp"%>