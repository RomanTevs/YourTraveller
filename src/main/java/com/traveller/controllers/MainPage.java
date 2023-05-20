package com.traveller.controllers;

import com.traveller.domain.Trip;
import com.traveller.domain.UserEntity;
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

        UserEntity userEntityFromDB = getUserEntityFromDB(authentication, userService);
        model.addAttribute("currentUser", userEntityFromDB);

        boolean isAdmin = authentication.getAuthorities().stream()
                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ADMIN"));
        model.addAttribute("isAdmin", isAdmin);

        return "main-page/main";
    }

    @GetMapping("main/creating-new-trip")
    public String createNewTrip(Model model, Authentication authentication, RedirectAttributes ra) {

        UserEntity userEntityFromDB = getUserEntityFromDB(authentication, userService);
        Trip trip = new Trip();
        trip.setCreatorOfThisTrip(userEntityFromDB);
        model.addAttribute("newTrip", trip);
        model.addAttribute("paigeName", "Создание новой поездки");
        return "main-page/tripForm";

    }

    @PostMapping("main/save-new-trip")
    public String saveNewTrip(@ModelAttribute("newTrip") @Valid Trip trip,
                              BindingResult result, RedirectAttributes ra) {
        if (result.hasErrors()) {
            return "main-page/tripForm";
        }
        //Поездка trip из параметров метода и такая же поездка(поездка с таким же id, набором пассажиров и тд) - это
        // две разные сущности,по этому я сначала удаляю соответсвующую поездку из БД , что бы потом
        if (tripService.countById(trip.getId()) > 0) {
            Optional<Trip> optionalTrip = tripService.findById(trip.getId());
            if (optionalTrip.isPresent()) {
                Trip tripFromDB = optionalTrip.get();
                for (UserEntity passenger : tripFromDB.getPassengers()) {
                    passenger.getTrips().remove(tripFromDB);
                    userService.save(passenger);
                }
                tripFromDB.getPassengers().clear();
                tripService.save(tripFromDB);
                tripService.deleteById(tripFromDB.getId());
            }
        }
        // иметь возможность нормально сохранить поездку из аргумента метода:
        tripService.save(trip);
        ra.addFlashAttribute("message", "Изменения успешно внесены!");
        return "redirect:/main";
        // если не удалять поездку из БД , то я получаю проблему с merge-ем
        // т.е. со слиянием и внисением изменений в существующую заранее поездку из БД
        //ошибка слияния выглядела так: Multiple representations of the same entity [com.traveller.domain.Trip#2803] are being merged.
        //Managed: [Trip{id=2803, fromTown='Гагарин', toTown='Калач', departureDateAndTime=2023-05-25}];
        //Detached: [Trip{id=2803, fromTown='Гагарин', toTown='Калач', departureDateAndTime=2023-05-30}]
        // то есть путем предварительного удаления поездки из БД я решил эту ошибку и сейчас я могу
        // изменять поездки,даже если в них уже есть пассажиры!
    }

    @GetMapping("/main/edit/{id}")
    public String editExistingTrip(Model model, @PathVariable Integer id, RedirectAttributes ra) {

        Optional<Trip> optionalTrip = tripService.findById(id);

        if (optionalTrip.isPresent()) {
            Trip tripFromDB = optionalTrip.get();
            model.addAttribute("newTrip", tripFromDB);
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

        if (trip != null) {
            for (UserEntity passenger : trip.getPassengers()) {
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
    @Transactional
    public String joinTheTrip(@PathVariable Trip trip, RedirectAttributes ra, Authentication authentication) {

        try {
            if (trip == null) {
                ra.addFlashAttribute("message", "поездка,в которую вы " +
                        "пытаетесь присоединиться отсутвует в БД");
                return "redirect:/main";
            }
            UserEntity userEntityFromDB = getUserEntityFromDB(authentication, userService);
            userEntityFromDB.getTrips().add(trip);
            userService.save(userEntityFromDB);
            return "redirect:/main";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/main";
        }

    }


    @GetMapping("/main/leave/{trip}")
    @Transactional
    public String leaveTheTrip(@PathVariable Trip trip, RedirectAttributes ra, Authentication authentication) {

        try {
            if (trip == null) {
                ra.addFlashAttribute("message", "поездка,в которую вы " +
                        "пытаетесь присоединиться отсутвует в БД");
                return "redirect:/main";
            }
            UserEntity userEntityFromDB = getUserEntityFromDB(authentication, userService);
            userEntityFromDB.getTrips().remove(trip);
            userService.save(userEntityFromDB);
            return "redirect:/main";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/main";
        }

    }

    private UserEntity getUserEntityFromDB(Authentication authentication, UserService userService) {
        User SpringSecurityUser = (User) authentication.getPrincipal();
        Optional<UserEntity> optionalUserEntity = userService.findByUserName(SpringSecurityUser.getUsername());
        return optionalUserEntity.get();
    }
}
