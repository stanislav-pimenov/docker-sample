package com.epam.microservices;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @GetMapping("/hello")
    String hello() {
        return "Hi from dockerized microservice";
    }
}
