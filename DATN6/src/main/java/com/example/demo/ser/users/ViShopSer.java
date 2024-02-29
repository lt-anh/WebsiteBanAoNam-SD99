package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.ViShop;

import java.util.UUID;

public interface ViShopSer {

    void add(ViShop viShop);

    void update(UUID id, ViShop updateVi);

    ViShop findByIdKhachHang(UUID id);
}
