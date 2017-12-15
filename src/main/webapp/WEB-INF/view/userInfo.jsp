<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/headerUser.jsp" %>
<div class="autoheight" id="goal">

    <div id="user" class="autoheight">
        <nav class="navbar navbar-light bg-light ">
            <a style="width: 20%" class="navbar-item ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
            <a class="navbar-brand ml-auto mr-auto" href="#">User Info</a>
            <span style="width: 20%;text-align: right;"><span class="navbar-text ml-auto mr-3">
      	Hello, <b>${currentUser.firstName} ${currentUser.lastName}</b>
        </span>
        <a class="navbar-item mr-3" href="/settings">
            <c:if test="${currentUser.avatar != null}">
                <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
            <c:if test="${currentUser.avatar == null}">
                <img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
        </a></span>
        </nav>
        <div>
            <img src="${user.avatar}"width="250" height="300" class= alt="">
            <h2>User Name - ${user.username}</h2>
            <h2>Firs Name - ${user.firstName}</h2>
            <h2>Last Name - ${user.lastName}</h2>
            <h2>Email - ${user.email}</h2>
            <h2>Password - ${user.password}</h2>
        </div>
    </div>





</div>
<%@include file="tmp/footerUser.jsp"%>
