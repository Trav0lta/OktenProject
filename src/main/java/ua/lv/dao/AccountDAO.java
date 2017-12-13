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

//    @Query("select Account from Account account join fetch account.user where account.user.id=:id")
//    Account findGoalsByUserId(@Param("id") int id);

    @Modifying
    @Query("update Account set currentGoalCrNum=:currentGoalCrNum where id=:id ")
    void updateProgress(@Param("id") int id, @Param("currentGoalCrNum") int currentGoalCrNum);

    @Modifying
    @Query("update Account set goalName=:goalName, goalDesc=:goalDesc, goalCrName=:goalCrName,  goalCrNum=:goalCrNum where id=:id ")
    void updateGoal(@Param("id") int id, @Param("goalName") String goalName, @Param("goalDesc") String goalDesc, @Param("goalCrName") String goalCrName, @Param("goalCrNum") int goalCrNum );

    @Modifying
    @Query("update Account set statusFailed=:statusFailed, statusFinished=:statusFinished where id=:id ")
    void updateStatusFailed(@Param("id") int id, @Param("statusFailed") boolean statusFailed, @Param("statusFinished") boolean statusFinished);

    @Modifying
    @Query("update Account set statusFinished=:statusFinished where id=:id ")
    void updateStatusFinished (@Param("id") int id, @Param("statusFinished") boolean statusFinished);


    List<Account> findAll();

}
