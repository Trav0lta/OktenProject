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
        model.addAttribute("emptyAccount",new Account());
        return "account";
    }

    @GetMapping("/settings")
    public String toSettings(){
        return "settings";
    }
    @GetMapping("/goal")
    public String toGoal (Model model,
                Principal principal){
            String principalName = principal.getName();
            User byUsername = userService.findByName(principalName);
            model.addAttribute("currentUser", byUsername);
          return "goal";
    }

    @GetMapping("/edit-profile")
    public String toEditProfile(){ return "edit-profile"; }

    @RequestMapping(value = "goal",method = RequestMethod.POST)
    public String addAccount(Model model,
                             Principal principal,
                             @RequestParam("goalName") String goalName,
                             @RequestParam("category") String category,
                             @RequestParam("goalDesc") String goalDesc,
                             @RequestParam("Deadline") String Deadline,
                             @RequestParam("goalCrName") String goalCrName,
                             @RequestParam("goalCrNum") String goalCrNum){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        Account account = new Account();
        account.setGoalName(goalName);
        account.setCategory(category);
        account.setGoalDesc(goalDesc);
        account.setDeadline(Deadline);
        account.setGoalCrName(goalCrName);
        account.setGoalCrNum(goalCrNum);
        account.setUser(byUsername);
        accountService.save(account);
        return "/account";
    }

    @RequestMapping(value = "/showAllInterests", method = RequestMethod.GET)
    public String showAllInterests(Model model) {
        List<Account> accounts = accountService.findAll();
        model.addAttribute("AllInterestsName", accounts);
        return "welcome";
    }

    
}
