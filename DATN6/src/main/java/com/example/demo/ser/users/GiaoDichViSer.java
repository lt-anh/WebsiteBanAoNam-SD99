package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.GiaoDichVi;

import java.util.List;
import java.util.UUID;

public interface GiaoDichViSer {
    List<GiaoDichVi> findAllByKhachHang(UUID id);

    void add(GiaoDichVi giaoDichVi);

    void update(UUID id, GiaoDichVi updateGD);

    GiaoDichVi findByMa(String ma);
}
