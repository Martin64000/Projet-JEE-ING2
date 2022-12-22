package com.example.apiprojet.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "mangas")
public class Manga {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "author")
    private String author;

    @Column(name = "number")
    private int number;

    @Column(name = "gender")
    private String gender;

    @Column(name = "editor")
    private String editor;

    @Column
    private int stock;
}