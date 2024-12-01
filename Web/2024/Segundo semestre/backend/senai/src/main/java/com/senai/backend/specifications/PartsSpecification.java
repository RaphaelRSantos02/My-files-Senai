package com.senai.backend.specifications;

import com.senai.backend.models.Parts;
import net.kaczmarzyk.spring.data.jpa.domain.*;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.data.jpa.domain.Specification;

public class PartsSpecification {

    @And({
            @Spec(path = "type", params = "type", spec = EqualIgnoreCase.class),
            @Spec(path = "cost", params = "cost.max", spec = LessThanOrEqual.class),
            @Spec(path = "cost", params = "cost.min", spec = GreaterThanOrEqual.class),
            @Spec(path = "createdDate", params = {"after","before"}, spec = Between.class),
    })
    public static interface PartsSpec extends Specification<Parts> {}
}
