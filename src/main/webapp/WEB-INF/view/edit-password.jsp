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
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM | Changing password</a>
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
                <form id="change-password" class="form-horizontal" role="form" action="/changePassword" method="post">
                    <h3>Changing password</h3>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <input type="hidden" value="${currentUser.id}" name="userId" >
                            <p><input id="password" type="password" name="password" class="form-control"></p>
                            <p><div class="btn btn-primary btn-block submit">Change password</div></p>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>
                    </div>
                </form>
            </div>

    <!-- main section end -->


</div>

<script type="text/javascript">
    $(document).ready(function() {
       $("#password").blur(function () {
           if (!$("#password").val().match(/^[a-zA-Z0-9]{4,}$/)) {
               $("#password").css("background", "#FFFDE7")
           } else {
               $("#password").css("background", "#FFF")
           }
       });

       $(".submit").click(function () {
           var valid = true;
           if (!$("#password").val().match(/^[a-zA-Z0-9]{4,}$/)) {
               valid = false;
           }
           if (valid) {
               $("#change-password").submit()
           } else {
               alert("Invalid password")
           }
       });

    });
</script>

<%@include file="tmp/footerUser.jsp"%>