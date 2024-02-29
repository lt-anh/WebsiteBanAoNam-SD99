package com.example.demo.ser.impl.giamgia;

import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.repo.sanpham.AoRepo;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class GiamGiaSanPhamChiTietSerImpl implements GiamGiaSanPhamChiTietSer {

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Autowired
    AoRepo aoRepo;

    @Override
    public List<GiamGiaSanPhamChiTiet> getAll() {
        return giamGiaSanPhamChiTietRepo.findAll();
    }

    @Override
    public void add(GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet) {
        giamGiaSanPhamChiTietRepo.save(giamGiaSanPhamChiTiet);
    }

    @Override
    public List<AoDTO> findAllByTrangThai(Integer trangThai) {

        List<AoDTO> list = new ArrayList<>();

        for (GiamGiaSanPhamChiTiet ggct : giamGiaSanPhamChiTietRepo.findAllByTrangThai(trangThai)){
            AoDTO aoDTO = new AoDTO();
            aoDTO.setAo(ggct.getAo());
            aoDTO.setSlBan(aoRepo.soLuongBanByUUID(ggct.getAo().getId()));

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ggct.getAo().getId());
            if (giamGiaSanPhamChiTiet != null){
                int giaBan = ggct.getAo().getGiaBan().toBigInteger().intValue() - (giamGiaSanPhamChiTiet.getSoTienDaGiam().toBigInteger().intValue()/100);
                aoDTO.setGiaBan(giaBan);
            }else {
                int giaBan = ggct.getAo().getGiaBan().toBigInteger().intValue();
                aoDTO.setGiaBan(giaBan);
            }
            list.add(aoDTO);
        }

        return list;
    }

    @Override
    public GiamGiaSanPhamChiTiet findByIdAoAndTrangThai(UUID id) {
        return giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(id);
    }

    @Override
    public List<GiamGiaSanPhamChiTiet> findAllByGiamGiaSP(UUID id) {
        return giamGiaSanPhamChiTietRepo.findAllByGiamGiaSP(id);
    }

    @Override
    public void update(UUID id, GiamGiaSanPhamChiTiet update) {
        GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findById(id).orElse(null);
        giamGiaSanPhamChiTiet.setAo(update.getAo());
        giamGiaSanPhamChiTiet.setGiamGiaSanPham(update.getGiamGiaSanPham());
        giamGiaSanPhamChiTiet.setSoTienDaGiam(update.getSoTienDaGiam());
        giamGiaSanPhamChiTiet.setTrangThai(update.getTrangThai());
        giamGiaSanPhamChiTietRepo.save(giamGiaSanPhamChiTiet);
    }

    @Override
    public void delete(UUID id) {
        giamGiaSanPhamChiTietRepo.deleteById(id);
    }
}
