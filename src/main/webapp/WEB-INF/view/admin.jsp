<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/header.jsp" %>

<section class="container" >
    <div class="row align-items-center" style="height: 500px">
        <div class="col-8">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h2>Admin Page | <a href="/logout">Log-out</a>  | <a href="/index">Back</a></h2>
            </c:if>
            <h2><a href="${contextPath}/showAll">Show All Users</a></h2>
            <br>
            <c:forEach items="${allUsers}" var="user">
                <p>${user.id} | ${user.username}</p>
            </c:forEach>
        </div>
    </div>
</section>

<%@include file="tmp/footer.jsp"%>
