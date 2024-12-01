package com.senai.backend.models.dto;


import com.senai.backend.models.PartType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class PartsDto implements Serializable {

    @NotBlank
    private String src;
    @NotNull
    private BigDecimal cost;
    @NotNull
    private PartType type;
}
