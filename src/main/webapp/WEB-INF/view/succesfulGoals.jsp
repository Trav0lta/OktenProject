<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div id="successfulG" class="autoheight">

    <nav class="navbar navbar-light bg-light ">
        <a style="width: 20%" class="navbar-item ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">Successful Goals</a>
        <span style="width: 20%;text-align: right;"><span class="navbar-text ml-auto mr-3">
      	Hello, <b>${currentUser.firstName} ${currentUser.lastName}</b>
        </span>
        <a class="navbar-item mr-3">
            <c:if test="${currentUser.avatar != null}">
                <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
            <c:if test="${currentUser.avatar == null}">
                <img src="/resources/img/avatar.png" width="30" height="30" class="rounded-circle" alt="">
            </c:if>
        </a></span>
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
                    <a class="btn btn-outline-success" href="/yourSuccesfulGoals" role="button">Successful</a>
                    <a class="btn btn-outline-primary" href="/yourFailedGoals" role="button">Failed</a>
                    <a class="btn btn-outline-primary" href="/yourStatistic" role="button">Statistic</a>
                    <a href="/goal" class="btn btn-outline-primary" role="button">Add goal</a>
                </form>
            </div>
        </div>


        <div class="container-fluid">
            <div  class="row ml-5 mr-5 mt-4 justify-content-center">
                <div class="col" style="max-width: 1400px">
                    <div class="card autoheight1" style="overflow-y: auto;">
                        <div class="list-group list-group-flush">
                            <c:forEach items="${goalList}" var="go">
                                <c:if test="${go.user.id == currentUser.id}">
                                    <div class="list-group-item autoheight2 row m-0" style="height: 100%; min-height: 100%;">
                                        <div class="col-sm-8 aboutGoal">
                                            <h5>${go.goalName}</h5>
                                            <p>${go.goalDesc}</p>
                                            <p style="margin-top: 1%"> Finished: <span  style="color: firebrick;">${go.deadline}</span></p>

                                        </div>
                                        <div class="col-sm-2 text-center quantQ">
                                            <span class="step">10</span>
                                            books
                                        </div>
                                        <div class="col-sm-2 text-center daysG">
                                            <span class="step">10</span>
                                            days
                                        </div>

                                        <div class="col-sm-1 text-center pencilIco">
                                            <a href="#" data-toggle="modal" data-target="#modalEdit${go.id}"><span class="fa fa-clone"></span></a>
                                        </div>

                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="tmp/footerUser.jsp"%>



    <div class="container">


    </div>



</div>
<%@include file="tmp/footerUser.jsp"%>
