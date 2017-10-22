package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.List;


/**
 * Created by User on 20.10.2017.
 */
public interface AccountDAO extends JpaRepository<Account,Integer> {
    @Query("from Account a where a.interestName=:interestName")
    Account findByAccountInterest(@Param("interestName")String interestName);

    List<Account> findAll();

}
