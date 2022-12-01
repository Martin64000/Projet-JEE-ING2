package com.example.apiprojet.controller;

import com.example.apiprojet.model.Manga;
import com.example.apiprojet.service.MangaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MangaController {

    @Autowired
    private MangaService service;

    @GetMapping("/home")
    public String home(Model model) {
        Iterable<Manga> listMangas = service.listMangas();
        model.addAttribute("mangas", listMangas);
        return "home";
    }
}
