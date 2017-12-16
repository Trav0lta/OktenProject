package ua.lv.entity;


//import org.springframework.format.annotation.DateTimeFormat;
import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;


@Entity
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String goalName;
    private String category;
    @Column(columnDefinition = "text")
    private String goalDesc;
    private Date deadline;
    private String goalCrName;
    private int goalCrNum;
    @ManyToOne(cascade = CascadeType.MERGE,fetch = FetchType.EAGER)
    private User user;

    private int days = 0;
    private int currentGoalCrNum = 0;
    private Date dateOfStartGoal = new Date();
    private Date dateOfFinishGoal = null;
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
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String outputDate = simpleDateFormat.format(deadline);
        return outputDate;
    }

    public void setDeadline (String deadline) {
        if (deadline==null){
            this.deadline = null;
        }
        else{
            LocalDate ld = LocalDate.parse(deadline);
            Date dateDeadline = ld.toDate();
            this.deadline = dateDeadline;
        }
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

    public Date getDateOfStartGoal() {
        return dateOfStartGoal;
    }

    public void setDateOfStartGoal(Date dateOfStartGoal) {
        this.dateOfStartGoal = dateOfStartGoal;
    }

    public String getDateOfFinishGoal() {

        if(dateOfFinishGoal!=null){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String outputDate = simpleDateFormat.format(dateOfFinishGoal);
        return outputDate;
        }
        else{
            return null;
        }
    }


    public int getDays() {
        return days;
    }

    public void setDays(int days) {
//        if (statusFinished = true){
//            int dayscount=0;
//            DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern("EEE MMM dd HH:mm:ss zzz yyyy");
////            DateTimeFormatter dateTimeFormatter1 = DateTimeFormat.forPattern("dd-MM-yyyy");
//            LocalDate ldStart = LocalDate.parse(dateOfStartGoal.toString(), dateTimeFormatter);
//            LocalDate ldFinish = LocalDate.parse(dateOfFinishGoal.toString(), dateTimeFormatter);
//            dayscount = Days.daysBetween(ldStart, ldFinish).getDays();
//
//            this.days=dayscount;
//
//        }
        this.days = days;
    }

    public void setDateOfFinishGoal(Date dateOfFinishGoal) {
        Date date = new Date();
        if (deadline.before(date)==true){
            this.dateOfFinishGoal = deadline;
        }else{
            this.dateOfFinishGoal = dateOfFinishGoal;
        }
    }

    public boolean isStatusFinished() {
        return statusFinished;
    }

    public void setStatusFinished(boolean statusFinished) {
        Date date = new Date();
        if (deadline.before(date)==true){
            this.statusFinished = true;
        }else{
            this.statusFinished = statusFinished;
        }
    }

    public boolean isStatusFailed() {
        return statusFailed;
    }

    public void setStatusFailed(boolean statusFailed) {

        Date date = new Date();
        if (deadline.before(date)==true){
            this.statusFailed = true;
        }else{
            this.statusFailed = statusFailed;
        }
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
