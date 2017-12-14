<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/headerUser.jsp" %>
<div class="autoheight" id="goal">

    <div id="user" class="autoheight">

        <nav class="navbar navbar-light bg-light ">
            <a style="width: 20%" class="navbar-item ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
            <a class="navbar-brand ml-auto mr-auto" href="#">Add Goal</a>
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
    </div>
</div>
<%@include file="tmp/footerUser.jsp"%>
