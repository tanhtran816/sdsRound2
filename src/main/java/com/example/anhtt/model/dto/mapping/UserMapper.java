package com.example.anhtt.model.dto.mapping;

import com.example.anhtt.model.dto.request.UserRequest;
import com.example.anhtt.model.dto.response.UserDto;
import com.example.anhtt.model.entity.User;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface UserMapper {
    UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

    UserDto userToUserDto(User user);

    List<UserDto> usersToUserDTOs(List<User> users);

    User userRequestToUser(UserRequest userRequest);
}
