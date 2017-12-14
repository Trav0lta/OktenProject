package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.security.Principal;
import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;





    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin";
    }



    @RequestMapping(value = "/showAll",method = RequestMethod.GET)
    public String showAll(Model model){
        List<User> users = userService.findAll();
        model.addAttribute("allUsers",users);
        return "admin";
    }
    @RequestMapping(value = "/deleteUser/{id}")
    public String deleteUser(@PathVariable("id") int id){
        userService.removeUser(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/editUser/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("userList", userService.findAll());
        model.addAttribute("user",userService.findOne(id));
        return "/admin";
    }

    @RequestMapping(value = "/showInfoUser/{id}")
    public String showInfo(@PathVariable("id") int id, Model model){
        model.addAttribute("user", userService.findOne(id));
        return "/userInfo";
    }




}
