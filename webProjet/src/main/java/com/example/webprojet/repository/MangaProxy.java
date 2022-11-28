package com.example.webprojet.repository;

import com.example.webprojet.model.Manga;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Component
public class MangaProxy {

    @Autowired
    private CustomProperties props;

    public Iterable<Manga> getMangas() {
        String baseApiUrl = props.getApiUrl();
        String getMangaUrl = baseApiUrl + "/mangas";

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Iterable<Manga>> response = restTemplate.exchange(
                getMangaUrl,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<Iterable<Manga>>() {}
        );

        return response.getBody();
    }

    public Manga createEmployee(Manga m) {
        String baseApiUrl = props.getApiUrl();
        String createEmployeeUrl = baseApiUrl + "/manga";

        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Manga> request = new HttpEntity<Manga>(m);
        ResponseEntity<Manga> response = restTemplate.exchange(
                createEmployeeUrl,
                HttpMethod.POST,
                request,
                Manga.class
        );

        log.debug("Create Employee call " + response.getStatusCode().toString());

        return response.getBody();
    }
}
