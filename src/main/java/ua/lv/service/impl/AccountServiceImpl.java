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

//    public Account findGoalsByUserId(int id) {
//        return accountDAO.findGoalsByUserId(id);
//    }

    public void save(Account account) {
        accountDAO.save(account);
    }

    public void delete(int id, Account account) {
        accountDAO.delete(id);
    }

    public void delete(int id) {
        accountDAO.delete(id);
    }

    public Account findByAccountInterest(String goalName) {
       return accountDAO.findByAccountInterest(goalName);
    }

    public void updateProgress(int id, int currentGoalCrNum) {
        accountDAO.updateProgress(id, currentGoalCrNum);
    }

    public void updateStatusFailed(int id, boolean statusFailed, boolean statusFinished) {
        accountDAO.updateStatusFailed(id, statusFailed, statusFinished);
    }

    public void updateStatusFinished(int id, boolean statusFinished) {
        accountDAO.updateStatusFinished(id, statusFinished);
    }

    public void updateGoal(int id, String goalName, String goalDesc, String goalCrName, int goalCrNum) {
        accountDAO.updateGoal(id, goalName, goalDesc, goalCrName, goalCrNum);
    }

    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    public Account findOne(int id) {
        return accountDAO.findOne(id);
    }
}
