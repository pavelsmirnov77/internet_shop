package com.example.internet_shop.services;

import com.example.internet_shop.models.User;
import com.example.internet_shop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.security.Principal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String email = user.getEmail();
        String number = user.getPhoneNumber();
        String password = user.getPassword();
        String regexEmail = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,}";
        String regexNumber = "^\\+?\\d{11}";
        String regexPassword = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d_]{8,}$";
        Pattern patternEmail = Pattern.compile(regexEmail);
        Pattern patternNumber = Pattern.compile(regexNumber);
        Pattern patternPassword = Pattern.compile(regexPassword);
        Matcher matcherEmail = patternEmail.matcher(email);
        Matcher matcherNumber = patternNumber.matcher(number);
        Matcher matcherPassword = patternPassword.matcher(password);
        if (userRepository.findByEmail(email) != null || !matcherEmail.find() || !matcherNumber.find() || !matcherPassword.find()) return false;
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setActive(true);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}
