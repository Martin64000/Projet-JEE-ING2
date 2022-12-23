package com.example.apiprojet.repository;

import com.example.apiprojet.model.Manga;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MangaRepository extends JpaRepository<Manga, Long> {

    List<Manga> findByTitleContainingOrAuthorContaining(String title, String author);
}
