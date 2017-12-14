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
        </form>
    </nav>

    <div id="top-section">
        <div class="container">
            <div class="poster">
                <h1>Goal Tracker</h1>
                <p>Set goals & crush 'em!</p>
            </div>
        </div>
    </div>

    <div id="main-features">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="../../resources/img/landing/goal.png">
                    <br>
                    Set new goal
                </div>
                <div class="col-md-3">
                    <img src="../../resources/img/landing/analytics.png">
                    <br>
                    Monitor your progress
                </div>
                <div class="col-md-3">
                    <img src="../../resources/img/landing/planning.png">
                    <br>
                    Set deadline and stick to it!
                </div>
                <div class="col-md-3">
                    <img src="../../resources/img/landing/chronometer.png">
                    <br>
                    Voila! Done!
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
                    <h3>Be a SMART "goal digger"</h3>
                    <p>
                        A useful way of making goals more powerful is to use the SMART mnemonic.

                    <ul>
                        <li>S - Specific (or Significant).</li>
                        <li>M - Measurable (or Meaningful).</li>
                        <li>A - Attainable (or Action-Oriented).</li>
                        <li>R - Relevant (or Rewarding).</li>
                        <li>T - Time-bound (or Trackable)</li>
                    </ul>

                    </p>
                </div>
            </div>
        </div>
    </div>

    <div id="second-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h3>8 Ways to Motivate Yourself From the Beginning</h3>
                    <p>
                    <ul>
                        <li>Start small.</li>
                        <li>Start with 2-3 goals.</li>
                        <li>Examine your motivation.</li>
                        <li>Really, really want it.</li>
                        <li>Commit publicly.</li>
                        <li>Get excited.</li>
                        <li>Build anticipation.</li>
                        <li>Print it out, post it up.</li>
                    </ul>
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
