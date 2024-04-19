package com.example.springwebsocketio.service;

import com.example.springwebsocketio.entity.User;

import java.rmi.AlreadyBoundException;

public interface UserService {
    public User saveUser(User user);
    public boolean connectUser(User user);
    public boolean disconnectUser(User user);
}
