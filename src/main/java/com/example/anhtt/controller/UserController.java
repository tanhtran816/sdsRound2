package com.example.anhtt.controller;

import com.example.anhtt.model.dto.request.UserRequest;
import com.example.anhtt.model.dto.request.UserSearchRequest;
import com.example.anhtt.model.dto.response.UserDto;
import com.example.anhtt.model.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@Tag(name = "Example API", description = "API Demo với Swagger 3")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping(value = "/user")
    public ResponseEntity<?> getUser(UserSearchRequest request,
                                     @RequestParam(required = false, defaultValue = "0") int page,
                                     @RequestParam(required = false, defaultValue = "10") int limit) {
        List<UserDto> userDtos = userService.getUsers(request, page, limit);
        return new ResponseEntity<>(userDtos, HttpStatus.OK);
    }

    @PostMapping(value = "/user")
    public ResponseEntity<?> saveUser(@Valid @RequestBody UserRequest request) {
        UserDto userDto = userService.createUser(request);
        return new ResponseEntity<>(userDto, HttpStatus.OK);

    }

    @PatchMapping(value = "/user")
    public ResponseEntity<?> updateUser(@Valid @RequestBody UserRequest request) {
        UserDto userDto = userService.updateUser(request);
        return new ResponseEntity<>(userDto, HttpStatus.OK);

    }

    @DeleteMapping(value = "/user")
    public ResponseEntity<?> deleteUser(@Valid @RequestBody UserRequest request) {
        boolean userDto = userService.deleteUser(request);
        if (!userDto) {
            return new ResponseEntity<>("Delete failed", HttpStatus.OK);
        }
        return new ResponseEntity<>("Delete success", HttpStatus.OK);
    }

    @GetMapping(value = "/allUser")
    public ResponseEntity<?> getAllUser(UserSearchRequest request,
                                        @RequestParam(required = false, defaultValue = "0") int page,
                                        @RequestParam(required = false, defaultValue = "10") int limit) {
        List<UserDto> userDtos = userService.getAllUser(page, limit);
        return new ResponseEntity<>(userDtos, HttpStatus.OK);
    }

}
