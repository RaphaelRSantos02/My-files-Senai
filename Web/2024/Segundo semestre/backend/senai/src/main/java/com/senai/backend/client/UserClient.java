package com.senai.backend.client;

import com.senai.backend.models.dto.UserDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.UUID;

@FeignClient(name = "user-client", url="${app.users-microservice.url}")
public interface UserClient {

    @GetMapping("/user/{userId}")
    UserDto getUserById(@PathVariable UUID userId);

}
