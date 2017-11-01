<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerGoal.jsp" %>

<div class="autoheight" id="goal">
    <nav class="navbar navbar-light bg-light ">
        <a class="navbar-item mr-auto ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM</a>
        <span class="navbar-text ml-auto mr-3">
      	Hello, <b>${currentUser.firstName} ${currentUser.lastName}</b>
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

    <div class="container autoheightS">
        <div class="row align-items-center h-100">
            <div class="col-12">
                <form method="POST" action="goal">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="goalName">Goal name:</label>
                            <input type="text" name="goalName" class="form-control" id="goalName" placeholder="Name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="category">Category:</label>
                            <select name="category" class="form-control" id="category">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="goalDesc">Goal description:</label>
                            <textarea class="form-control" name="goalDesc" id="goalDesc" rows="3"></textarea>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="datepicker">Deadline:</label>
                            <input name="Deadline" id="datepicker" width="276" />
                            <script>
                                $('#datepicker').datepicker({
                                    uiLibrary: 'bootstrap4',
                                    iconsLibrary: 'fontawesome'
                                });
                            </script>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="goalCrName">Criterion of achivement:</label>
                            <input type="text" name="goalCrName" class="form-control" id="goalCrName" placeholder="Criterion">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="goalCrNum">Quantity:</label>
                            <input type="number" name="goalCrNum" min="1" class="form-control" id="goalCrNum" placeholder="Quantity">
                        </div>
                    </div>
                    <div class="form-row"> class="form-group col-md-3">
                        <button type="reset" class="btn btn-outline-danger">Cancel</button>
                        <input type="submit" class="btn btn-outline-success"/>
                        <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="tmp/footerUser.jsp"%>