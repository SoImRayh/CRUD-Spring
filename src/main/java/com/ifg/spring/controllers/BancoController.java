package com.ifg.spring.controllers;

import com.ifg.spring.model.Banco;
import com.ifg.spring.model.BancoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/banco")
public class BancoController {

    @Autowired
    private BancoRepository bancoRepository;


    @GetMapping("")
    public ModelAndView banco(){

        ModelAndView mv = new ModelAndView("banco/Banco");
        mv.addObject("bancos", this.bancoRepository.findAll());
        return mv;
    }

    @GetMapping("/novo")
    public ModelAndView novo(){
        ModelAndView modelAndView = new ModelAndView("/banco/Novo");
        modelAndView.addObject(new Banco());
        return modelAndView;
    }
    @PostMapping("/novo")
    public String salvar(@Valid Banco banco, BindingResult bindingResult){
        if (bindingResult.hasErrors()){

            return "redirect:/banco/novo";
        }
        this.bancoRepository.save(banco);
        return "redirect:/banco";
    }

    @GetMapping("/editar")
    public String editar(){

        return "Editar";
    }

    @GetMapping("/{id}/delete")
    public String excluir(@PathVariable Integer id){
        try{
            this.bancoRepository.deleteById(id);
            return "redirect:/banco";
        }catch (EmptyResultDataAccessException e){
            return "redirect:/banco";
        }

    }
}
