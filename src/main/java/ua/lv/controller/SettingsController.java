package ua.lv.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.security.Principal;

@Controller
public class SettingsController {

    @Autowired
    UserService userService;

    @GetMapping("/settings")
    public String toSettings(Model model,
                             Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        return "settings";
    }

    @GetMapping("/edit-profile")
    public String toEditProfile(Model model,
                                Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        return "edit-profile"; }


}
