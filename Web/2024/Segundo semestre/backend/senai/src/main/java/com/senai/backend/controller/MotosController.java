package com.senai.backend.controller;

import com.senai.backend.models.Motos;
import com.senai.backend.models.dto.MotosDto;
import com.senai.backend.models.dto.UpdateMotosDto;
import com.senai.backend.service.MotosService;
import com.senai.backend.specifications.MotosSpecification;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/motos")
@CrossOrigin(origins = "*")
public class MotosController {
    @Autowired
    MotosService motosService;

    public MotosController() {
    }

    @GetMapping
    public ResponseEntity<Page<Motos>> getAllMotos(Pageable pageable, MotosSpecification.MotosSpec spec) {
        return ResponseEntity.ok(this.motosService.getAllMotos(pageable, spec));
    }

    @PostMapping
    public ResponseEntity<List<Motos>> addNewMotos(@RequestBody @Valid List<MotosDto> motos) {
        List<Motos> motosList = motos.stream().map(MotosDto::mapToMotos).toList();
        return ResponseEntity.status(HttpStatus.CREATED).body(this.motosService.saveMotos(motosList));
    }

    @PutMapping({"/{id}"})
    public ResponseEntity<Motos> updateMotos(@PathVariable UUID id, @RequestBody @Valid UpdateMotosDto motos) {
        Motos convertedMotos = motos.mapToMotos();
        convertedMotos.setId(id);
        return ResponseEntity.status(HttpStatus.ACCEPTED).body(this.motosService.updateMotos(convertedMotos));
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping({"/{id}"})
    public void deleteMotos(@PathVariable UUID id) {
        this.motosService.deleteMotos(id);
    }
}