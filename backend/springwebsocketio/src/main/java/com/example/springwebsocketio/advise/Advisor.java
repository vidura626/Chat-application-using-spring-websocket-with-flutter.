package com.example.springwebsocketio.advise;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class Advisor {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleCommonException(Exception ex) {
        return ResponseEntity.badRequest().body(ex.getMessage());
    }

}
