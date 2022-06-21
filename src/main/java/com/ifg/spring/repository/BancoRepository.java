package com.ifg.spring.repository;

import com.ifg.spring.model.Banco;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BancoRepository extends PagingAndSortingRepository<Banco, Integer > {
    @Query(value = "SELECT * FROM banco WHERE banco.nome ilike initcap(?1) or banco.numero ilike INITCAP(?1) order by banco.id",
            countQuery = "SELECT count(*) FROM banco WHERE banco.nome like ?1 or banco.numero like ?1",
            nativeQuery = true)
    Page<Banco> searchByFilter(String filter, Pageable pageable);
}
