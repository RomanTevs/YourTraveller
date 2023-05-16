package com.traveller.controllers;


import com.traveller.domain.Role;
import com.traveller.domain.UserEntity;
import com.traveller.service.RoleService;
import com.traveller.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
    public String showRegistrationPage(Model model) {
        model.addAttribute("newUser",new UserEntity());
        return "auth/registration-page";
    }


    @PostMapping("/registration")
    public String Registration(@ModelAttribute("newUser") @Valid UserEntity userEntity,
                             BindingResult result, RedirectAttributes ra) {

        if (result.hasErrors()) {
            return "auth/registration-page";
        }
        if (userService.existByName(userEntity.getName())) {
            ra.addFlashAttribute("message", "Пользователь с таким именем уже существует!");
            return "redirect:/registration";
        }
        Role roleForNewUser = roleService.findByName("USER").get();

        userEntity.getRoles().add(roleForNewUser);

        userService.save(userEntity);

        ra.addFlashAttribute("message", "Ваш аккаунт успешно создан,пожалуйста залогиньтесь под ним");
        return "redirect:/login";
    }




}
