<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="tmp/headerUser.jsp" %>

<div id="user" class="autoheight">

    <nav class="navbar navbar-light bg-light ">
        <a style="width: 20%" class="navbar-item ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">Current Goals</a>
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
                        <a class="btn btn-outline-success" href="/yourCurGoals" role="button">Current</a>
                        <a class="btn btn-outline-primary" href="/yourSuccesfulGoals" role="button">Successful</a>
                        <a class="btn btn-outline-primary" href="/yourFailedGoals" role="button">Failed</a>
                        <a class="btn btn-outline-primary" href="/yourStatistic" role="button">Statistic</a>
                        <a href="/goal" class="btn btn-outline-primary" role="button">Add goal</a>
                    </form>
            </div>
        </div>


            <div class="container-fluid">
                <div  class="row ml-sm-5 mr-sm-5 mt-4 justify-content-center">
                    <div class="col" style="max-width: 1400px">
                        <div class="card autoheight1" style="overflow-y: auto;">
                            <div class="list-group list-group-flush">
                                    <c:forEach items="${goalList}" var="go">
                                        <c:if test="${go.user.id == currentUser.id && go.statusFinished==false}">
                                            <div class="list-group-item autoheight2 row m-0" style="height: 100%; min-height: 100%;">
                                                <div class="col-sm-8 aboutGoal">
                                                    <h5>${go.goalName}</h5>
                                                    <p>${go.goalDesc}</p>
                                                    <p style="margin-top: 1%"> Deadline: <span  style="color: firebrick;"><fmt:formatDate value="${go.deadline}" pattern="dd-MM-yyyy"/></span></p>

                                                </div>
                                                <div class="col-sm-2  col-6 progressGoal">
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: ((${go.currentGoalCrNum}/${go.goalCrNum})*100)" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div><p class="progressText"><b><span class="current-num">${go.currentGoalCrNum}</span>/<span class="max-num">${go.goalCrNum}</span></b></p><p style="margin-top: -4%!important;" class="progressText text-center">${go.goalCrName}</p>
                                                </div>
                                                <div class="col-sm-1  col-3 text-center plusIco">
                                                    <a href="#" data-toggle="modal" data-target="#myModal${go.id}"><span class="oi oi-plus"></span></a>
                                                </div>
                                                <div class="modal fade" id="myModal${go.id}" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <form action="/changeGoal" method="post">
                                                                <input type="hidden" value="${go.id}" name="goalId">
                                                                <input type="hidden" value="${go.user.id}" name="userId">
                                                                <div class="modal-header">
                                                                <h4 class="modal-title">Add progress to your goal</h4>
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Your current progress: <b>${go.currentGoalCrNum}/${go.goalCrNum}</b></p><br>
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div><br>
                                                                <p>Change your progress:</p><br>
                                                                <div class="range-slider">
                                                                    <input type="hidden" value="${go.goalCrNum}" name="goalCrNum">
                                                                    <input class="range-slider__range" type="range" name="currentGoalCrNum" value="${go.currentGoalCrNum}" min="${go.currentGoalCrNum}" max="${go.goalCrNum}">
                                                                    <span class="range-slider__value">${go.currentGoalCrNum}</span>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                    <input type="submit" value="Add progress" class="btn btn-outline-primary">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-1 col-3 text-center pencilIco">
                                                    <a href="#" data-toggle="modal" data-target="#modalEdit${go.id}"><span class="oi oi-pencil"></span></a>
                                                </div>
                                                <div class="modal fade" id="modalEdit${go.id}" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <form action="/editGoal" method="post">
                                                                <input type="hidden" value="${go.id}" name="goalId">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title">Edit your goal</h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <div class="modal-body">
                                                                        <div class="form-group">
                                                                            <label for="goal-name" class="form-control-label">New name:</label>
                                                                            <input type="text" class="form-control" name="goalName" value="${go.goalName}" id="goal-name">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="goal-text" class="form-control-label">New description:</label>
                                                                            <input class="form-control" name="goalDesc" value="${go.goalDesc}" id="goal-text">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="goal-crit" class="form-control-label">New critetion name:</label>
                                                                            <input class="form-control" name="goalCrName" value="${go.goalCrName}" id="goal-crit">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="goal-quantity" class="form-control-label">Change quantity (${go.goalCrNum}):</label>
                                                                            <input type="number" class="form-control" name="goalCrNum" value="${go.goalCrNum}" min="${go.currentGoalCrNum}" id="goal-quantity">
                                                                        </div>

                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="submit" value="Save" class="btn btn-outline-primary" aria-pressed="true">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                                </div>
                                                            </form>
                                                            <form action="/failGoal" style="position: absolute;top: 90%;left: 5%;" method="post">
                                                                <input type="hidden" value="${go.id}" name="id">
                                                                <input type="hidden" value="${go.user.id}" name="userId">
                                                                <input type="submit" value="Give UP" class="btn btn-outline-danger" aria-pressed="true">
                                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                            </form>
                                                        </div>
                                                    </div>
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
