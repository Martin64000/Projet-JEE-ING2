package com.example.apiprojet.controller;

import com.example.apiprojet.model.Manga;
import com.example.apiprojet.service.MangaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MangaController {

    @Autowired
    private MangaService service;

    @GetMapping("/")
    public String home(Model model) {
        return "home";
    }

    @GetMapping("/mangas")
    public String listManga(Model model , HttpSession session) {
        List<Manga> listMangas = service.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "mangas";
    }

    @GetMapping("/caracteristiques")
    public String modifMangas(Model model , HttpSession session) {
        List<Manga> listMangas = service.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "caracteristiques";
    }

    @GetMapping("/stocks")
    public String modifStocksMangas(Model model , HttpSession session) {
        List<Manga> listMangas = service.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "stocks";
    }

    @GetMapping("/form")
    public String formulaire(Model model , HttpSession session) {
        List<Manga> listMangas = service.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "formulaire";
    }

}
