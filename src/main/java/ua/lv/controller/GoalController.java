package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Account;
import ua.lv.entity.User;
import ua.lv.service.AccountService;
import ua.lv.service.UserService;
import ua.lv.validator.AccountValidator;

import java.security.Principal;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * Created by User on 20.10.2017.
 */
@Controller
public class GoalController {
    @Autowired
    AccountService accountService;
    @Autowired
    UserService userService;
    @Autowired
    AccountValidator accountValidator;



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
                          BindingResult bindingResult) {
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        accountValidator.validate(account, bindingResult);
        if(bindingResult.hasErrors()){
            return "goal";
        }else{
        account.setUser(byUsername);
        accountService.save(account);
        return "redirect:/account";}
    }

    @RequestMapping(value = "/backToAccount" ,method = RequestMethod.GET)
    public String backAc(){
        return "redirect:/account";
    }

    @RequestMapping(value = "/changeGoal" ,method = RequestMethod.POST)
    public String changeProgress( @RequestParam int currentGoalCrNum,
                                  @RequestParam int goalCrNum,
                                  @RequestParam int goalId,
                                  @RequestParam("userId") int userId){
        boolean statusFinish = true;
        if (currentGoalCrNum == goalCrNum) {
            Date date = new Date();
            Account account = accountService.findById(goalId);
            Date dateStart = account.getDateOfStartGoal();
             long diff = date.getTime()-dateStart.getTime();
            long days = TimeUnit.MILLISECONDS.toDays(diff)+1;
            accountService.updateStatusFinished(goalId, statusFinish, date, days);

            User user = userService.findOne(userId);
            int newFinishG = user.getFinishedAllGoals()+1;
            int newSucsG = user.getFinishedSucssesGoals()+1;
            userService.updateFinishedSucssesGoals(userId, newFinishG, newSucsG);
        }
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
    public String updateStatusFailed( @RequestParam("id") int id,
                                      @RequestParam("userId") int userId){
        boolean statusFail = true;
        Date date = new Date();
        Account account = accountService.findById(id);
        Date dateStart = account.getDateOfStartGoal();
        long diff = date.getTime()-dateStart.getTime();
        long days = TimeUnit.MILLISECONDS.toDays(diff)+1;
        String newReasonOfFailed = new String("Give up");
        accountService.updateStatusFailed(id, statusFail, statusFail, date, days, newReasonOfFailed);
        User user = userService.findOne(userId);
        int newFinishG = user.getFinishedAllGoals()+1;
        int newFeilG = user.getFinishedFailedGoals()+1;
        userService.updateFinishedFailedGoals(userId, newFinishG, newFeilG);
        return "redirect:/account";
    }


}
