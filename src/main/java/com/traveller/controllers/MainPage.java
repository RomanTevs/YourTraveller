package com.traveller.controllers;

import com.traveller.domain.Trip;
import com.traveller.service.TripService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
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

    public MainPage(TripService tripService) {
        this.tripService = tripService;
    }


    @GetMapping("/main")
    public String getMain(Model model) {
        List<Trip> trips = tripService.findAll();
        model.addAttribute("trips", trips);
        return "main-page/main";
    }

    @GetMapping("main/creating-new-trip")
    public String createNewTrip(Model model) {
        model.addAttribute("newTrip", new Trip());
        model.addAttribute("paigeName", "Создание новой поездки");
        return "main-page/tripForm";
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

    @GetMapping("/main/delete/{id}")
    public String deleteExistingTrip(@PathVariable Integer id, RedirectAttributes ra) {
        if (tripService.countById(id) != 0) {

            tripService.deleteById(id);
            ra.addFlashAttribute("message", "Поездка успешно удалена!");

        } else {
            ra.addFlashAttribute("message", "Такой поездки не существует!");
        }
        return "redirect:/main";
    }
}
