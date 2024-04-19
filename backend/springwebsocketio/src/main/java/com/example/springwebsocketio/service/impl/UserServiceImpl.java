package com.example.springwebsocketio.service.impl;

import com.example.springwebsocketio.entity.User;
import com.example.springwebsocketio.repository.UserRepository;
import com.example.springwebsocketio.service.UserService;
import com.example.springwebsocketio.util.Status;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.rmi.AlreadyBoundException;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    @Override
    public User saveUser(User user) {
        return userRepository.findByName(user.getName()).orElseGet(() -> userRepository.save(user));
    }

    @Override
    public boolean connectUser(User user) {
        AtomicBoolean isConnect = new AtomicBoolean(false);
        userRepository.findById(user.getId()).ifPresent(savedUser -> {
            savedUser.setStatus(Status.ONLINE);
            userRepository.save(savedUser);
            isConnect.set(true);
        });
        return isConnect.get();
    }

    @Override
    public boolean disconnectUser(User user) {
        AtomicBoolean isDisonnect = new AtomicBoolean(false);
        userRepository.findById(user.getId()).ifPresent(savedUser -> {
            savedUser.setStatus(Status.OFFLINE);
            userRepository.save(savedUser);
            isDisonnect.set(true);
        });
        return isDisonnect.get();
    }
}
