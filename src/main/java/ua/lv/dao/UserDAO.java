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
    @Query("update User set username=:username where id=:id ")
    void updateUsername(@Param("id") int id, @Param("username") String username);

    @Modifying
    @Query("update User set firstName=:firstName, lastName=:lastName, email=:email, username=:username, password=:password  where id=:id ")
    void updateUser(@Param("id") int id, @Param("firstName") String firstName,
                    @Param("lastName") String lastName, @Param("email") String email, @Param("username") String username, @Param("password") String password);

    @Modifying
    @Query("update User set avatar=:avatar where username=:username")
    void updateAvatar(@Param("username") String username, @Param("avatar") String avatar);

    List<User> findAll();


}
