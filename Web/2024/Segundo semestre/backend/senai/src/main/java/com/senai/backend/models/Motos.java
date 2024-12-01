package com.senai.backend.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.senai.backend.utils.DataUtils;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Entity
@Table(name = "Motos")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Motos implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Parts front;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Parts engine;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Parts backWheel;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Parts frontWheel;

    private UUID userId;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss'Z'")
    @CreationTimestamp
    @Column(updatable = false)
    private LocalDateTime createdDate;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    public BigDecimal getTotalCost(){

        return new BigDecimal(0)
                .add(DataUtils.nullSafe(front.getCost()))
                .add(DataUtils.nullSafe(engine.getCost()))
                .add(DataUtils.nullSafe(backWheel.getCost()))
                .add(DataUtils.nullSafe(frontWheel.getCost()));
    }

}
