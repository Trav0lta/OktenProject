package ua.lv.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ua.lv.entity.User;
import ua.lv.service.UserService;

@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;

    public boolean supports(Class<?> aClass) {
        return aClass.equals(User.class);
    }

    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "error","This field is required.");
        if (user.getUsername().length() < 3 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "error","Username must be between 3 and 32 characters.");
        }

        if (userService.findByName(user.getUsername()) != null) {
            errors.rejectValue("username", "error","Such username already exists.");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error","This field is required.");
        if (user.getPassword().length() < 4 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "error","Password must be over 4 characters.");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "error","Password don't match.");
        }
    }
}
