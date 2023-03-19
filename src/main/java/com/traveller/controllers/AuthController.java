package com.traveller.controllers;


import com.traveller.service.RoleService;
import com.traveller.service.UserService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final RoleService roleService;
    private final UserService userService;


    public AuthController(AuthenticationManager authenticationManager, RoleService roleService,
                          UserService userService) {
        this.authenticationManager = authenticationManager;
        this.roleService = roleService;
        this.userService = userService;

    }
    //http://localhost:8080/login
    @GetMapping("/login")
    public String showLoginPage() {
        return "auth/login-page";
    }

    //http://localhost:8080/registration
    @GetMapping("/registration")
    public String showRegistrationPage() {
        return "auth/registration-page";
    }
    @PostMapping("/registration")
    public void Registration() {

    }



}
