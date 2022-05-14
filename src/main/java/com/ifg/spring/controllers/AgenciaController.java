package com.ifg.spring.controllers;

import com.ifg.spring.model.Agencia_BancariaRepository;
import com.ifg.spring.model.Agencia_bancaria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/agencia")
public class AgenciaController {

    @Autowired
    private Agencia_BancariaRepository agenciaBancariaRepository;

    @GetMapping("")
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView("agencia/Agencia");
        modelAndView.addObject("agencias", this.agenciaBancariaRepository.findAll());
        return modelAndView;
    }

    @GetMapping("/novo")
    public ModelAndView newAgencia(){
        ModelAndView modelAndView =  new ModelAndView("agencia/novo");
        modelAndView.addObject(new Agencia_bancaria());
        return modelAndView;
    }
    @PostMapping("/novo")
    public String newAgencia(@Valid Agencia_bancaria agencia_bancaria, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "redirect:/agencia";
        }
        this.agenciaBancariaRepository.save(agencia_bancaria);
        return "redirect:/agencia";
    }

    @GetMapping("{id}/delete")
    public String delete(@PathVariable Integer id){
        try{
            this.agenciaBancariaRepository.deleteById(id);
            return  "redirect:/agencia";
        }catch (EmptyResultDataAccessException e){
            return "redirect:/agencia";
        }
    }
}
