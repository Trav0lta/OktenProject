package ua.lv.service;


import ua.lv.entity.User;

/**
 * Created by Юра on 06.10.2017.
 */
public interface MailService {
    void send(User user);
}
