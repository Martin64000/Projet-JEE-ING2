package com.example.webprojet.service;

import com.example.webprojet.model.Manga;
import com.example.webprojet.repository.MangaProxy;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Data
@Service
public class MangaService {

    @Autowired
    private MangaProxy mangaProxy;

    /*
    public Manga getEmployee(final int id) {
        return mangaProxy.getManga(id);
    }
    */

    public Iterable<Manga> getMangas() {
        return mangaProxy.getMangas();
    }

    /*
    public void deleteManga(final int id) {
        mangaProxy.deleteManga(id);;
    }
    */

    /*
    public Manga saveManga(Manga manga) {
        Manga savedManga;

        if(manga.getId() == null) {
            // Si l'id est nul, alors c'est un nouvel employé.
            savedManga = mangaProxy.createManga(manga);
        } else {
            savedManga = mangaProxy.updateManga(manga);
        }

        return savedManga;
    }
    */
}
