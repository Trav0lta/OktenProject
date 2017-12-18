package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.AccountDAO;
import ua.lv.entity.Account;
import ua.lv.service.AccountService;

import java.util.Date;
import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
@Service
@Transactional
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO accountDAO;

    public List<Account> findGoalsByUserId(int id) {
        return accountDAO.findGoalsByUserId(id);
    }


    public Account findById(int id) {
        return accountDAO.findOne(id);
    }

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

    public void updateStatusFailed(int id, boolean statusFailed, boolean statusFinished, Date dateOfFinishGoal, long days, String reasonOfFailed) {
        accountDAO.updateStatusFailed(id, statusFailed, statusFinished, dateOfFinishGoal, days, reasonOfFailed);
    }

    public void updateStatusFinished(int id, boolean statusFinished, Date dateOfFinishGoal, long days) {
        accountDAO.updateStatusFinished(id, statusFinished, dateOfFinishGoal, days);
    }

    public void updateGoal(int id, String goalName, String goalDesc, String goalCrName, int goalCrNum) {
        accountDAO.updateGoal(id, goalName, goalDesc, goalCrName, goalCrNum);
    }

    public void updateDays(int id, long days) {
        accountDAO.updateDays(id, days);
    }
    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    public int findAllByCategoryIs(int userId, String category) {
        return accountDAO.findAllByCategoryIs(userId, category);
    }

    public int findAllCurrentGoals(int userId, boolean statusFinished) {
        return accountDAO.findAllCurrentGoals(userId, statusFinished);
    }

    public int findAllFailedGoals(int userId, boolean statusFailed) {
        return accountDAO.findAllFailedGoals(userId, statusFailed);
    }

    public Account findOne(int id) {
        return accountDAO.findOne(id);
    }
}
