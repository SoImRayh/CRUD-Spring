package com.ifg.spring.repository;

import com.ifg.spring.model.Agencia_bancaria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Agencia_BancariaRepository extends JpaRepository<Agencia_bancaria, Integer> {

}
