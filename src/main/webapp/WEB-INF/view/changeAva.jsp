<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div class="autoheight">
    <!-- Navbar -->
    <nav class="navbar navbar-light bg-light ">
        <ul class="pull-left">
            <li><a href="/settings" class="btn btn-header btn-back"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a></li>
        </ul>
        <a class="navbar-item mr-auto ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM | Changing Avatar</a>
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
        <div class="row">
            <div class="col-md-3"></div>

            <form class="form-horizontal" role="form" action="changeAvatar" method="post" enctype="multipart/form-data">
                <div>
                    <c:if test="${currentUser.avatar != null}">
                        <img src="${currentUser.avatar}" width="200" height="200" class="rounded-circle">
                    </c:if>
                    <c:if test="${currentUser.avatar == null}">
                        <img src="/resources/img/avatar.png" width="200" height="200" class="rounded-circle">
                    </c:if>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <div class="field">
                            <label for="exampleFormControlFile1">Upload new avatar</label>
                            <input type="file" name="avatar" class="form-control-file" formenctype="multipart/form-data" id="exampleFormControlFile1">
                            <input type="hidden" value="${currentUser.username}" name="username" >
                        </div>
                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="submit"></label>
                            <div class="col-md-4">
                                <input id="submit" type="submit" value="Save" class="btn btn-primary">
                                <input type="hidden"
                                       name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <!-- main section end -->


</div>
<%@include file="tmp/footerUser.jsp"%>