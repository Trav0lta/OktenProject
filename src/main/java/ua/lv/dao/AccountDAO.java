package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.Date;
import java.util.List;


/**
 * Created by User on 20.10.2017.
 */
public interface AccountDAO extends JpaRepository<Account,Integer> {
    @Query("from Account a where a.goalName=:goalName")
    Account findByAccountInterest(@Param("goalName")String goalName);


//    @Query("from Account a where a.id=:id")
//    Account findByAccountInterest(@Param("id")int id);

    @Query("from Account account where account.user.id=:id")
    List<Account> findGoalsByUserId(@Param("id") int id);

    @Modifying
    @Query("update Account set currentGoalCrNum=:currentGoalCrNum where id=:id ")
    void updateProgress(@Param("id") int id, @Param("currentGoalCrNum") int currentGoalCrNum);

    @Modifying
    @Query("update Account set goalName=:goalName, goalDesc=:goalDesc, goalCrName=:goalCrName,  goalCrNum=:goalCrNum where id=:id ")
    void updateGoal(@Param("id") int id, @Param("goalName") String goalName, @Param("goalDesc") String goalDesc, @Param("goalCrName") String goalCrName, @Param("goalCrNum") int goalCrNum );

    @Modifying
    @Query("update Account set statusFailed=:statusFailed, statusFinished=:statusFinished, dateOfFinishGoal=:dateOfFinishGoal, days=:days, reasonOfFailed =:reasonOfFailed where id=:id ")
    void updateStatusFailed(@Param("id") int id, @Param("statusFailed") boolean statusFailed, @Param("statusFinished") boolean statusFinished, @Param("dateOfFinishGoal") Date dateOfFinishGoal, @Param("days") long days, @Param("reasonOfFailed") String reasonOfFailed );

    @Modifying
    @Query("update Account set statusFinished=:statusFinished, dateOfFinishGoal=:dateOfFinishGoal, days=:days where id=:id ")
    void updateStatusFinished (@Param("id") int id, @Param("statusFinished") boolean statusFinished, @Param("dateOfFinishGoal") Date dateOfFinishGoal, @Param("days") long days);

    @Modifying
    @Query("update Account set days=:days where id=:id ")
    void updateDays (@Param("id") int id, @Param("days") long days);

    List<Account> findAll();

    @Query("select count(account.id)  from Account account where account.user.id=:userId and account.category=:category")
    int findAllByCategoryIs(@Param("userId") int userId, @Param("category") String category);

    @Query("select count(account.id)  from Account account where account.user.id=:userId and account.statusFinished=:statusFinished")
    int findAllCurrentGoals (@Param("userId") int userId, @Param("statusFinished") boolean statusFinished);

    @Query("select count(account.id)  from Account account where account.user.id=:userId and account.statusFailed=:statusFailed")
    int findAllFailedGoals (@Param("userId") int userId, @Param("statusFailed") boolean statusFailed);



}
