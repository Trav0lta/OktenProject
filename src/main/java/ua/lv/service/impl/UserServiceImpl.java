package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.UserDAO;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.util.List;

/**
 * Created by User on 19.10.2017.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService,UserDetailsService{
    @Autowired
    UserDAO userDAO;
    @Autowired
    PasswordEncoder passwordEncoder;



    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDAO.save(user);
    }

    public User findByName(String username) {
        return userDAO.findByUserName(username);
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return findByName(username);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findOne(int id) {
        return userDAO.findOne(id);
    }
}
