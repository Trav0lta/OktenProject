<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp" %>
<form:form method="POST" modelAttribute="indexform">
    <div class="view">
        <a href="/login"><button class="btn btn-outline-success mr-sm-2" type="button">Sign in</button></a>
        <a href="/registration"><button class="btn btn-outline-primary" type="button">Registration</button></a>
        <a href="/logout"><button class="btn btn-outline-primary cs" type="button">Logout</button></a>
        <div class="row justify-content-center">
            <a class="btn btn-info" href="/account" role="button">to Personal page</a>
        </div>
    </div>
</form:form>
<%@include file="tmp/footer.jsp"%>
