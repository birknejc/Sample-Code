package com.example.validatingforminput;

import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Controller
public class WebController implements WebMvcConfigurer {


    @GetMapping("/")
    public String showForm(Model model) {
        model.addAttribute("personForm", new PersonForm());
        return "form";
    }

    @PostMapping("/")
    public String checkPersonInfo(@Valid PersonForm personForm, BindingResult bindingResult,Model model) {

        if (bindingResult.hasErrors()) {
            return "form";
        }
        model.addAttribute("personForm", personForm);
        return "results";
    }
}