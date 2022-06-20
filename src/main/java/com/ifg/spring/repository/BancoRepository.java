package com.ifg.spring.repository;

import com.ifg.spring.dto.RequisicaoBanco;
import com.ifg.spring.model.Banco;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BancoRepository extends PagingAndSortingRepository<Banco, Integer > {

    @Query(value = "SELECT * FROM banco WHERE banco.numero like ?1",
            countQuery = "SELECT count(*) FROM banco WHERE banco.numero = ?1",
            nativeQuery = true)
    Page<Banco> searchByNumero(String numero, Pageable pageable);

    @Query(value = "SELECT * FROM banco WHERE banco.nome like ?1 and banco.numero like ?2",
            countQuery = "SELECT count(*) from banco where banco.nome = ?1 or banco.numero = ?2",
            nativeQuery = true)
    Page<Banco> searchByFilter(String nome, String numero, Pageable pageable );
}
