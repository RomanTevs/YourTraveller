package com.traveller.controllers;

import com.traveller.domain.Trip;
import com.traveller.service.TripService;
import com.traveller.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;


//http://localhost:8080/main
//http://localhost:8080/main/creating-new-trip
@Controller
public class MainPage {

    private final TripService tripService;
    private final UserService userService;

    public MainPage(TripService tripService, UserService userService) {
        this.tripService = tripService;
        this.userService = userService;
    }


    @GetMapping("/main")
    public String getMain(Model model, Authentication authentication) {
        List<Trip> trips = tripService.findAll();
        model.addAttribute("trips", trips);

        User springSecurityUser = (User) authentication.getPrincipal();
        Optional<com.traveller.domain.User> optionalUserFromDB = userService.findByUserName(springSecurityUser.getUsername());
        if (optionalUserFromDB.isPresent()) {
            com.traveller.domain.User userFromDB = optionalUserFromDB.get();
            model.addAttribute("currentUser", userFromDB);
        }

        boolean isAdmin = authentication.getAuthorities().stream()
                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ADMIN"));
        model.addAttribute("isAdmin", isAdmin);

        return "main-page/main";
    }

    @GetMapping("main/creating-new-trip")
    public String createNewTrip(Model model, Authentication authentication, RedirectAttributes ra) {

        User currentUser = (User) authentication.getPrincipal();
        Optional<com.traveller.domain.User> optionalUserFromDB = userService.findByUserName(currentUser.getUsername());
        if (optionalUserFromDB.isPresent()) {
            com.traveller.domain.User userFromDB = optionalUserFromDB.get();
            Trip trip = new Trip();
            trip.setCreatorOfThisTrip(userFromDB);
            model.addAttribute("newTrip", trip);
            model.addAttribute("paigeName", "Создание новой поездки");
            return "main-page/tripForm";
        } else {
            ra.addFlashAttribute("message", "пользователь,под которым вы " +
                    "пытаетесь создать поездку отсутвует в БД");
            return "redirect:/main";
        }

    }

    @PostMapping("main/save-new-trip")
    public String saveNewTrip(@ModelAttribute("newTrip") @Valid Trip trip,
                              BindingResult result, RedirectAttributes ra) {
        if (result.hasErrors()) {
            return "main-page/tripForm";
        }
        tripService.save(trip);
        ra.addFlashAttribute("message", "Изменения успешно внесены!");
        return "redirect:/main";
    }

    @GetMapping("/main/edit/{id}")
    public String editExistingTrip(Model model, @PathVariable Integer id, RedirectAttributes ra) {

        Optional<Trip> optionalTrip = tripService.findById(id);
        if (optionalTrip.isPresent()) {
            Trip tripToEdit = optionalTrip.get();
            model.addAttribute("newTrip", tripToEdit);
            model.addAttribute("paigeName", "Изменение существующей поездки");
            return "main-page/tripForm";

        } else {
            ra.addFlashAttribute("message", "Такой поездки не существует!");
            return "redirect:/main";
        }

    }


    @GetMapping("/main/delete/{trip}")
    @Transactional
    public String deleteExistingTrip(@PathVariable Trip trip, RedirectAttributes ra) {
        System.out.println(trip.getPassengers().size());
        if (trip != null) {
            for (com.traveller.domain.User passenger : trip.getPassengers()) {
                passenger.getTrips().remove(trip);
                userService.save(passenger);
            }
            trip.getPassengers().clear();
            tripService.save(trip);
            tripService.deleteById(trip.getId());
            ra.addFlashAttribute("message", "Поездка успешно удалена!");

        } else {
            ra.addFlashAttribute("message", "Такой поездки не существует!");
        }
        return "redirect:/main";
    }

    @GetMapping("/main/join/{trip}")
    public String joinTheTrip(@PathVariable Trip trip, RedirectAttributes ra, Authentication authentication) {

        if (trip == null) {
            ra.addFlashAttribute("message", "поездка,в которую вы " +
                    "пытаетесь присоединиться отсутвует в БД");
            return "redirect:/main";
        }
        User currentUser = (User) authentication.getPrincipal();
        Optional<com.traveller.domain.User> optionalUserFromDB = userService.findByUserName(currentUser.getUsername());
        if (optionalUserFromDB.isPresent()) {
            com.traveller.domain.User userFromDB = optionalUserFromDB.get();
            trip.getPassengers().add(userFromDB);
            tripService.save(trip);
        } else {
            ra.addFlashAttribute("message", "пользователь,под которым вы " +
                    "пытаетесь присоединиться к поездке отсутвует в БД");
        }
        return "redirect:/main";

    }


}
