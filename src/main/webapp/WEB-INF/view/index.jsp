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

    <div id="top-section">
        <div class="container">
            <div class="poster">
                <h1>PROJECT NAME</h1>
                <p>In publishing and graphic design, lorem ipsum is a filler text or greeking commonly<br>
                    used to demonstrate the textual elements of a graphic document or visual presentation.</p>
            </div>
        </div>
    </div>

    <div id="main-features">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="../../resources/img/landing/goal.png">
                    <br>
                    Goal
                </div>
                <div class="col-md-3">
                    <img src="../../resources/img/landing/analytics.png">
                    <br>
                    Progress
                </div>
                <div class="col-md-3">
                    <img src="../../resources/img/landing/planning.png">
                    <br>
                    To-do
                </div>
                <div class="col-md-3">
                    <img src="../../resources/img/landing/chronometer.png">
                    <br>
                    Time
                </div>
            </div>
        </div>
    </div>

    <div id="first-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="../../resources/img/landing/target.png">
                </div>
                <div class="col-md-8">
                    <h3>Header</h3>
                    <p>
                        In publishing and graphic design, lorem ipsum<br>
                        is a filler text or greeking commonly used to<br>
                        demonstrate the textual elements of a graphic<br>
                        document or visual presentation.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div id="second-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h3>Header</h3>
                    <p>
                        In publishing and graphic design, lorem ipsum<br>
                        is a filler text or greeking commonly used to<br>
                        demonstrate the textual elements of a graphic<br>
                        document or visual presentation.
                    </p>
                </div>
                <div class="col-md-4">
                    <img src="../../resources/img/landing/study.png">
                </div>
            </div>
        </div>
    </div>

    <div id="pre-footer">
        <div class="container">
            <div class="poster">
                <h1>SIGN UP AND ACHIEVE YOUR GOALS</h1>
            </div>
        </div>
    </div>

    <div id="footer">
        <div class="pull-right">
            Developed by Okten
        </div>
        <div style="clear: both"></div>
    </div>

</form:form>
<%@include file="tmp/footer.jsp"%>
