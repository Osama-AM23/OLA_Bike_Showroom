package com.xworkz.bikeShowRoom.service;

import com.xworkz.bikeShowRoom.dto.AddBikeDetailsDto;
import com.xworkz.bikeShowRoom.dto.RegisterDto;
import com.xworkz.bikeShowRoom.entity.AddBikeDetailsEntity;
import com.xworkz.bikeShowRoom.entity.RegisterEntity;
import com.xworkz.bikeShowRoom.repository.UserPortalRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class UserPortalServiceImpl implements UserPortalService {

    @Autowired
    UserPortalRepository userLoginRepo;

    private BCryptPasswordEncoder encodedPassword = new BCryptPasswordEncoder();


    @Override
    public RegisterEntity userlogin(String email, String password, Model model) {

        RegisterDto registerDto = new RegisterDto();
        RegisterEntity registerEntity = userLoginRepo.userLogin(email);

        if (registerEntity == null) {
            return null;
        }

        if (registerEntity.getLockTime() != null && lockTiming(registerEntity.getLockTime())) {
            registerEntity.setLockTime(null);
            registerEntity.setLoginCount(0);
            userLoginRepo.setLockTime(email, registerEntity);
        }

        if (registerEntity.getLoginCount() == -1) {
            return registerEntity;
        } else if (registerEntity.getLoginCount() >= 3) {
            model.addAttribute("errorMessage", "Your Account Is Locked");
            registerEntity.setLockTime(LocalDateTime.now());
            userLoginRepo.setLockTime(email, registerEntity);
            return null;
        } else if (encodedPassword.matches(password, registerEntity.getPassword())) {
            registerEntity.setLoginCount(0);
            userLoginRepo.updateLoginCount(registerEntity);
            userLoginRepo.setLockTime(email, registerEntity);
            return registerEntity;
        } else {
            int attempt = registerEntity.getLoginCount() + 1;
            registerEntity.setLoginCount(attempt);
            registerEntity.setLockTime(LocalDateTime.now());
            userLoginRepo.updateLoginCount(registerEntity);
            userLoginRepo.setLockTime(email, registerEntity);
            return null;
        }

    }

    @Override
    public boolean lockTiming(LocalDateTime lockTime) {
        return lockTime.plusMinutes(2).isBefore(LocalDateTime.now());
    }

    @Override
    public boolean setPasswordUpdate(String email, String password, String confirmPassword) {

        if (password.equals(confirmPassword)) {
            RegisterEntity registerEntity = userLoginRepo.getDataForUpdate(email);

            if (registerEntity != null) {
                registerEntity.setPassword(encodedPassword.encode(confirmPassword));
                registerEntity.setLoginCount(0);
                return userLoginRepo.updateNewPassword(registerEntity);
            }
            return false;
        }
        return false;
    }

    @Override
    public RegisterDto getDataForUpdate(String email) {

        RegisterEntity registerEntity = userLoginRepo.getDataForUpdate(email);

        if (registerEntity != null) {
            RegisterDto registerDto = new RegisterDto();
            BeanUtils.copyProperties(registerEntity, registerDto);
            return registerDto;
        }
        return null;
    }

    @Override
    public boolean updateUserProfile(RegisterDto registerDto) {
        RegisterEntity registerEntity = new RegisterEntity();
        BeanUtils.copyProperties(registerDto, registerEntity);
        return userLoginRepo.updateUserProfile(registerEntity);
    }

    @Override
    public boolean updateUserSchedule(RegisterDto registerDto) {
        RegisterEntity registerEntity = new RegisterEntity();
        BeanUtils.copyProperties(registerDto, registerEntity);
        return userLoginRepo.updateUserSchedule(registerEntity);
    }

    @Override
    public List<AddBikeDetailsDto> getBikesByAddress(String address) {

        List<AddBikeDetailsDto> dtos = new ArrayList<>();
        List<AddBikeDetailsEntity> entities = userLoginRepo.getBikesByAddress(address);

        for (AddBikeDetailsEntity entity : entities) {
            AddBikeDetailsDto bikesDto = new AddBikeDetailsDto();
            BeanUtils.copyProperties(entity, bikesDto);
            dtos.add(bikesDto);
        }

        return dtos;
    }
}
