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
});

var valid;

function checkIfFieldIsEmpty(field) {
     if (!$(field).val()) {
         $(field).css("background", "#FFFDE7");
         $(this).closest(".error-log-field").css("background", "black");
         valid = false;
         $("#empty-fields-error").show();
     } else {
         $(field).css("background", "#fff");
     }
}

function hideErrorLog() {
    $("#error-log").hide();
}

function showErrorLog() {
    $("#error-log").show();
}