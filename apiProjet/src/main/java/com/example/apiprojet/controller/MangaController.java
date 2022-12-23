package com.example.apiprojet.controller;

import com.example.apiprojet.model.Manga;
import com.example.apiprojet.model.User;
import com.example.apiprojet.service.MangaService;
import com.example.apiprojet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class MangaController {

    @Autowired
    private MangaService mangaService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/mangas")
    public String listManga(Model model , HttpSession session) {
        List<Manga> listMangas = mangaService.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "mangas";
    }

    @GetMapping("/searchMangas")
    public String searchManga() {
        return "rechercheManga";
    }

    @PostMapping("/searchMangas")
    public String listMangaSearch(Model model , HttpSession session, @RequestParam String search) {
        List<Manga> listMangas = mangaService.listMangas();
        List<Manga> listMangasSearch = mangaService.searchManga(search, search);
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        session.setAttribute("searchMangas", listMangasSearch);
        return "rechercheManga";
    }

    @GetMapping("/caracteristiques")
    public String modifMangas(Model model , HttpSession session) {
        List<Manga> listMangas = mangaService.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "caracteristiques";
    }

    @GetMapping("/stocks")
    public String modifStocksMangas(Model model , HttpSession session) {
        List<Manga> listMangas = mangaService.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "stocks";
    }

    @GetMapping("/form")
    public String formulaire(Model model , HttpSession session) {
        List<Manga> listMangas = mangaService.listMangas();
        model.addAttribute("mangas", listMangas);
        session.setAttribute("mangas", listMangas);
        return "formulaire";
    }

    @GetMapping("/cart/{id}")
    public String panier(@PathVariable final Long id, Model model, HttpSession session) {
        Optional<User> user = userService.getUser(id);
        List<Manga> cart;
        cart = user.map(User::getCart).orElse(null);
        model.addAttribute("panier", cart);
        session.setAttribute("panier", cart);
        return "panier";
    }

    @GetMapping("/signin")
    public String signIn(HttpSession session, Model model) {
        List<User> user = userService.listUsers();
        model.addAttribute("listUser", user);
        session.setAttribute("listUser", user);
        return "connexion";
    }

    @PostMapping("/signinVerif")
    public String verifSignIn(@RequestParam Map<String, String> infos, HttpSession session) {
        List<User> listUser = userService.listUsers();
        for (User user : listUser) {
            if (user.getUsername().equals(infos.get("identifiant")) && user.getPassword().equals(infos.get("mdp"))) {
                session.setAttribute("user", user);
                return "redirect:/";
            }
        }
        return "redirect:/signin";
    }

    @GetMapping("/updateManga/{id}")
    public String updateM(Model model , HttpSession session, @PathVariable final Long id) {
        Optional<Manga> manga = mangaService.getManga(id);
        model.addAttribute("updateMangas", manga);
        session.setAttribute("updateMangas", manga);
        return "formUpdateManga";
    }

    @GetMapping("/addManga")
    public String addManga() {
        return "formNewManga";
    }

    @PostMapping("/saveManga")
    public String saveManga(@RequestParam Map<String, String> stringParams, @RequestParam int number, @RequestParam int stock) {
        Manga createdManga = new Manga();
        createdManga.setTitle(stringParams.get("title"));
        createdManga.setAuthor(stringParams.get("author"));
        createdManga.setNumber(number);
        createdManga.setGender(stringParams.get("gender"));
        createdManga.setEditor(stringParams.get("editor"));
        createdManga.setStock(stock);
        mangaService.saveManga(createdManga);
        return "redirect:/caracteristiques";
    }

    @GetMapping("/deleteManga/{id}")
    public String deleteManga(@PathVariable final Long id) {
        Optional<Manga> m = mangaService.getManga(id);
        if(m.isPresent()) {
            mangaService.deleteManga(id);
        }
        return "redirect:/caracteristiques";
    }

    @GetMapping("/deleteFromCart/{id}/{index}")
    public String deleteFromCart(@PathVariable final Long id, @PathVariable int index, HttpSession session) {
        Optional<User> user = userService.getUser(id);
        if (user.isPresent()) {
            Manga m = user.get().getCart().get(index);
            user.get().getCart().remove(index);
            m.setStock(m.getStock() + 1);
            mangaService.saveManga(m);
            session.setAttribute("user", user.get());
            userService.saveUser(user.get());
        }
        return "redirect:/cart/" + id;
    }

    @GetMapping("/addToCart/{userId}/{mangaId}")
    public String addToCart(@PathVariable final Long userId, @PathVariable final Long mangaId, HttpSession session) {
        Optional<User> u = userService.getUser(userId);
        Optional<Manga> m = mangaService.getManga(mangaId);
        if (u.isPresent() && m.isPresent()) {
            u.get().getCart().add(m.get());
            session.setAttribute("user", u.get());
            userService.saveUser(u.get());
            m.get().setStock(m.get().getStock() - 1);
            mangaService.saveManga(m.get());
        }
        return "redirect:/cart/" + userId;
    }


    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") final Long id, @RequestParam Map<String, String> params, @RequestParam("number") int number) {
        Optional<Manga> m = mangaService.getManga(id);
        if(m.isPresent()) {
            Manga currentManga = m.get();

            String title = params.get("title");
            if(title != null) {
                currentManga.setTitle(title);
            }
            String author = params.get("author");
            if(author != null) {
                currentManga.setAuthor(author);;
            }
            if(number < 0) {
                currentManga.setNumber(number);
            }
            String gender = params.get("gender");
            if(gender != null) {
                currentManga.setGender(gender);;
            }
            String editor = params.get("editor");
            if(editor != null) {
                currentManga.setEditor(editor);
            }
            mangaService.saveManga(currentManga);
        }
        return "redirect:/caracteristiques";
    }

}
