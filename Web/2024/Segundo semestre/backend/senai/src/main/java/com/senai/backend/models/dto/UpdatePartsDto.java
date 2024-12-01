package com.senai.backend.models.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.UUID;
@EqualsAndHashCode(callSuper = true)
@Data
public class UpdatePartsDto extends PartsDto
        implements Serializable {

    private UUID id;
}
