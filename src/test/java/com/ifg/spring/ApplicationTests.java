package com.ifg.spring;

import com.ifg.spring.model.Banco;
import com.ifg.spring.repository.BancoRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

@SpringBootTest
class ApplicationTests {
    @Autowired
    BancoRepository bancoRepository;

    @Test
    void contextLoads() {
    }

    @Test
    void buscarComFiltro(){
        Page<Banco> page = this.bancoRepository.searchByFilter("brasil", PageRequest.of(0,20));
    }

}
