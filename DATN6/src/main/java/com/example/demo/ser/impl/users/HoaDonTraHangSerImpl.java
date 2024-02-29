package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.HoaDonTraHang;
import com.example.demo.repo.users.HoaDonTraHangRepo;
import com.example.demo.ser.users.HoaDonTraHangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonTraHangSerImpl implements HoaDonTraHangSer {

    @Autowired
    HoaDonTraHangRepo hoaDonTraHangRepo;

    @Override
    public List<HoaDonTraHang> getAll() {
        return hoaDonTraHangRepo.findAll();
    }

    @Override
    public void add(HoaDonTraHang hoaDonTraHang) {
        hoaDonTraHangRepo.save(hoaDonTraHang);
    }

    @Override
    public void delete(UUID id) {
        hoaDonTraHangRepo.deleteById(id);
    }

    @Override
    public void update(UUID id, HoaDonTraHang hdth) {
        Optional<HoaDonTraHang> optionalHoaDonTraHang = hoaDonTraHangRepo.findById(id);
        if (optionalHoaDonTraHang.isPresent()){
            HoaDonTraHang hoaDonTraHang = optionalHoaDonTraHang.get();
            hoaDonTraHang.setHoaDon(hdth.getHoaDon());
            hoaDonTraHang.setNhanVien(hdth.getNhanVien());
            hoaDonTraHang.setAoChiTiet(hdth.getAoChiTiet());
            hoaDonTraHang.setNgayYeuCau(hdth.getNgayYeuCau());
            hoaDonTraHang.setNgayXacNhan(hdth.getNgayXacNhan());
            hoaDonTraHang.setSoLuongTra(hdth.getSoLuongTra());
            hoaDonTraHang.setDonGia(hdth.getDonGia());
            hoaDonTraHang.setGhiChu(hdth.getGhiChu());
            hoaDonTraHang.setNote(hdth.getNote());
            hoaDonTraHang.setTrangThai(hdth.getTrangThai());

            hoaDonTraHangRepo.save(hoaDonTraHang);
        }
    }

    @Override
    public HoaDonTraHang findById(UUID id) {
        return hoaDonTraHangRepo.findById(id).orElse(null);
    }
}
