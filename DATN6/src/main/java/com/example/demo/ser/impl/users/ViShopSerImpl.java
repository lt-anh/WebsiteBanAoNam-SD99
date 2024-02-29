package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.ViShop;
import com.example.demo.repo.users.ViShopRepo;
import com.example.demo.ser.users.ViShopSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class ViShopSerImpl implements ViShopSer {

    @Autowired
    ViShopRepo viShopRepo;

    @Override
    public void add(ViShop viShop) {
        viShopRepo.save(viShop);
    }

    @Override
    public void update(UUID id, ViShop updateVi) {
        Optional<ViShop> optionalViShop = viShopRepo.findById(id);
        if (optionalViShop.isPresent()){
            ViShop viShop = optionalViShop.get();
            viShop.setMa(updateVi.getMa());
            viShop.setKhachHang(updateVi.getKhachHang());
            viShop.setTongTien(updateVi.getTongTien());
            viShop.setTrangThai(updateVi.getTrangThai());

            viShopRepo.save(viShop);
        }
    }

    @Override
    public ViShop findByIdKhachHang(UUID id) {
        return viShopRepo.findByIdKhachHang(id);
    }
}
