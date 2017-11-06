<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp" %>

<div id="profile-settings">
    <div class="field-editable">
        <h4 id="name" class="user-field-edit">${currentUser.firstName}</h4>
        <div id="name-edit" class="btn">Edit</div>
    </div>

    <div class="field-editable">
        <h4 id="lastname" class="user-field-edit">${currentUser.lastName}</h4>
        <div id="lastname-edit" class="btn">Edit</div>
    </div>

    <div class="field-editable">
        <h4 id="email" class="user-field-edit">${currentUser.email}</h4>
        <div id="email-edit" class="btn">Edit</div>
    </div>

    <div class="field-editable">
        <h4 id="nickname" class="user-field-edit">${currentUser.username}</h4>
        <div id="nickname-edit" class="btn">Edit</div>
    </div>

    <div class="field-editable">
        <h4 id="password" class="user-field-edit">Please enter your new password</h4>
        <h4 id="confirmNewPassword" class="user-field-edit">Please confirm your new password</h4>
        <div id="password-edit" class="btn">Edit</div>
    </div>
</div>

</body>
</html>
