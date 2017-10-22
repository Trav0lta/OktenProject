package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.entity.User;
import ua.lv.service.MailService;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by User on 20.10.2017.
 */
@Service
@Transactional
public class MailServiceImpl implements MailService {
    @Autowired
    JavaMailSender javaMailSender;

    public void send(User user) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

        try {

            mimeMessage.setFrom(new InternetAddress("okten.web.project@gmail.com"));

            helper.setTo(user.getEmail());
            helper.setSubject("WELCOME!");
            helper.setText("Welcome, "+user.getUsername()+", to our site!!", true);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        javaMailSender.send(mimeMessage);
    }
}
