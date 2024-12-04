package com.example.academy.entity;

import com.example.academy.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student extends BaseEntity {
    private String firstName;
    private String lastName;
    private int age;
    private Integer phone;
    @ManyToOne
    private Groups groups;
}
