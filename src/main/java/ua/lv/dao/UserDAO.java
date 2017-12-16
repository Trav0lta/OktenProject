package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.User;

import java.util.List;

/**
 * Created by User on 19.10.2017.
 */
public interface UserDAO extends JpaRepository<User,Integer> {
    @Query("from User u where u.username=:username")
    User findByUserName(@Param("username")String username);

    @Query("from User u where u.id=:id")
    User findOne(@Param("id")int id);

    @Modifying
    @Query("update User user set user.password=:password where user.id=:id ")
    void updatePassword(@Param("id") int id, @Param("password") String password);

    @Modifying
    @Query("update User set firstName=:firstName, lastName=:lastName, email=:email, username=:username where id=:id ")
    void updateUser(@Param("id") int id, @Param("firstName") String firstName,
                    @Param("lastName") String lastName, @Param("email") String email, @Param("username") String username);

    @Modifying
    @Query("update User set avatar=:avatar where username=:username")
    void updateAvatar(@Param("username") String username, @Param("avatar") String avatar);

    @Modifying
    @Query("update User set finishedAllGoals=:finishedAllGoals, finishedSucssesGoals=:finishedSucssesGoals where id=:id ")
    void updateFinishedSucssesGoals(@Param("id") int id, @Param("finishedAllGoals") int finishedAllGoals, @Param("finishedSucssesGoals") int finishedSucssesGoals);

    @Modifying
    @Query("update User set finishedAllGoals=:finishedAllGoals, finishedFailedGoals=:finishedFailedGoals where id=:id ")
    void updateFinishedFailedGoals(@Param("id") int id, @Param("finishedAllGoals") int finishedAllGoals, @Param("finishedFailedGoals") int finishedFailedGoals);





    List<User> findAll();


}
