<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div class="autoheight">
    <!-- Navbar -->
    <nav class="navbar navbar-light bg-light ">
        <a class="navbar-item mr-auto ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM</a>
        <span class="navbar-text ml-auto mr-3">
      		<b>${currentUser.firstName} ${currentUser.lastName}</b>
    	</span>
        <a class="navbar-item mr-3">
            <c:if test="${currentUser.avatar != null}">
                <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
            <c:if test="${currentUser.avatar == null}">
                <img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
        </a>

    </nav>
    <div class="collapse" id="collapseExample" style="position: absolute;left: 10px;">
        <ul class="list-group">
            <li class="list-group-item"><a href="/account">User Page</a></li>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="list-group-item"><a href="/logout">Exit</a></li>
            </c:if>
        </ul>
    </div>
    <!-- navbar end -->
    <!-- main section -->

            <div class="container">
                <form class="form-horizontal" role="form" action="/changePassword" method="post">
                    <h2>Changing password</h2>
                    <div class="form-group">
                        <div class="col-sm-9">
                            <input type="hidden" value="${currentUser.id}" name="userId" >
                            <p><input type="password" name="password" class="form-control"></p>
                            <p><input type="submit" value="Change password" class="btn btn-primary btn-block"></p>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        </div>
                    </div>


                </form>
            </div>

    <!-- main section end -->


</div>
<%@include file="tmp/footerUser.jsp"%>