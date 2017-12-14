package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Account;
import ua.lv.entity.User;
import ua.lv.service.AccountService;
import ua.lv.service.UserService;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
@Controller
public class AccountController {
    @Autowired
    AccountService accountService;
    @Autowired
    UserService userService;


    @GetMapping("/account")
    public String toWelcome(Model model,
                            Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal",new Account());
        model.addAttribute("goalList", accountService.findAll());
        return "account";
    }


    @GetMapping("/yourCurGoals")
    public String toYourCurGoals () {

        return "redirect:/account";
    }



    @GetMapping("/yourSuccesfulGoals")
    public String toYourSuccesfulGoals (Model model,
                     Principal principal) {
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal", new Account());
        model.addAttribute("goalList", accountService.findAll());
        return "succesfulGoals";
    }

    @GetMapping("/yourFailedGoals")
    public String yourFailedGoals (Model model,
                             Principal principal) {
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal", new Account());
        model.addAttribute("goalList", accountService.findAll());
        return "failedGoals";
    }

    @GetMapping("/yourStatistic")
    public String toStatic(Model model,
                             Principal principal) {
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal", new Account());
        model.addAttribute("goalList", accountService.findAll());
        return "statisticOfUser";
    }









    }