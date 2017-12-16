package ua.lv.service;

import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.Date;
import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
public interface AccountService {
    void save(Account account);

    Account findByAccountInterest(String goalName);

    Account findById(int id);
//    Account findGoalsByUserId(int id);

    void updateProgress(int id, int currentGoalCrNum);
    void updateStatusFailed(int id, boolean statusFailed,  boolean statusFinished, Date dateOfFinishGoal, long days);
    void updateStatusFinished(int id,  boolean statusFinished, Date dateOfFinishGoal, long days);
    void updateDays (int id, long days);


    void updateGoal (int id, String goalName, String goalDesc, String goalCrName, int goalCrNum);

    void delete(int id);
    void  delete (int id, Account account);

    List<Account> findAll();
    Account findOne(int id);

}
