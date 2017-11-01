package ua.lv.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.io.File;
import java.util.Properties;

/**
 * Created by User on 30.08.2017.
 */

@Configuration
@EnableWebMvc
@ComponentScan("ua.lv.*")
public class WebConfig extends WebMvcConfigurerAdapter{


    @Bean
    public JavaMailSenderImpl mailSender(){
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.gmail.com");
        javaMailSender.setPort(587);
        javaMailSender.setUsername("okten.web.project@gmail.com");
        javaMailSender.setPassword("okten2017");
        Properties properties = javaMailSender.getJavaMailProperties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.put("mail.debug","true");

        return javaMailSender;
    }


    @Bean
    public MultipartResolver multipartResolver(){
        return new StandardServletMultipartResolver();
    }


    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean(name = "messageSource")
    ReloadableResourceBundleMessageSource messageSource(){
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:validation");
//        messageSource.setUseCodeAsDefaultMessage(true);
//        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry
                .addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
        registry
                .addResourceHandler("/avatar/**")
                .addResourceLocations("file:" + System.getProperty("user.home") + File.separator + "Pictures\\");
    }

}
