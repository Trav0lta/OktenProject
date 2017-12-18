<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div id="failedG" class="autoheight">

    <nav class="navbar navbar-light bg-light ">
        <a style="width: 20%" class="navbar-item ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">Your statistic</a>
        <span style="width: 20%;text-align: right;"><span class="navbar-text ml-auto mr-3">
        <b>${currentUser.firstName}, do you want to <a href="chat">chatting</a><b>?</b></b>
        </span>
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
                    <a class="btn btn-outline-primary" href="/yourFailedGoals" role="button">Failed</a>
                    <a class="btn btn-outline-success" href="/yourStatistic" role="button">Statistic</a>
                    <a href="/goal" class="btn btn-outline-primary" role="button">Add goal</a>
                </form>
            </div>
        </div>


        <div class="container-fluid">
            <div  class="row ml-sm-5 mr-sm-5 mt-4 justify-content-center">
                <div class="col" style="max-width: 1400px">
                    <div class="card autoheight1" style="overflow-y: auto;">
                        <div class="section">
                        <div class="row m-0 mt-4">
                            <div class="col-4 text-center">
                                <span class="step">${countOfFinishedGoals}</span>
                                finished goals
                            </div>
                            <div class="col-4 text-center">
                                <span class="step">${daysWithUs}</span>
                                day(s) with us
                            </div>
                            <div class="col-4 text-center">
                                <span class="step">${procentSucsses}%</span>
                                successful goals
                            </div>
                            <div class="col-lg-6 mt-4 text-center">
                                <canvas id="myChart"></canvas>

                                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
                                <script>

                                    var ctx = document.getElementById('myChart').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'doughnut',
                                        data: {
                                            labels: ["Current", "Successful", "Failed"],
                                            datasets: [{
                                                data: [ ${countOfCurrentGoals}, ${currentUser.finishedSucssesGoals}, ${countOfFailedGoals}],
                                                backgroundColor: [
                                                    'rgba(54, 162, 235, 1)',
                                                    'rgba(255, 206, 86, 1)',
                                                    'rgba(255, 99, 132, 1)',
                                                ],

                                            }]
                                        },
                                        options: {
                                            title: {
                                                display: true,
                                                text: 'Statistic by goal'
                                            },
                                        }
                                    });

                                </script>
                            </div>
                            <div class="col-lg-6 mt-4 text-center">

                                <canvas id="myChart2"></canvas>

                                <script>

                                    var ctx = document.getElementById('myChart2').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'radar',

                                        data: {
                                            labels: [
                                                "Health", "Relationship", "Self improvement", "Finance", "Hobbies"],
                                            datasets: [{
                                                label: 'All goals',
                                                backgroundColor: 'rgba(75, 192, 192, 0.2)' ,
                                                borderColor: 'rgba(75, 192, 192, 1)' ,
                                                pointBackgroundColor:'rgba(75, 192, 192, 1)' ,
                                                data: [${countCategoryHealth}, ${countCategoryRelationship}, ${countCategorySelfImprovement}, ${countCategoryFinance} ,${countCategoryHobbies}]
                                            }]
                                        },
                                        options: {
                                            title: {
                                                display: true,
                                                text: 'Statistic by category'
                                            }
                                        }
                                    });

                                </script>

                            </div>
                        </div>
                    </div>


                    </div>
                </div>
            </div>
            <div>

<%--<c:forEach items="${ListCategor}" var="goal">--%>
    <%--<c:if test="${goal.user.id == currentUser.id}">--%>
        <%--<div class="col-sm-8 aboutGoal">--%>
            <%--<h5>${goal.goalName}</h5>--%>
            <%--<p>${goal.goalDesc}</p>--%>
            <%--<p style="margin-top: 1%"> Deadline: <span  style="color: firebrick;"><fmt:formatDate value="${go.deadline}" pattern="dd-MM-yyyy"/></span></p>--%>

        <%--</div>--%>
    <%--</c:if>--%>
<%--</c:forEach>--%>
            </div>
        </div>
    </div>
</div>
<%@include file="tmp/footerUser.jsp"%>
