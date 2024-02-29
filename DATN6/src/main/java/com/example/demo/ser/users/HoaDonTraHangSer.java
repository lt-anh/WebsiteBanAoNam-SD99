package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonTraHang;

import java.util.List;
import java.util.UUID;

public interface HoaDonTraHangSer {

    List<HoaDonTraHang> getAll();

    void add(HoaDonTraHang hoaDonTraHang);

    void delete(UUID id);

    void update(UUID id, HoaDonTraHang hdth);

    HoaDonTraHang findById(UUID id);
}
