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
import java.util.ArrayList;
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
                            Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

        int id;
        Date dateStart;
        Date dateDeadline;
        boolean statist=false;
        List<Account> accounts = accountService.findGoalsByUserId(byUsername.getId());
        for (int i = 0; i < accounts.size(); i++) {

            System.out.println(accounts.get(i));
            id = accounts.get(i).getId();
            dateStart = accounts.get(i).getDateOfStartGoal();
            dateDeadline = accounts.get(i).getDeadline();
            Date date = new Date();
            long diff = dateDeadline.getTime() - dateStart.getTime();
            long days = TimeUnit.MILLISECONDS.toDays(diff) + 1;
            Long daysChecked;
            if (days<1){
                daysChecked= Long.valueOf(0);
            }else{
                daysChecked = days;
            }


            if (dateDeadline.before(date) == true) {
                String newReasonOfFailed = new String("Failed Deadline");
                accountService.updateStatusFailed(id, true, true, dateDeadline, daysChecked, newReasonOfFailed);
//                statist=true;
            }
        }
        if (statist==true){
            User user = userService.findOne(byUsername.getId());
            int newFinishG = user.getFinishedAllGoals()+1;
            int newFeilG = user.getFinishedFailedGoals()+1;
            userService.updateFinishedFailedGoals(byUsername.getId(), newFinishG, newFeilG);}

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
        int b =  accountService.findAllCurrentGoals(byUsername.getId(), true);
        int procentSucsses;
        if (b==0){
            procentSucsses = 0;
        }
        else {
            procentSucsses = a*100/b;
        }

        model.addAttribute("countCategoryHealth", accountService.findAllByCategoryIs(byUsername.getId(), "Health"));
        model.addAttribute("countCategoryRelationship", accountService.findAllByCategoryIs(byUsername.getId(), "Relationship"));
        model.addAttribute("countCategorySelfImprovement", accountService.findAllByCategoryIs(byUsername.getId(), "Self improvement"));
        model.addAttribute("countCategoryFinance", accountService.findAllByCategoryIs(byUsername.getId(), "Finance"));
        model.addAttribute("countCategoryHobbies", accountService.findAllByCategoryIs(byUsername.getId(), "Hobbies"));

        model.addAttribute("countOfCurrentGoals", accountService.findAllCurrentGoals(byUsername.getId(), false));
        model.addAttribute("countOfFailedGoals", accountService.findAllFailedGoals(byUsername.getId(), true));
        model.addAttribute("countOfFinishedGoals", accountService.findAllCurrentGoals(byUsername.getId(), true));


        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal", new Account());
        model.addAttribute("goalList", accountService.findAll());
        model.addAttribute("dateOfStart", byUsername.getDateOfRegistration());

        model.addAttribute("procentSucsses", procentSucsses);
        model.addAttribute("daysWithUs", days);
        return "statisticOfUser";
    }

    @RequestMapping("/backToTheAddGoal/{id}")
    public String backToTheAdd(@PathVariable("id") int id, Model model, Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal", accountService.findOne(id));
        return "/goal";
    }









    }