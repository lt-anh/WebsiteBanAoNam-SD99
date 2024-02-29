package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.GiaoDichVi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GiaoDichViRepo extends JpaRepository<GiaoDichVi, UUID> {

    @Query("select gd from GiaoDichVi gd where gd.viShop.khachHang.id = ?1 and gd.trangThai in (1, 2) order by gd.ngayGiaoDich desc")
    List<GiaoDichVi> findAllByKhachHang(UUID id);

    @Query("select gd from GiaoDichVi gd where gd.ma = ?1")
    GiaoDichVi findByMa(String ma);
}
