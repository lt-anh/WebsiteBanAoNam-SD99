package com.example.demo.entity.chat;

import com.example.demo.entity.khachhang.Users;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Table(name = "ChatMessage")
@Entity
public class MessageChat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "content ")
    private String content;
    @Column(name = "timestamp ")
    private LocalDateTime timestamp;
    @ManyToOne
    @JoinColumn(name = "iduser",referencedColumnName = "Id")
    private Users users;
    @Column(name = "bientrunggian")
    private String bientrunggian;

    @Column(name = "TrangThai")
    private int trangThai;
}
