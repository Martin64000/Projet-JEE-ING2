package com.example.webprojet.model;

import lombok.Data;

@Data
public class Manga {

    private Long id;
    private String title;
    private String author;
    private int number;
    private String gender;
    private String editor;
}
