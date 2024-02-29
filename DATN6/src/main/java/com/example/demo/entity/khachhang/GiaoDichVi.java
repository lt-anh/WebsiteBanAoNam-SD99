package com.example.demo.entity.khachhang;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "GiaoDichVi")
public class GiaoDichVi {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    private String ma;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdVi",referencedColumnName = "Id")
    ViShop viShop;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdNhanVien",referencedColumnName = "Id")
    Users nhanVien;

    @Column(name = "DonGia")
    BigDecimal donGia;

    @Column(name = "NgayGiaoDich")
    LocalDateTime ngayGiaoDich;

    @Column(name = "HinhThuc")
    private int hinhThuc;

    @Column(name = "TrangThai")
    private int trangThai;
}
