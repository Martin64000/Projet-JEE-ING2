package com.example.apiprojet;

import com.example.apiprojet.service.MangaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//test
@SpringBootApplication
public class ApiProjetApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(ApiProjetApplication.class, args);
    }

    @Autowired
    private MangaService mangaService;

    @Override
    public void run(String... args) throws Exception {
        System.out.println(mangaService.listMangas());
        System.out.println(mangaService.getManga(1L));
    }
}
