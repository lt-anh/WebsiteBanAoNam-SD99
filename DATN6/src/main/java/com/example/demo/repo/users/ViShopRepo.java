package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.ViShop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ViShopRepo extends JpaRepository<ViShop, UUID> {

    @Query("select v from ViShop v where v.khachHang.id = ?1")
    ViShop findByIdKhachHang(UUID id);
}
