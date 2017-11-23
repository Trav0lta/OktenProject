package ua.lv.service;

import ua.lv.entity.User;

import java.util.List;


public interface UserService {
    void save(User user);

    User findByName(String username);

    List<User> findAll();
    User findOne(int id);

    void updateUsername (int id, String username);
    void updateUser (int id, String firstName, String lastName, String email, String username, String password);

    void updateAvatar(String username, String avatar);

}
