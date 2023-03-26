package com.traveller.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//http://localhost:8080/home-page
@Controller
@RequestMapping("/home-page")
public class HomePage {

    @GetMapping
    public String introGet() {
        return "home-page/home-page";
    }
    @GetMapping("/about")
    public String aboutGet() {
        return "home-page/about";
    }








}

