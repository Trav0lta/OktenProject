package ua.lv.service;

import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
public interface AccountService {
    void save(Account account);

    Account findByAccountInterest(String goalName);

    void updateProgress(int id, int currentGoalCrNum);
    void updateGoal (int id, String goalName, String goalDesc, int goalCrNum);

    void delete(int id);
    void  delete (int id, Account account);

    List<Account> findAll();
    Account findOne(int id);

}
