package com.ifg.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CrudController {
    @GetMapping("/banco")
    public String banco(){
        return "Banco";
    }

    @GetMapping("/teste")
    public String teste(){
        return "teste";
    }

    @GetMapping("/teste/novo")
    public String novo(){
        return "novo";
    }
}
