package com.example.anhtt.model.service.impl;

import com.example.anhtt.model.dao.UserDao;
import com.example.anhtt.model.dto.mapping.UserMapper;
import com.example.anhtt.model.dto.request.UserRequest;
import com.example.anhtt.model.dto.request.UserSearchRequest;
import com.example.anhtt.model.dto.response.UserDto;
import com.example.anhtt.model.entity.User;
import com.example.anhtt.model.exception.ApiException;
import com.example.anhtt.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;


    @Override
    public UserDto createUser(UserRequest request) {
        try {
            User checkUser = userDao.getByEmail(request.getEmail());
            if (checkUser != null) {
                throw new ApiException("Email already exists");
            }
            User u = userDao.save(UserMapper.INSTANCE.userRequestToUser(request));
            return UserMapper.INSTANCE.userToUserDto(u);
        } catch (ApiException e) {
            throw e
                    ;
        }
    }

    @Override
    public UserDto updateUser(UserRequest request) {
        try {
            User checkUser = userDao.findById(request.getId()).orElse(null);
            if (checkUser == null) {
                throw new ApiException("User does not exist");
            }
            User u = userDao.save(UserMapper.INSTANCE.userRequestToUser(request));
            return UserMapper.INSTANCE.userToUserDto(u);
        } catch (ApiException e) {
            throw e;
        }
    }

    @Override
    public boolean deleteUser(UserRequest request) {
        try {
            User checkUser = userDao.findById(request.getId()).orElseThrow(() -> new ApiException("User does not exist"));
            if (checkUser == null) {
                throw new ApiException("User does not exist");
            }
            userDao.delete(UserMapper.INSTANCE.userRequestToUser(request));
            return true;
        } catch (ApiException e) {
            throw e;
        }
    }

    @Override
    public List<UserDto> getAllUser(int page, int limit) {
        Pageable pageable = PageRequest.of(page, limit);
        Page<User> users = userDao.findAll(pageable);
        return UserMapper.INSTANCE.usersToUserDTOs(users.getContent());
    }

    @Override
    public List<UserDto> getUsers(UserSearchRequest req, int page, int limit) {
        Pageable pageable = PageRequest.of(page, limit);
        Page<User> users = userDao.findByIdOrEmailOrName(req.getId(), req.getEmail(), req.getFirstName(), req.getLastName(), pageable);
        return UserMapper.INSTANCE.usersToUserDTOs(users.getContent());
    }
}
