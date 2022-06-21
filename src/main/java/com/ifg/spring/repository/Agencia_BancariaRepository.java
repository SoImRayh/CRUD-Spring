package com.ifg.spring.repository;

import com.ifg.spring.model.Agencia_bancaria;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Agencia_BancariaRepository extends PagingAndSortingRepository<Agencia_bancaria, Integer> {

    @Query(value = "SELECT * FROM agencia_bancaria WHERE agencia_bancaria.nome_agencia ilike ?1 or agencia_bancaria.agencia ilike ?1",
            countQuery = "select count(*) from agencia_bancaria WHERE agencia_bancaria.nome_agencia ilike ?1 or agencia_bancaria.agencia ilike ?1",
            nativeQuery = true)
    Page<Agencia_bancaria> findbyFilter(String filter, Pageable pageable);
}
