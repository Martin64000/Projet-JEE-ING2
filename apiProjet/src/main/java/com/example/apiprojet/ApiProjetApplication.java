package com.example.apiprojet;

import com.example.apiprojet.model.Employee;
import com.example.apiprojet.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;

//test
@SpringBootApplication
public class ApiProjetApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(ApiProjetApplication.class, args);
    }

    @Autowired
    private EmployeeService employeeService;

    @Override
    public void run(String... args) throws Exception {
        System.out.println(employeeService.listEmployees());
        System.out.println(employeeService.getEmployee(1L));
    }
}
