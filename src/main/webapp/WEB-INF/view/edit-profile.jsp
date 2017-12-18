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
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM | Update your info</a>
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

    <div class="col-sm-8">
        <form action="/updateUserSpring" method="post" class="form-horizontal">

            <!-- Form Name -->
            <input type="hidden" value="${currentUser.id}" name="userId">
            <!-- Text inputs -->
            <div class="form-group col-md-4">
                <label class="control-label" for="firstName">First name:</label>
                <input id="firstName" type="text" name="firstName" class="form-control input-md" value="${currentUser.firstName}">
            </div>

            <div class="form-group col-md-4">
                <label class="control-label" for="lastName">Last name:</label>
                <input id="lastName" type="text" name="lastName" class="form-control input-md" value="${currentUser.lastName}">
            </div>

            <div class="form-group col-md-4">
                <label class="control-label" for="email">Email:</label>
                <input id="email" type="text" name="email" class="form-control input-md" value="${currentUser.email}">
            </div>

            <div class="form-group col-md-4">
                <label class="control-label" for="login"><%--Login:--%></label>
                <input id="login" type="hidden" name="username" class="form-control input-md" value="${currentUser.username}">
            </div>
            <!-- Button -->
            <div class="form-group col-md-4">
                <div id="submitForm" class="btn btn-primary">Save</div>
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </div>

        </form>

    </div>

    <!-- main section end -->


</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("input").blur(function () {
            if (!$(this).val()) {
                $(this).css("background", "#FFFDE7")
            } else {
                $(this).css("background", "#FFF")
            }
        });
        $("#email").blur(function () {
            if (!$(this).val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
                $(this).css("background", "#FFFDE7")
            } else {
                $(this).css("background", "#FFF")
            }
        });
        $("#login").blur(function () {
            if (!$(this).val().match(/^[a-zA-Z0-9]{4,}$/)) {
                $(this).css("background", "#FFFDE7")
            } else {
                $(this).css("background", "#FFF")
            }
        });
        $("#submitForm").click(function () {
            var valid = true;
            $("input").each(function () {
                if(!$(this).val()) {
                    valid = false
                }
            });
            if (!$("#email").val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
                valid = false
            }
            if (!$("#login").val().match(/^[a-zA-Z0-9]{4,}$/)) {
                valid = false
            }
            if (valid) {
                $("form").submit()
            } else {
                alert("Check all fields")
            }
        });
    });
</script>
<%@include file="tmp/footerUser.jsp"%>