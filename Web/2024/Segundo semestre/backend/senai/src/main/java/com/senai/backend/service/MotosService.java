package com.senai.backend.service;

import com.senai.backend.models.Motos;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;
import java.util.UUID;

public interface MotosService {

    Page<Motos> getAllMotos(Pageable page, Specification<Motos> spec);

    List<Motos> saveMotos(List<Motos> motos);

    Motos updateMotos(Motos moto);

    void deleteMotos(UUID id);
}
