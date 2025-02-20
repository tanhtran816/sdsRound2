package com.example.anhtt.model.service;

import com.example.anhtt.model.dto.request.UserRequest;
import com.example.anhtt.model.dto.request.UserSearchRequest;
import com.example.anhtt.model.dto.response.UserDto;
import com.example.anhtt.model.entity.User;

import java.util.List;

public interface UserService {
    UserDto createUser(UserRequest request);

    UserDto updateUser(UserRequest request);

    boolean deleteUser(UserRequest request);

    List<UserDto> getAllUser(int page, int limit);

    List<UserDto> getUsers(UserSearchRequest req, int page, int limit);
}
