package ua.lv.controller;

import org.joda.time.Days;
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
import java.util.concurrent.TimeUnit;

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
                            Principal principal
                            /*@PathVariable("id") int id*/){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

//        Account account = accountService.findById(id);
//        Date dateStart = account.getDateOfStartGoal();
//        Date dateDeadline = account.getDeadline();
//        Date date = new Date();
//        long diff = date.getTime()-dateStart.getTime();
//        long days = TimeUnit.MILLISECONDS.toDays(diff)+1;
//
//        if (dateDeadline.before(date) == true){
//            accountService.updateStatusFailed(id, true,true, date, days);
//        }



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

        Date date = new Date();
        Date date1 = byUsername.getDateOfRegistration();
        long diff = date.getTime() - date1.getTime();

        long days = TimeUnit.MILLISECONDS.toDays(diff)+1;

        int a =  byUsername.getFinishedSucssesGoals();
        int b =  byUsername.getFinishedAllGoals();
        int procentSucsses = a*100/b;
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal", new Account());
        model.addAttribute("goalList", accountService.findAll());
        model.addAttribute("dateOfStart", byUsername.getDateOfRegistration());

        model.addAttribute("procentSucsses", procentSucsses);
        model.addAttribute("daysWithUs", days);
        return "statisticOfUser";
    }

    @RequestMapping("/backToTheAddGoal/{id}")
    public String backToTheAdd(@PathVariable("id") int id, Model model){
        model.addAttribute("emptyGoal", accountService.findOne(id));
        return "/goal";
    }









    }