package com.example.webprojet.controller;

import com.example.webprojet.model.Manga;
import com.example.webprojet.service.MangaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MangaController {

    @Autowired
    private MangaService service;

    @GetMapping("/")
    public String home(Model model) {
        Iterable<Manga> listMangas = service.getMangas();
        model.addAttribute("mangas", listMangas);
        return "home";
    }
}
