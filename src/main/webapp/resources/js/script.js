$(document).ready(function () {

    $("#error-log li").hide();

    // Check if empty
    $("#sign-up-form input").blur(function () {
        checkIfFieldIsEmpty(this)
    });

    // Check email
    $("#validationRegisterEmail").blur(function () {
        if (!$("#validationRegisterEmail").val()||!$("#validationRegisterEmail").val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
            $("#validationRegisterEmail").css("background", "#FFFDE7");
            $("#invalid-email-error").show();
            valid = false;
        } else {
            $("#validationRegisterEmail").css("background", "#fff");
            $("#invalid-email-error").hide();
        }
    });

    // Check if password are correct
    $("#validationRegister02").blur(function () {
        if ($("#validationRegister03").val() !== $("#validationRegister02").val() || !$("#validationRegister03").val() || !$("#validationRegister02").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister03").css("background", "#FFFDE7");
            $("#passwords-conflict-error").show();
        } else {
            $("#validationRegister03").css("background", "#fff");
            $("#passwords-conflict-error").hide();
        }
    });

    $("#validationRegister03").blur(function () {
        if ($("#validationRegister03").val() !== $("#validationRegister02").val() || !$("#validationRegister03").val() || !$("#validationRegister03").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister03").css("background", "#FFFDE7");
            $("#passwords-conflict-error").show();
        } else {
            $("#validationRegister03").css("background", "#fff");
            $("#passwords-conflict-error").hide();
        }
    });

    $("#validationRegister02").blur(function () {
        if (!$("#validationRegister02").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister02").css("background", "#FFFDE7");
            $("#invalid-password-error").show();
        } else {
            $("#validationRegister02").css("background", "#fff");
            $("#invalid-password-error").hide();
        }
    });


    // Check if username
    $("#validationRegister01").blur(function () {
        if (!$("#validationRegister01").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister01").css("background", "#FFFDE7");
            $("#invalid-username-error").show();
        } else {
            $("#validationRegister01").css("background", "#fff");
            $("#invalid-username-error").hide();
        }
    });


    // Click for submit
    $("#sign-up-submit").click(function () {
        valid = true;

        // Check if empty
        $(".required-sign-up-field").each(function () {
            checkIfFieldIsEmpty(this);
        });

        // Check email
        if (!$("#validationRegisterEmail").val()||!$("#validationRegisterEmail").val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
            $("#validationRegisterEmail").css("background", "#FFFDE7");
            valid = false;
        } else {
            $("#validationRegisterEmail").css("background", "#fff");
        }

        // Check passwords
        if ($("#validationRegister03").val() !== $("#validationRegister02").val() || !$("#validationRegister03").val() || !$("#validationRegister02").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister03").css("background", "#FFFDE7");
            valid = false;
        } else {
            $("#validationRegister03").css("background", "#fff");
        }

        if ($("#validationRegister03").val() !== $("#validationRegister02").val() || !$("#validationRegister03").val() || !$("#validationRegister03").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister03").css("background", "#FFFDE7");
            valid = false;
        } else {
            $("#validationRegister03").css("background", "#fff");
        }

        if (!$("#validationRegister02").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister02").css("background", "#FFFDE7");
            valid = false;
        } else {
            $("#validationRegister02").css("background", "#fff");
        }

        // Check username
        if (!$("#validationRegister01").val().match(/^[a-zA-Z0-9]{4,}$/)) {
            $("#validationRegister01").css("background", "#FFFDE7");
            valid = false;
        } else {
            $("#validationRegister01").css("background", "#fff");
        }

        // Success
        if (valid) {
            $("#sign-up-form").submit();
        }
    });

    // Profile Settings
    $(".field-editable .edit-btn").click(function () {
        if ($(this).attr('id') === 'password-edit') {
            var btnId = $(this).attr("id");
            $(".field-editable .edit-btn").hide();
            btnId = btnId.slice(0, -5);
            var field = $("#"+btnId);
            var oldValue = field.text();
            var editableField = "<div class='temp-edit-block'><input class='edit-input password-field-change' placeholder='New password' type='password'><input class='edit-input password-field-change-confirm' placeholder='Repeat new password' type='password'><div class='row'><div class='save-field col-md-3'><i class=\"fa fa-check\" aria-hidden=\"true\"></i></div><div class='cancel-field col-md-3'><i class=\"fa fa-times\" aria-hidden=\"true\"></i></div></div></div>";
            field.after(editableField);
            field.hide();
            // $("#profile-settings input").attr('class', '').addClass("edit-input").addClass("input-"+btnId);

            $(".save-field").click(function () {
                if ($(".password-field-change").val() !== $(".password-field-change-confirm").val() || !$(".password-field-change").val() || !$(".password-field-change").val().match(/^[a-zA-Z0-9]{4,}$/)) {
                    alert("Password error")
                } else {
                    $(".temp-edit-block").remove();
                    field.show();
                    $(".field-editable .edit-btn").show()
                }
            });

            $(".cancel-field").click(function () {
                $(".temp-edit-block").remove();
                field.show();
                $(".field-editable .edit-btn").show()
            });
        } else {
            var btnId = $(this).attr("id");
            $(".field-editable .edit-btn").hide();
            btnId = btnId.slice(0, -5);
            var field = $("#" + btnId);
            var oldValue = field.text();
            var editableField = "<div class='temp-edit-block'><input class='edit-input' type='text'><div class='row'><div class='save-field col-md-3'><i class=\"fa fa-check\" aria-hidden=\"true\"></i></div><div class='cancel-field col-md-3'><i class=\"fa fa-times\" aria-hidden=\"true\"></i></div></div></div>";
            field.after(editableField);
            field.hide();
            $("#profile-settings input").attr('class', '').addClass("edit-input").addClass("input-" + btnId);
            var data = field.text();
            $(".input-" + btnId).val(data);

            $(".save-field").click(function () {
                if (btnId === "nickname") {
                    if (!$(".input-" + btnId).val() || !$(".input-" + btnId).val().match(/^[a-zA-Z0-9]{4,}$/)) {
                        alert("At least 4 characters")
                    } else {
                        field.text($(".input-" + btnId).val());
                        $(".temp-edit-block").remove();
                        field.show();
                        $(".field-editable .edit-btn").show()
                    }
                } else if (btnId === "email") {
                    if (!$(".input-" + btnId).val() || !$(".input-" + btnId).val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
                        alert("Invalid email")
                    } else {
                        field.text($(".input-" + btnId).val());
                        $(".temp-edit-block").remove();
                        field.show();
                        $(".field-editable .edit-btn").show()
                    }
                } else {
                    if (!$(".input-" + btnId).val()) {
                        alert("Can't be empty")
                    } else {
                        field.text($(".input-" + btnId).val());
                        $(".temp-edit-block").remove();
                        field.show();
                        $(".field-editable .edit-btn").show()
                    }
                }
            });

            $(".cancel-field").click(function () {
                field.text(oldValue);
                $(".temp-edit-block").remove();
                field.show();
                $(".field-editable .edit-btn").show()
            });
        }
    });

    $(".list-group-item").each(function() {
        var set = parseInt($(this).find(".max-num").text());
        var progress = parseInt($(this).find(".current-num").text());
        var status = progress/set*100;
        console.log(set, progress, status);
        $(this).find(".progress-bar").css("width", status+"%")
    });
    console.log($(".modal-body"));
    // var set = parseInt($(".max-num").text());
    // var progress = parseInt($(".current-num").text());
    // var status = set/progress*100;
    // $(".progress-bar").css("width", status+"%")

});

var valid;

function checkIfFieldIsEmpty(field) {
    if (!$(field).val()) {
        $(field).css("background", "#FFFDE7");
        $(this).closest(".error-log-field").css("background", "black");
        valid = false;
        $("#empty-fields-error").show()
    } else {
        $(field).css("background", "#fff");
        $("#empty-fields-error").hide()
    }
}

function hideErrorLog() {
    $("#error-log").hide()
}

function showErrorLog() {
    $("#error-log").show()
}