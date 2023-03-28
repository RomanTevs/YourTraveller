package com.traveller.controllers;


import com.traveller.domain.Role;
import com.traveller.domain.Trip;
import com.traveller.domain.User;
import com.traveller.service.RoleService;
import com.traveller.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String Registration(@ModelAttribute("newUser") @Valid User user,
                             BindingResult result, RedirectAttributes ra) {
        if (result.hasErrors()) {
            return "auth/registration-page";
        }
        if (userService.existByName(user.getName())) {
            ra.addFlashAttribute("message", "Пользователь с таким именем уже существует!");
            return "redirect:/registration";
        }
        user.getRoles().add(new Role("user"));
        userService.save(user);
        ra.addFlashAttribute("message", "Ваш аккаунт успешно создан,пожалуйста залогинтесь под ним");
        return "redirect:/login";
    }



}
