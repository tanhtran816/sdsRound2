package com.example.anhtt.model.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserRequest {

    private Long id;

    @NotNull(message = "First name cannot be null")
    @Size(min = 2, max = 50, message = "First name should be between 2 and 50 characters")
    private String firstName;

    @NotNull(message = "Last name cannot be null")
    @Size(min = 2, max = 50, message = "First name should be between 2 and 50 characters")
    private String lastName;

    @Email(message = "Email should be valid")
    @NotNull(message = "Email cannot be null")
    private String email;

    @Pattern(regexp = "^\\d{10}$", message = "Phone number should have 10 digits")
    private String phoneNumber;

    private String zipCode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public @NotNull(message = "First name cannot be null") @Size(min = 2, max = 50, message = "First name should be between 2 and 50 characters") String getFirstName() {
        return firstName;
    }

    public void setFirstName(@NotNull(message = "First name cannot be null") @Size(min = 2, max = 50, message = "First name should be between 2 and 50 characters") String firstName) {
        this.firstName = firstName;
    }

    public @NotNull(message = "Last name cannot be null") @Size(min = 2, max = 50, message = "First name should be between 2 and 50 characters") String getLastName() {
        return lastName;
    }

    public void setLastName(@NotNull(message = "Last name cannot be null") @Size(min = 2, max = 50, message = "First name should be between 2 and 50 characters") String lastName) {
        this.lastName = lastName;
    }

    public @Email(message = "Email should be valid") @NotNull(message = "Email cannot be null") String getEmail() {
        return email;
    }

    public void setEmail(@Email(message = "Email should be valid") @NotNull(message = "Email cannot be null") String email) {
        this.email = email;
    }

    public @Pattern(regexp = "^\\d{10}$", message = "Phone number should have 10 digits") String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(@Pattern(regexp = "^\\d{10}$", message = "Phone number should have 10 digits") String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
}
