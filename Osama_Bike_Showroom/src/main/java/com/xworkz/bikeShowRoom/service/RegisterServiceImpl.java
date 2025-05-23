package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.dto.ShowRoomInfoDto;
import com.xworkz.bikeShowRoom.entity.AddShowRoomEntity;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.repository.RegisterRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;

@Service
@Slf4j
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    RegisterRepository userRegRepo;

    private String generatePassword;

    public String autoGeneratePassword() {

        String upperCase = "ABCDEFGHIJKLMNOPQUSTUVWXYZ";
        String lowerCase = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "1234567890";
        String specialChar = "!@#$&*?-+~";

        String generatePassword = upperCase + lowerCase + numbers + specialChar;

        Random random = new Random();
        StringBuilder autoPassword = new StringBuilder();

        for (int i = 0; i <= 5; i++) {
            autoPassword.append(generatePassword.charAt(random.nextInt(generatePassword.length())));
        }
        return autoPassword.toString();
    }

    @Override
    public List<ShowRoomInfoDto> getAllShowroom() {
        List<AddShowRoomEntity> showrooms = userRegRepo.getShowroomNames();
        Set<ShowRoomInfoDto> info = new HashSet<>();

        for (AddShowRoomEntity showroom : showrooms) {
            info.add(new ShowRoomInfoDto(showroom.getShowroomName(), showroom.getAddress()));
        }
        return new ArrayList<>(info);
    }

    @Override
    public List<String> getBikesByShowroom(String showroomName) {
        System.out.println("SERVICE LAYER :: " + showroomName);
        return userRegRepo.getAssignedBikesByShowroom(showroomName);
    }

    @Override
    public boolean validateAndSaveUser(RegisterDto registerDto, Model model) {

        boolean validation = true;

        if (registerDto != null) {
            RegisterEntity registerEntity = new RegisterEntity();
            registerEntity.setCustomerName(registerDto.getCustomerName());
            registerEntity.setAge(registerDto.getAge());
            registerEntity.setContactNo(registerDto.getContactNo());
            registerEntity.setEmail(registerDto.getEmail());
            registerEntity.setAddress(registerDto.getAddress());
            registerEntity.setDrivingLicense(registerDto.getDrivingLicense());
            registerEntity.setSchedule(registerDto.getSchedule());
            registerEntity.setBikeNames(registerDto.getBikeNames());
            registerEntity.setShowroomNames(registerDto.getShowroomNames());
            registerEntity.setScheduleDays(registerDto.getScheduleDays());
            registerEntity.setScheduleDate(registerDto.getScheduleDate());
            registerEntity.setScheduleTime(registerDto.getScheduleTime());

            if (registerDto.getCustomerName() != null && registerDto.getCustomerName().length() >= 4 && registerDto.getCustomerName().length() <= 30 && registerDto.getCustomerName().matches("^[A-Za-z.\\s]+$")) {
                registerEntity.setCustomerName(registerDto.getCustomerName());
            } else {
                validation = false;
                model.addAttribute("nameError", "Invalid User Name! give proper User Name It contains only Character, and Minimum 5 character");
            }

            if (registerDto.getAge() != null && registerDto.getAge().matches("^(1[89]|[2-9][0-9])$")) {
                registerEntity.setAge(registerDto.getAge());
            } else {
                validation = false;
                model.addAttribute("ageError", "Invalid Age! Age must be Above 18");
            }

            if (registerDto.getContactNo() != null && registerDto.getContactNo().length() == 10 && registerDto.getContactNo().matches("^[9876]\\d{9}$")) {
                registerEntity.setContactNo(registerDto.getContactNo());
            } else {
                validation = false;
                model.addAttribute("contactError", "Invalid Contact! Give Proper Contact & It's Must be 10 Digits");
            }

            if (registerDto.getEmail() != null && registerDto.getEmail().contains("@gmail.com") && registerDto.getEmail().matches("^[a-z0-9.]+@gmail\\.com$")) {
                registerEntity.setEmail(registerDto.getEmail());
                generatePassword = autoGeneratePassword();
                registerEntity.setPassword(generatePassword);

                boolean sendMail = sendEmail(registerDto.getEmail(), generatePassword);
                if (sendMail) {
                    log.info("Password is Send to The User");
                }
            } else {
                validation = false;
                model.addAttribute("emailError", "Invalid Email! Give Proper Email");
            }

            if (registerDto.getAddress() != null && registerDto.getAddress().length() >= 6 && registerDto.getAddress().length() <= 100 && registerDto.getAddress().matches("^[A-Za-z0-9,_. ]+$")) {
                registerEntity.setAddress(registerDto.getAddress());
            } else {
                validation = false;
                model.addAttribute("addressError", "Invalid Address! Give proper Address");
            }

            if (registerDto.getDrivingLicense() != null && registerDto.getDrivingLicense().matches("^[A-Z0-9]{15}$")) {
                registerEntity.setDrivingLicense(registerDto.getDrivingLicense());
            } else {
                validation = false;
                model.addAttribute("licenseError", "Invalid Driving License! Once Check your License No");
            }

            if (validation) {
                boolean saved = userRegRepo.save(registerEntity);
                return saved;
            }
        }
        return false;
    }

    @Override
    public boolean sendEmail(String email, String password) {

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
            message.setSubject("Secure Password of Ola-Showroom");
            message.setText(" Your Password:  " + generatePassword);
            Transport.send(message);

            log.info("Password Send Successfully to User");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public long getCountOfName(String name) {
        return userRegRepo.getCountOfName(name);
    }

    @Override
    public long getCountOfContact(String contactNo) {
        return userRegRepo.getCountOfContact(contactNo);
    }

    @Override
    public long getCountOfEmail(String email) {
        return userRegRepo.getCountOfEmail(email);
    }

    @Override
    public long getCountOfLicense(String drivingLicense) {
        return userRegRepo.getCountOfLicense(drivingLicense);
    }
}
