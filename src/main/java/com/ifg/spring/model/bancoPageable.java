package com.ifg.spring.model;

import org.springframework.data.repository.PagingAndSortingRepository;

public interface bancoPageable extends PagingAndSortingRepository<Banco ,Integer > {
}
