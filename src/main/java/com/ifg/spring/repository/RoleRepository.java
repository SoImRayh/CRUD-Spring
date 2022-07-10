package com.ifg.spring.repository;

import com.ifg.spring.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {

    public Role findByRole(final String role);
}
