<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

<title>Chat</title>
<link rel="stylesheet" href="/style/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/resources/js/sockjs-0.3.4.js"></script>
    <script src="/resources/js/stomp.js"></script>
</head>

<div onload="disconnect()">
    <div>
        <input type="text" id="from" placeholder="Choose a nickname"/>
    </div>
    <br />
    <div>
        <button id="connect" onclick="connect();">Connect</button>
        <button id="disconnect" disabled="disabled" onclick="disconnect();">
            Disconnect
        </button>
    </div>
    <br />
    <div id="conversationDiv">
        <input type="text" id="text" placeholder="Write a message..."/>
        <button id="sendMessage" onclick="sendMessage();">Send</button>
        <p id="response"></p>
    </div>
</div>

    <script src="/resources/js/main.js"></script>
    </body>
</html>
