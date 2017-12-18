package ua.lv.validator;

import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import ua.lv.entity.Account;
import ua.lv.service.AccountService;

import org.joda.time.LocalDate;
import java.util.Date;


@Component
public class AccountValidator implements Validator {


    @Autowired
    AccountService accountService;


    public boolean supports(Class<?> aClass) {
        return aClass.equals(Account.class);
    }

    public void validate(Object o, Errors errors) {
        Account account = (Account) o;

        Date deadLine = account.getDeadline();
        Date dateNow = new Date();
        long dN = dateNow.getTime();
        long dL =  deadLine.getTime();
        if(deadLine.before(dateNow)==true){
            errors.rejectValue("deadline", "errors", "your date false");
        }

    }
}
