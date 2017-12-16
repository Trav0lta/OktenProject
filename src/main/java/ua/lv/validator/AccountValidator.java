//package ua.lv.validator;
//
//import org.joda.time.format.DateTimeFormat;
//import org.joda.time.format.DateTimeFormatter;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.cglib.core.Local;
//import org.springframework.stereotype.Component;
//import org.springframework.validation.Errors;
//import org.springframework.validation.Validator;
//import ua.lv.entity.Account;
//import ua.lv.service.AccountService;
//
//import org.joda.time.LocalDate;
//import java.util.Date;
//
//
//@Component
//public class AccountValidator implements Validator {
//
//
//    @Autowired
//    AccountService accountService;
//
//
//
//
//    public boolean supports(Class<?> aClass) {
//        return aClass.equals(Account.class);
//    }
//
//    public void validate(Object o, Errors errors) {
//        Account account = (Account) o;
//
//        if ((account.getGoalCrNum() < 3) || (account.getGoalCrNum() > 32)) {
//            errors.rejectValue("goalCrNum", "error", "ups.");
//        }
//
//       LocalDate  dateNow = LocalDate.now();
//       LocalDate deadline = LocalDate.parse(account.getDeadline());
//       boolean d = dateNow.isBefore(deadline);
//       if(d){
//           errors.rejectValue("date", "errors", "your date false");
//       }
//        Date deadLine = new Date(account.getDeadline());
//        System.out.println(deadLine);
//        Date dateNow = new Date();
//        long dN = dateNow.getTime();
//        long dL =  deadLine.getTime();
//        if(dN >= dL){
//            errors.rejectValue("date", "errors", "your date false");
//        }

//    }
//}
