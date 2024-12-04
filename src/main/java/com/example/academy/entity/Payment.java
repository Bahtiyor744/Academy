package com.example.academy.entity;

import com.example.academy.enums.PayType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private int amount;
    private PayType payType;
    private LocalDateTime date = LocalDateTime.now();
    @ManyToOne
    private Student student;

    public Payment(int amount, PayType payType, LocalDateTime date, Student student) {
        this.amount = amount;
        this.payType = payType;
        this.date = date;
        this.student = student;
    }
}
