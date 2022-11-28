package com.example.webprojet.repository;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "com.example.webprojet")
@Data
public class CustomProperties {
    private String apiUrl;
}
