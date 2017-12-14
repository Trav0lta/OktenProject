package ua.lv.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import ua.lv.entity.User;
import ua.lv.service.UserService;
import ua.lv.validator.UserValidator;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.util.Date;

@Controller
public class SettingsController {

    @Autowired
    UserValidator userValidator;

    @Autowired
    private PasswordEncoder passwordEncoder;
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

    @RequestMapping(value = "/updateUserSpring", method = RequestMethod.POST)
    public String updateUserSpring(Principal principal,
                                   @RequestParam int userId,
                                   @RequestParam String firstName,
                                   @RequestParam String lastName,
                                   @RequestParam String email,
                                   @RequestParam String username) {
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);

        userService.updateUser(byUsername.getId(), firstName, lastName, email, username);
        return "redirect:/settings";
    }

    @GetMapping("/editPassword")
    public String toChangePass(Model model,
                                Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        return "edit-password"; }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePass(Principal principal,
                                   @RequestParam int userId,
                                   @RequestParam String password) {
        String principalName = principal.getName();
        User user = userService.findByName(principalName);


        userService.updatePassword(user, user.getId(),  passwordEncoder.encode(password));
        return "redirect:/settings";
    }

    @GetMapping("/editYourAva")
    public String toChangeAva (Model model,
                               Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        return "/changeAva"; }

    @RequestMapping(value = "/changeAvatar", method = RequestMethod.POST)
    public String changeAvatar(Principal principal,
                               @RequestParam MultipartFile avatar) throws ParseException, IOException {

        String path = System.getProperty("user.home") + File.separator + "Pictures\\";
        avatar.transferTo(new File(path + avatar.getOriginalFilename()));

        User user = userService.findByName(principal.getName());
        String username= user.getUsername();


        userService.updateAvatar(username, "\\avatar\\" + avatar.getOriginalFilename());
        return "redirect:/settings";
    }





}
