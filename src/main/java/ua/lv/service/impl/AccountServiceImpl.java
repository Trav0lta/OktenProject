package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.AccountDAO;
import ua.lv.entity.Account;
import ua.lv.service.AccountService;

import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
@Service
@Transactional
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO accountDAO;

    public void save(Account account) {
        accountDAO.save(account);
    }

    public Account findByAccountInterest(String goalName) {
       return accountDAO.findByAccountInterest(goalName);
    }

    public void updateProgress(int id, int currentGoalCrNum) {
        accountDAO.updateProgress(id, currentGoalCrNum);
    }

    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    public Account findOne(int id) {
        return accountDAO.findOne(id);
    }
}
