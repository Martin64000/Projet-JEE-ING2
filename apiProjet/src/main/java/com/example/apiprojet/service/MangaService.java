package com.example.apiprojet.service;

import com.example.apiprojet.model.Manga;
import com.example.apiprojet.repository.MangaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MangaService {

    @Autowired
    private MangaRepository mangaRepository;

    public List<Manga> listMangas() {
        return mangaRepository.findAll();
    }

    public Optional<Manga> getManga(Long id) {
        return mangaRepository.findById(id);
    }

    public void deleteManga(final Long id) {
        mangaRepository.deleteById(id);
    }

    public Manga saveManga(Manga manga) {
        return mangaRepository.save(manga);
    }
}
