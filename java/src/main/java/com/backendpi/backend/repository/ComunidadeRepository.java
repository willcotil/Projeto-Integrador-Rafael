package com.backendpi.backend.repository;

import com.backendpi.backend.model.Comunidade;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ComunidadeRepository extends JpaRepository<Comunidade, Long> {
}