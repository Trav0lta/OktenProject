<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp" %>
<form:form method="POST" modelAttribute="personalform">
    <section class="container" >
        <div class="row align-items-center" style="height: 500px">
            <div class="col-8">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <h2> Welcome | <a href="/logout">Log-out</a> | <a href="/index">Back</a></h2>
                </c:if>
                <h2><a href="${contextPath}/admin">Go to the page Admin</a></h2>
                <br>
                <h2><a href="${contextPath}/showAllInterests">Show you interests</a></h2>
                <br>

                <c:forEach items="${AllInterestsName}" var="account">
                    <p>${account.id} | ${account.interestName}</p>
                </c:forEach>
            </div>
        </div>
    </section>
</form:form>
<%@include file="tmp/footer.jsp"%>
