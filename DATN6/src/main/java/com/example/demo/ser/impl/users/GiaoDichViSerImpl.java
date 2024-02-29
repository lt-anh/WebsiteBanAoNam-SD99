package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.GiaoDichVi;
import com.example.demo.repo.users.GiaoDichViRepo;
import com.example.demo.ser.users.GiaoDichViSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GiaoDichViSerImpl implements GiaoDichViSer {

    @Autowired
    GiaoDichViRepo giaoDichViRepo;
    @Override
    public List<GiaoDichVi> findAllByKhachHang(UUID id) {
        return giaoDichViRepo.findAllByKhachHang(id);
    }

    @Override
    public void add(GiaoDichVi giaoDichVi) {
        giaoDichViRepo.save(giaoDichVi);
    }

    @Override
    public void update(UUID id, GiaoDichVi updateGD) {
        Optional<GiaoDichVi> optionalGiaoDichVi = giaoDichViRepo.findById(id);
        if(optionalGiaoDichVi.isPresent()){
            GiaoDichVi giaoDichVi = optionalGiaoDichVi.get();

            giaoDichVi.setMa(updateGD.getMa());
            giaoDichVi.setDonGia(updateGD.getDonGia());
            giaoDichVi.setNgayGiaoDich(updateGD.getNgayGiaoDich());
            giaoDichVi.setNhanVien(updateGD.getNhanVien());
            giaoDichVi.setViShop(updateGD.getViShop());
            giaoDichVi.setHinhThuc(updateGD.getHinhThuc());
            giaoDichVi.setTrangThai(updateGD.getTrangThai());

            giaoDichViRepo.save(giaoDichVi);
        }
    }

    @Override
    public GiaoDichVi findByMa(String ma) {
        return giaoDichViRepo.findByMa(ma);
    }
}
