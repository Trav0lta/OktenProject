package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
@Controller
public class AdminController {
    @Autowired
    private UserService userService;





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
}
