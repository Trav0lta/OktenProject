package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Account;
import ua.lv.entity.User;
import ua.lv.service.AccountService;
import ua.lv.service.UserService;

import java.security.Principal;
import java.util.Date;

/**
 * Created by User on 20.10.2017.
 */
@Controller
public class GoalController {
    @Autowired
    AccountService accountService;
    @Autowired
    UserService userService;



    @GetMapping("/goal")
    public String toGoal (Model model,
                Principal principal){
            model.addAttribute("emptyGoal", new Account());
            String principalName = principal.getName();
            User byUsername = userService.findByName(principalName);
            model.addAttribute("currentUser", byUsername);
          return "goal";
    }

    @RequestMapping(value = "/saveNewGoal" ,method = RequestMethod.POST)
    public String addGoal(Model model,Principal principal,@ModelAttribute("emptyGoal") Account account,
                          @RequestParam String deadline){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        account.setUser(byUsername);
        accountService.save(account);
        return "redirect:/account";
    }

    @RequestMapping(value = "/backToAccount" ,method = RequestMethod.GET)
    public String backAc(){
        return "redirect:/account";
    }

    @RequestMapping(value = "/changeGoal" ,method = RequestMethod.POST)
    public String changeProgress( @RequestParam int currentGoalCrNum,
                                  @RequestParam int goalId,
                                 Principal principal){
        accountService.updateProgress(goalId, currentGoalCrNum);
        return "redirect:/account";
    }

    @RequestMapping(value = "/editGoal" ,method = RequestMethod.POST)
    public String updateGoal( @RequestParam int goalId,
                              @RequestParam String goalName,
                              @RequestParam String goalDesc,
                              @RequestParam String goalCrName,
                              @RequestParam int goalCrNum){
        accountService.updateGoal(goalId, goalName,goalDesc, goalCrName, goalCrNum);
        return "redirect:/account";
    }
    @RequestMapping(value = "/deleteGoal" ,method = RequestMethod.POST)
    public String deleteGoal( @RequestParam("id") int id){
        accountService.delete(id);
        return "redirect:/account";
    }

    @RequestMapping(value = "/failGoal" ,method = RequestMethod.POST)
    public String updateStatusFailed( @RequestParam("id") int id){
        boolean statusFail = true;
        accountService.updateStatusFailed(id, statusFail, statusFail);
        return "redirect:/account";
    }





}
