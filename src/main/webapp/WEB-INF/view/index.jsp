<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp" %>
<form:form method="POST" modelAttribute="indexform">

    <nav class="navbar navbar-light bg-light ">
        <form class="form-inline">
            <ul class="pull-left">
                <li><a href="/login"><button class="btn btn-header btn-sign-in mr-sm-2" type="button"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign in</button></a></li>
                <li><a href="/registration"><button class="btn btn-header btn-sign-up" type="button"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign up</button></a></li>

            </ul>
            <ul class="pull-right">
                <li><a href="/logout"><button class="btn btn-header btn-log-out cs" type="button"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</button></a></li>
            </ul>
        </form>
    </nav>

    <div class="row justify-content-center">
        <a class="btn btn-info" href="/account" role="button">to Personal page</a>
    </div>

    <%--<div class="view">--%>
        <%--<a href="/login"><button class="btn btn-header btn-sign-in mr-sm-2" type="button">Sign in</button></a>--%>
        <%--<a href="/registration"><button class="btn btn-header btn-sign-up" type="button">Registration</button></a>--%>
        <%--<a href="/logout"><button class="btn btn-ouetline-primary cs" type="button">Logout</button></a>--%>
        <%--<div class="row justify-content-center">--%>
            <%--<a class="btn btn-info" href="/account" role="button">to Personal page</a>--%>
        <%--</div>--%>
    <%--</div>--%>
</form:form>
<%@include file="tmp/footer.jsp"%>
