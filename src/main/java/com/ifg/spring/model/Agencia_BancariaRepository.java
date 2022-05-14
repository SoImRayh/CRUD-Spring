package com.ifg.spring.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Agencia_BancariaRepository extends JpaRepository<Agencia_bancaria, Integer> {

}
