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
    public String toWelcome(Model model){
        model.addAttribute("emptyAccount",new Account());
        return "account";
    }

    @GetMapping("/settings")
    public String toSettings(){
        return "settings";
    }
    @GetMapping("/goal")
    public String toGoal(){
        return "goal";
    }

    @RequestMapping(value = "account",method = RequestMethod.POST)
    public String addAccount(Model model,
                             Principal principal,
                             @RequestParam("interestName") String interestName,
                             @RequestParam("aim") String aim){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        Account account = new Account();
        account.setInterestName(interestName);
        account.setAim(aim);
        account.setUser(byUsername);
        accountService.save(account);
        return "/welcome";
    }

    @RequestMapping(value = "/showAllInterests", method = RequestMethod.GET)
    public String showAllInterests(Model model) {
        List<Account> accounts = accountService.findAll();
        model.addAttribute("AllInterestsName", accounts);
        return "welcome";
    }

    
}
