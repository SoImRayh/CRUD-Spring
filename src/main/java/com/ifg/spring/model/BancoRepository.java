package com.ifg.spring.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BancoRepository extends PagingAndSortingRepository<Banco, Integer > {
}
