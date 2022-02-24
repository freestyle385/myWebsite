package myWebsite.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

  @Bean
  public JavaMailSender mailSender() {
    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    Properties mailProperties = new Properties();
    mailProperties.put("mail.transport.protocol", "smtp");
    mailProperties.put("mail.smtp.auth", "true");
    mailProperties.put("mail.smtp.starttls.enable", "true");
    mailProperties.put("mail.smtp.debug", "true");

    mailSender.setJavaMailProperties(mailProperties);
    mailSender.setHost("smtp.gmail.com");
    mailSender.setPort(587);
    mailSender.setUsername("freestyle4583@gmail.com");
    mailSender.setPassword("dbstjr0224!@");
    mailSender.setDefaultEncoding("utf-8");
    return mailSender;
  }
}
