<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div id="failedG" class="autoheight">

    <nav class="navbar navbar-light bg-light ">
        <a style="width: 20%" class="navbar-item ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">Your statistic</a>
        <span style="width: 20%;text-align: right;"><span class="navbar-text ml-auto mr-3">
        <b>${currentUser.firstName} do you want to <a href="chat">chatting</a><b>?</b></b>
        </span>
        <%--<a class="navbar-item mr-3" href="/settings">--%>
            <%--<c:if test="${currentUser.avatar != null}">--%>
                <%--<img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle" alt="">--%>
            <%--</c:if>--%>
            <%--<c:if test="${currentUser.avatar == null}">--%>
                <%--<img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle" alt="">--%>
            <%--</c:if>--%>
            <%--</a>--%>
        </span>
    </nav>

    <div class="collapse" id="collapseExample" style="position: absolute;left: 10px;">
        <ul class="list-group">
            <li class="list-group-item"><a href="/settings">Settings</a></li>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="list-group-item"><a href="/logout">Exit</a></li>
            </c:if>
        </ul>
    </div>

    <div class="container">

        <div class="row pt-4">
            <div class="col text-center">
                <form>
                    <a class="btn btn-outline-primary" href="/yourCurGoals" role="button">Current</a>
                    <a class="btn btn-outline-primary" href="/yourSuccesfulGoals" role="button">Successful</a>
                    <a class="btn btn-outline-success" href="/yourFailedGoals" role="button">Failed</a>
                    <a class="btn btn-outline-primary" href="/yourStatistic" role="button">Statistic</a>
                    <a href="/goal" class="btn btn-outline-primary" role="button">Add goal</a>
                </form>
            </div>
        </div>


        <div class="container-fluid">
            <div  class="row ml-5 mr-5 mt-4 justify-content-center">
                <div class="col" style="max-width: 1400px">
                    <div class="card autoheight1" style="overflow-y: auto;">


                        <div class="row">
                            <div class="col-4 text-center">
                                <span class="step">10</span>
                                finished goals
                            </div>
                            <div class="col-4 text-center">
                                <span class="step">7</span>
                                days to
                            </div>
                            <div class="col-4 text-center">
                                    <span class="step">69%</span>
                                    successful goals
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="tmp/footerUser.jsp"%>
