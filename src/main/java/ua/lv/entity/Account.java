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
    private String goalName;
    private String category;
    @Column(columnDefinition = "text")
    private String goalDesc;
    private String deadline;
    private String goalCrName;
    private int goalCrNum;
    @ManyToOne(cascade = CascadeType.MERGE,fetch = FetchType.EAGER)
    private User user;

    private int currentGoalCrNum = 0;


    public Account() {
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoalName() {
        return goalName;
    }

    public void setGoalName(String goalName) {
        this.goalName = goalName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getGoalDesc() {
        return goalDesc;
    }

    public void setGoalDesc(String goalDesc) {
        this.goalDesc = goalDesc;
    }

    public String getGoalCrName() {
        return goalCrName;
    }

    public void setGoalCrName(String goalCrName) {
        this.goalCrName = goalCrName;
    }

    public int getGoalCrNum() {
        return goalCrNum;
    }

    public void setGoalCrNum(int goalCrNum) {
        this.goalCrNum = goalCrNum;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getCurrentGoalCrNum() {
        return currentGoalCrNum;
    }

    public void setCurrentGoalCrNum(int currentGoalCrNum) {
        this.currentGoalCrNum = currentGoalCrNum;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", goalName='" + goalName + '\'' +
                ", category='" + category + '\'' +
                ", goalDesc='" + goalDesc + '\'' +
                ", goalCrName='" + goalCrName + '\'' +
                ", goalCrNum='" + goalCrNum + '\'' +
                ", currentGoalCrNum='" + currentGoalCrNum + '\'' +
                '}';
    }
}
