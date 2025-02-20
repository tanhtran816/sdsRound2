package com.example.anhtt.model.exception;

public class ApiException extends RuntimeException {
    public ApiException(String errMessage) {
        super(errMessage);
    }
}
