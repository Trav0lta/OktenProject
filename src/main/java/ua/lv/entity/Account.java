package ua.lv.entity;

import javax.persistence.*;

/**
 * Created by User on 19.10.2017.
 */
@Entity
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String interestName;
    private String aim;
    @OneToOne(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInterestName() {
        return interestName;
    }

    public void setInterestName(String interestName) {
        this.interestName = interestName;
    }

    public String getAim() {
        return aim;
    }

    public void setAim(String aim) {
        this.aim = aim;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", interestName='" + interestName + '\'' +
                ", aim='" + aim + '\'' +
                '}';
    }
}
