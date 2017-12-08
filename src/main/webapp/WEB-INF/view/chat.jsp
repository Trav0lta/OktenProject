<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="tmp/header.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stomp.js"></script>

<nav class="navbar navbar-light bg-light ">
        <ul class="pull-left">
            <li><a href="/account" class="btn btn-header btn-back"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a></li>
        </ul>
    <a class="navbar-brand ml-auto mr-auto" href="#">AIM | Chat</a>
</nav>

<div onload="disconnect()" class="container poster">
    <div>
        <input type="text" id="from" placeholder="Choose a nickname"/>
    </div>
    <br/>
    <div>
        <button id="connect" onclick="connect();">Connect</button>
        <button id="disconnect" disabled="disabled" onclick="disconnect();">Disconnect</button>
    </div>
    <br/>
    <div id="conversationDiv">
        <input type="text" id="text" placeholder="Write a message..."/>
        <button id="sendMessage" onclick="sendMessage();">Send</button>
        <p id="response"></p>
    </div>
</div>

<%@include file="tmp/footer.jsp"%>

