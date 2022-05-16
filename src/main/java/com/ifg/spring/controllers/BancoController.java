package com.ifg.spring.controllers;

import com.ifg.spring.dto.RequisicaoBanco;
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

import javax.validation.UnexpectedTypeException;
import javax.validation.Valid;
import java.util.Optional;

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
    public ModelAndView salvar(RequisicaoBanco requisicaoBanco, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult);

            return new ModelAndView("redirect:/banco/novo");
        }

        this.bancoRepository.save(requisicaoBanco.toBanco());
        return new ModelAndView("redirect:/banco");
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
    @GetMapping("/{id}")
    public ModelAndView show(@PathVariable Integer id){
        Optional<Banco>  optional = this.bancoRepository.findById(id);

        if(optional.isPresent()){
            Banco banco = optional.get();
            ModelAndView modelAndView = new ModelAndView("banco/show");
            modelAndView.addObject("banco", banco );
            return modelAndView;
        }else{
            return  new ModelAndView("redirect:/banco");
        }
    }
    @GetMapping("/update/{id}")
    public ModelAndView update(@PathVariable Integer id, RequisicaoBanco requisicaoBanco,BindingResult bindingResult){
        Optional<Banco> optional = this.bancoRepository.findById(id);

        if(optional.isPresent()) {
            requisicaoBanco.fromBanco(optional.get());

            ModelAndView modelAndView = new ModelAndView("banco/update");
            modelAndView.addObject("requisicaoNovoBanco", requisicaoBanco);
            modelAndView.addObject("bancoId",optional.orElseThrow().getId());
            return modelAndView;
        }else{
            return new ModelAndView("redirect:/banco");
        }
    }

    @PostMapping("/update/{id}")
    public ModelAndView update(@PathVariable Integer id, RequisicaoBanco requisicaoBanco){
        Optional<Banco> optional = this.bancoRepository.findById(id);
        if(optional.isPresent()){
            try {
                Banco banco = optional.get();
                requisicaoBanco.toBanco(banco);
                this.bancoRepository.save(banco);
                return new ModelAndView("redirect:/banco");
            }catch (UnexpectedTypeException e){
                return new ModelAndView("redirect:/banco");
            }
        }else{
            return new ModelAndView("redirect:/banco");
        }
    }
}
