package com.ifg.spring.dto;

import com.ifg.spring.model.Banco;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

public interface PagingAndSorting extends CrudRepository<Banco , Integer> {
    Page<Banco> findAll(Pageable pageable);
}
