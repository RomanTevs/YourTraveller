package com.traveller.controllers;

import com.traveller.domain.City;
import com.traveller.repos.CityRepo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class JsController {

    private final CityRepo cityRepo;

    public JsController(CityRepo cityRepo) {
        this.cityRepo = cityRepo;
    }

    @GetMapping("/hint")
    @ResponseBody
    public List<String> getAutoHint(@RequestParam(required = false) String firstLetters) {

        List<City> cities = cityRepo.findFirst9ByNameOfTheCityStartingWithIgnoreCase(firstLetters);
        List<String> citiesAsStrings = cities.stream()
                .map(city -> city.getNameOfTheCity())
                .toList();
        return citiesAsStrings;

    }



}
