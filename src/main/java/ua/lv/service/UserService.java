package ua.lv.service;

import ua.lv.entity.User;

import java.util.List;


public interface UserService {
    void save(User user);

    User findByName(String username);

    List<User> findAll();
    User findOne(int id);

    void updatePassword (User user, int id, String password);
    void updateUser (int id, String firstName, String lastName, String email, String username);

    void updateAvatar(String username, String avatar);
    void removeUser(int id);

    void updateFinishedSucssesGoals(int id, int finishedAllGoals, int finishedSucssesGoals);
    void updateFinishedFailedGoals(int id, int finishedAllGoals, int finishedFailedGoals);


}
