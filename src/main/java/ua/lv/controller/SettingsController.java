package ua.lv.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.util.Date;

@Controller
public class SettingsController {



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

    @GetMapping("/editProfile")
    public String toEditProfileVav (Model model,
                                Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        return "editProfile"; }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public String updateProfile(@ModelAttribute("currentUser")User userFromRequest) {

        String userUsername = userFromRequest.getUsername();
        System.out.println(userUsername);

        User userFromDb = userService.findByName(userUsername);

//        Integer userId = userFromRequest.getId();
//        System.out.println(userId);
//
//        User userFromDb = userService.findOne(userId);

                userFromDb.setFirstName(userFromRequest.getFirstName());
                userFromDb.setLastName(userFromRequest.getLastName());
                userFromDb.setEmail(userFromRequest.getEmail());
                userFromDb.setUsername(userFromRequest.getUsername());
//                String password = userFromRequest.getPassword();
//                if (password != null && !"".equals(password)) {
//                    userFromDb.setPassword(passwordEncoder.encode(password));
//                }
                userFromDb.setId(userFromDb.getId());
                userService.save(userFromDb);

        return "redirect:/settings";
    }

    @GetMapping("/editYourAva")
    public String tochangeava (Model model,
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
        userService.save(user);
        return "redirect:/settings";
    }





}
