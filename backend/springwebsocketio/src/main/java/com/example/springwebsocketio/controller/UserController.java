package com.example.springwebsocketio.controller;

import com.example.springwebsocketio.entity.User;
import com.example.springwebsocketio.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.messaging.handler.annotation.*;
import org.springframework.web.bind.annotation.*;
import org.webjars.NotFoundException;

@RestController
@AllArgsConstructor
@RequestMapping("/api/user")
public class UserController {
    private final UserService userService;


    @MessageMapping("/user/saveUser")
    @SendTo("/user/topic")
    public User saveUser(@Payload User user) {
        return userService.saveUser(user);
    }


    @PostMapping
    public User connectUser(@RequestBody User user) {
//        throw new NotFoundException("Not found");
        return userService.saveUser(user);
    }
}
