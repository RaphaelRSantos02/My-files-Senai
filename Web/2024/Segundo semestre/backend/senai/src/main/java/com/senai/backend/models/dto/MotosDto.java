package com.senai.backend.models.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.senai.backend.models.Parts;
import com.senai.backend.models.Motos;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Data
public class MotosDto implements Serializable {

    private UUID front;
    private UUID engine;
    private UUID backWheel;
    private UUID frontWheel;
    private UUID userId;

    @JsonIgnore
    public Motos mapToMotos(){
        return Motos.builder()
                .front(Parts.builder().id(this.front).build())
                .engine(Parts.builder().id(this.engine).build())
                .backWheel(Parts.builder().id(this.backWheel).build())
                .frontWheel(Parts.builder().id(this.frontWheel).build())
                .userId(this.userId)
                .build();
    }
}
