package com.senai.backend.specifications;

import com.senai.backend.models.Motos;
import net.kaczmarzyk.spring.data.jpa.domain.EqualIgnoreCase;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.data.jpa.domain.Specification;

public class MotosSpecification {

    @And({
            @Spec(path = "front.type", params = "frontType", spec = EqualIgnoreCase.class),
            @Spec(path = "engine.type", params = "engineType", spec = EqualIgnoreCase.class),
            @Spec(path = "backWheel.type", params = "backWheelType", spec = EqualIgnoreCase.class),
            @Spec(path = "frontWheel.type", params = "frontWheelType", spec = EqualIgnoreCase.class),

            @Spec(path = "front.id", params = "frontId", spec = EqualIgnoreCase.class),
            @Spec(path = "engine.id", params = "engineId", spec = EqualIgnoreCase.class),
            @Spec(path = "backWheel.id", params = "backWheelId", spec = EqualIgnoreCase.class),
            @Spec(path = "frontWheel.id", params = "frontWheelId", spec = EqualIgnoreCase.class),

    })
    public interface MotosSpec extends Specification<Motos> {}
}
