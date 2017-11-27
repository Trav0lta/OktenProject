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
            <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle">
            <c:if test="${currentUser.avatar == null}">
                <img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle">
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
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div id="profile-settings" class="row">
                    <div class="field-editable col-md-6 row">
                        <div class="col-md-5">
                            <h4 id="name" class="user-field-edit">${currentUser.firstName}</h4>
                        </div>
                        <div class="col-md-7">
                            <div id="name-edit" class="edit-btn"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                        </div>
                    </div>

                    <div class="field-editable col-md-6 row">
                        <div class="col-md-5">
                            <h4 id="lastname" class="user-field-edit">${currentUser.lastName}</h4>
                        </div>
                        <div class="col-md-7">
                            <div id="lastname-edit" class="edit-btn"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                        </div>
                    </div>

                    <div class="field-editable col-md-12 row">
                        <div class="col-md-5">
                            <h4 id="email" class="user-field-edit">${currentUser.email}</h4>
                        </div>
                        <div class="col-md-7">
                            <div id="email-edit" class="edit-btn"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                        </div>
                    </div>

                    <div class="field-editable col-md-12 row">
                        <div class="col-md-5">
                            <h4 id="nickname" class="user-field-edit">${currentUser.username}</h4>
                        </div>
                        <div class="col-md-7">
                            <div id="nickname-edit" class="edit-btn"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                        </div>
                    </div>

                    <%--<div class="field-editable col-md-12 row">--%>
                        <%--<div class="col-md-5">--%>
                            <%--<h4 id="password" class="user-field-edit">Password</h4>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-7">--%>
                            <%--<div id="password-edit" class="edit-btn"><i class="fa fa-pencil" aria-hidden="true"></i></div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- main section end -->


</div>
<%@include file="tmp/footerUser.jsp"%>