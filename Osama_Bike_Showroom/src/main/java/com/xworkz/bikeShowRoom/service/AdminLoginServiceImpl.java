package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AdminLoginDto;
import com.xworkz.bikeShowRoom.entity.AdminLoginEntity;
import com.xworkz.bikeShowRoom.repository.AdminLoginRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

@Slf4j
@Service
public class AdminLoginServiceImpl implements AdminLoginService {

    @Autowired
    AdminLoginRepository adminLoginRepository;

    @Override
    public AdminLoginDto getByEmail(String email) {

        AdminLoginEntity adminLoginEntity = adminLoginRepository.getAdminEmail(email);
        if (adminLoginEntity == null) {
            return null;
        }
        AdminLoginDto adminLoginDto = new AdminLoginDto();
        BeanUtils.copyProperties(adminLoginEntity, adminLoginDto);
        return adminLoginDto;
    }

    @Override
    public String generateOtp() {

        String values = "0987654321";

        StringBuilder autoOtp = new StringBuilder();
        Random rdm = new Random();

        for (int i = 0; i < 5; i++) {
            autoOtp.append(values.charAt(rdm.nextInt(values.length())));
        }
        return autoOtp.toString();
    }

    @Override
    public boolean sendEmail(String email, String otp) {
        final String username = "osamavr691@gmail.com";
        final String userPassword = "xasi vgvm salk ryyh";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.starttls.required", "true");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, userPassword);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("Secure Admin-OTP of Ola-Showroom");
            message.setText("Admin OTP :  " + otp);

            Transport.send(message);

            log.info("OTP Send Successfully to Admin");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return true;
    }
}
