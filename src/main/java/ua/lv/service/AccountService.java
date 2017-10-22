package ua.lv.service;

import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
public interface AccountService {
    void save(Account account);

    Account findByInterest(String interestName);

    List<Account> findAll();
    Account findOne(int id);

}
