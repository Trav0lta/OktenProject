<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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


    <div class="container autoheightS">

        <div class="row pt-4">
            <div class="col text-center">
                <form>
                    <a class="btn btn-outline-primary" href="/yourCurGoals" role="button">Current</a>
                    <a class="btn btn-outline-primary" href="/yourSuccesfulGoals" role="button">Successful</a>
                    <a class="btn btn-outline-primary" href="/yourFailedGoals" role="button">Failed</a>
                    <a class="btn btn-outline-primary" href="/yourStatistic" role="button">Statistic</a>
                    <a href="/goal" class="btn btn-outline-success" role="button">Add goal</a>
                </form>
            </div>
        </div>
        <div class="row align-items-center pt-5">
            <div class="col-12">
                <form:form id="addNewGoal" action="/saveNewGoal" modelAttribute="emptyGoal">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form:label path="goalName">
                                <spring:message text="Goal"/>
                            </form:label>
                            <form:input path="goalName" class="form-control input-goal" id="goalName" placeholder="Name"/>
                        </div>
                        <div class="form-group col-md-6">
                            <form:label path="category">
                                <spring:message text="Category"/>
                            </form:label>
                            <form:select path="category" class="form-control input-goal" id="category">
                                <option>Health</option>
                                <option>Relationship</option>
                                <option>Self improvement</option>
                                <option>Finance</option>
                                <option>Hobbies</option>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form:label path="goalDesc">
                                <spring:message text="Desc"/>
                            </form:label>
                            <form:textarea path="goalDesc" class="form-control input-goal" name="goalDesc" id="goalDesc" rows="3"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="deadline">Deadline</label>
                            <input type="date" class="input-goal" id="deadline" name = "deadline" width="276"/>
                            <form:errors name="deadline" class="cs"/>
                            <%--<script>--%>
                                <%--$('#deadline').datepicker({--%>
                                    <%--uiLibrary: 'bootstrap4',--%>
                                    <%--iconsLibrary: 'fontawesome'--%>
                                <%--});--%>
                            <%--</script>--%>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form:label path="goalCrName">
                                <spring:message text="Criterion"/>
                            </form:label>
                            <form:input path="goalCrName" class="form-control input-goal" id="goalCrName" placeholder="Criterion"/>
                        </div>
                        <div class="form-group col-md-6">
                            <form:label path="goalCrNum">
                                <spring:message text="Quantity (only numbers)"/>
                            </form:label>
                            <form:input type="number" path="goalCrNum" min="1" class="form-control input-goal" id="goalCrNum" placeholder="Quantity"/>
                            <form:errors path="goalCrNum" class="cs"/>
                        </div>
                    </div>
                    <div class="form-row"> <div  class="form-group col-md-3">
                        <button type="reset" class="btn btn-outline-danger">Reset</button>
                        <div class="btn btn-outline-success submit">Save goal</div>
                        <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $(".input-goal").blur(function () {
            if (!$(this).val()) {
                $(this).css("background", "#FFFDE7");
            } else {
                $(this).css("background", "#FFF");
            }
        });
        $(".submit").click(function() {
            var valid = true;
            $(".input-goal").each(function() {
                if (!$(this).val()) {
                    $(this).css("background", "#FFFDE7");
                    valid = false;
                } else {
                    $(this).css("background", "#FFF")
                }
            });

            if (valid) {
                $("#addNewGoal").submit();
            }
        });
    });
</script>

<%@include file="tmp/footerUser.jsp"%>
