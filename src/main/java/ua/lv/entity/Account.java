package ua.lv.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


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

    private LocalDate dateOfStartGoal = LocalDate.now();
    private LocalDate dateOfFinishGoal = null;
    private boolean statusFinished = false;
    private  boolean statusFailed;

    public Account() {
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

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline (String deadline) {
//        if (deadline==null){
//            this.deadline = null;
//        }else{
//        this.deadline = LocalDate.parse(deadline, DateTimeFormatter.ofPattern("dd/MM/yyyy"));}
        this.deadline = deadline;
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

    public LocalDate getDateOfStartGoal() {
        return dateOfStartGoal;
    }

    public void setDateOfStartGoal(LocalDate dateOfStartGoal) {
        this.dateOfStartGoal = dateOfStartGoal;
    }

    public LocalDate getDateOfFinishGoal() {
        return dateOfFinishGoal;
    }

    public void setDateOfFinishGoal(LocalDate dateOfFinishGoal) {
        this.dateOfFinishGoal = dateOfFinishGoal;
    }

    public boolean isStatusFinished() {
        return statusFinished;
    }

    public void setStatusFinished(boolean statusFinished) {
        this.statusFinished = statusFinished;
    }

    public boolean isStatusFailed() {
        return statusFailed;
    }

    public void setStatusFailed(boolean statusFailed) {
        this.statusFailed = statusFailed;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", goalName='" + goalName + '\'' +
                ", category='" + category + '\'' +
                ", goalDesc='" + goalDesc + '\'' +
                ", deadline=" + deadline +
                ", goalCrName='" + goalCrName + '\'' +
                ", goalCrNum=" + goalCrNum +
                ", user=" + user +
                ", currentGoalCrNum=" + currentGoalCrNum +
                ", dateOfStartGoal=" + dateOfStartGoal +
                ", dateOfFinishGoal=" + dateOfFinishGoal +
                ", statusFinished=" + statusFinished +
                ", statusFailed=" + statusFailed +
                '}';
    }
}
