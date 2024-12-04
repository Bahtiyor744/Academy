package com.example.academy.entity;

import com.example.academy.base.BaseEntity;
import com.example.academy.enums.PayType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment extends BaseEntity {
    private int amount;
    private PayType payType;
    private LocalDateTime date = LocalDateTime.now();
    @ManyToOne
    private Student student;
}
