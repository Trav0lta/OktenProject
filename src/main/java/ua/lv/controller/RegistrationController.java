package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.lv.entity.User;
import ua.lv.service.MailService;
import ua.lv.service.UserService;
import ua.lv.validator.UserValidator;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;

/**
 * Created by User on 19.10.2017.
 */
@Service
@Controller
public class RegistrationController {

    @Autowired
    UserService userService;
    @Autowired
    MailService mailService;
    @Autowired
    UserValidator userValidator;



    @GetMapping("/registration")
    public String toRegistration(Model model){
        model.addAttribute("emptyUser",new User());
        return "registration";
    }



    @RequestMapping(value = "/saveUserSpringForm", method = RequestMethod.POST)
    public String addUserSpringForm(@ModelAttribute("emptyUser") @Valid User user,
                                    BindingResult bindingResult) {
        userValidator.validate(user,bindingResult);
        if(bindingResult.hasErrors()){
            return "registration";
        }

        userService.save(user);
        //mailService.send(user);
        return "redirect:/login";
    }
}
