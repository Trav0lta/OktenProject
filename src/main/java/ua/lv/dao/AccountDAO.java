package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.List;


/**
 * Created by User on 20.10.2017.
 */
public interface AccountDAO extends JpaRepository<Account,Integer> {
    @Query("from Account a where a.goalName=:goalName")
    Account findByAccountInterest(@Param("goalName")String goalName);

    @Modifying
    @Query("update Account set currentGoalCrNum=:currentGoalCrNum where id=:id ")
    void updateProgress(@Param("id") int id, @Param("currentGoalCrNum") int currentGoalCrNum);

    List<Account> findAll();

}
