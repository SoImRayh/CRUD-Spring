package com.ifg.spring.controllers;

import com.ifg.spring.dto.Agencia_BancariaRequisicao;
import com.ifg.spring.model.Agencia_BancariaRepository;
import com.ifg.spring.model.Agencia_bancaria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
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
import java.util.Optional;

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

    @GetMapping("/update/{id}")
    public ModelAndView update(@PathVariable Integer id, Agencia_BancariaRequisicao a,BindingResult bindingResult){
        Optional<Agencia_bancaria> optional = this.agenciaBancariaRepository.findById(id);
        if (bindingResult.hasErrors()){
            return new ModelAndView("redirect:/agencia");
        }else{
            try{
                a.fromAgencia_bancaria(optional.get());
                ModelAndView modelAndView = new ModelAndView("agencia/update");
                modelAndView.addObject("requisicao",a);
                modelAndView.addObject("agenciaid",optional.orElseThrow().getId());

                return modelAndView;
            }catch (EmptyResultDataAccessException e){
                System.out.println(e);
                return new ModelAndView("redirect:/agencia");
            }
        }
    }
    @PostMapping("/update/{id}")
    public ModelAndView update(@PathVariable Integer id, Agencia_BancariaRequisicao a) {
    Optional<Agencia_bancaria> optional = this.agenciaBancariaRepository.findById(id);
    if (optional.isPresent()){
        try{
            Agencia_bancaria agencia = optional.get();
            a.toAgencia_bancaria(agencia);
            this.agenciaBancariaRepository.save(agencia);
            return new ModelAndView("redirect:/agencia");
        }catch (EmptyResultDataAccessException e){
            return new ModelAndView("redirect:/agencia");
        }
    }else {
        return new ModelAndView("redirect:/agencia");
    }
    }
}
