<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/headerUser.jsp" %>

<div class="autoheight">
    <!-- Navbar -->
    <nav class="navbar navbar-light bg-light ">
        <a class="navbar-item mr-auto ml-3" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="oi oi-cog"></span></a>
        <a class="navbar-brand ml-auto mr-auto" href="#">AIM</a>
        <span class="navbar-text ml-auto mr-3">
      	Hello, <b>User User!</b>
    	</span>
        <a class="navbar-item mr-3">
            <img src="../../resources/img/avatar.png" width="30" height="30" class="rounded-circle" alt="">
        </a>

    </nav>
    <div class="collapse" id="collapseExample" style="position: absolute;left: 10px;">
        <ul class="list-group">
            <li class="list-group-item"><a href="/settings">Settings</a></li>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
            <li class="list-group-item"><a href="/logout">Exit</a></li>
        </c:if>
        </ul>
    </div>
    <!-- navbar end -->
    <!-- main section -->
    <div class="container">
        <div class="row mt-5">
            <div class="col text-center">
                <h2>Your goals for a <select class="form-control" style="display: inline-block; width: 15%;">
                    <option>Day</option><option>Week</option><option>Month</option><option>Year</option>
                </select></h2>
            </div>
        </div>
        <div class="container-fluid">
            <div  class="row ml-5 mr-5 mt-4 justify-content-center">
                <div class="col" style="max-width: 1400px">
                    <div class="card autoheight1" style="overflow-y: auto;">
                        <div class="list-group list-group-flush">
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title1</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title2</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title3</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title4</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title5</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title6</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>
                            <div class="list-group-item autoheight2 row m-0">
                                <div class="col-sm-8">
                                    <h5>Card title7</h5>
                                    <p >Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>

                                </div>
                                <div class="col-sm-2 mTop">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-plus"></span></a>
                                </div>
                                <div class="col-sm-1 text-center mTop">
                                    <a href="#"><span class="oi oi-pencil"></span></a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main section end -->


    </div>
<%@include file="tmp/footerUser.jsp"%>