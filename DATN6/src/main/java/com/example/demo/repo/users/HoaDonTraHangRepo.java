package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.HoaDonTraHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface HoaDonTraHangRepo extends JpaRepository<HoaDonTraHang, UUID> {
}
