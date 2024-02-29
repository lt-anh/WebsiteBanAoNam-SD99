package com.example.demo.controller.admin.quanli;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.dto.BieuDoDTO;
import com.example.demo.entity.dto.HoaDonChiTietDTO;
import com.example.demo.entity.dto.ThongKeDTO;
import com.example.demo.entity.dto.ThongKeSoLuongAoDTO;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.chat.DemChatRepository;
import com.example.demo.repo.users.HoaDonRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.AnhSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.FormSer;
import com.example.demo.ser.sanpham.HangSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import com.example.demo.ser.sanpham.MauSacSer;
import com.example.demo.ser.sanpham.SizeSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.Console;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    DemChatRepository demChatRepository;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    ChatSer chatSer;

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    MauSacSer mauSacSer;

    @GetMapping("/admin/index/*")
    public String index(Model model, HttpServletRequest request,
                        @RequestParam(name = "pageNo", required = false, defaultValue = "0") Integer pageNo) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF) {
            model.addAttribute("adminOrStaff", "1");
        } else if (user.getRole() == RoleEnum.ADMIN) {
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        LocalDateTime ngayHienTai = LocalDateTime.now();

        LocalDate date = LocalDate.now();

        List<ThongKeDTO> listThongKeDTOS = hoaDonSer.thongKeTheoNgayThanhToan();
        int soDonMoi = hoaDonSer.soLuongHoaDonTheoNgayandTrangThai(date, 1);
        int soDonDangGiao = hoaDonSer.countHoaDonDangGiaoByNgayHienTai(date);
        int soDonHoanThanh = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(date);
        int soDonHuy = hoaDonSer.countHoaDonHuyByNgayHienTai(date);
        Page<HoaDon> page = hoaDonSer.listHoaDonTheoNgay(date, pageNo);

        List<HoaDon> listHDChoXacNhan = hoaDonSer.listHoaDonByNgayChoXacNhan(date);
        List<HoaDon> listHDDangGiao = hoaDonSer.listHoaDonByNgayDangGiao(date);
        List<HoaDon> listHDHoanThanh = hoaDonSer.listHoaDonByNgayHoanThanh(date);
        List<HoaDon> listHDHuy = hoaDonSer.listHoaDonByNgayHuy(date);

        List<HoaDonChiTietDTO> listHoaDonChoXacNhanDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDChoXacNhan);
        List<HoaDonChiTietDTO> listHoaDonDangGiaoDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDDangGiao);
        List<HoaDonChiTietDTO> listHoaDonHoanThanhDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDHoanThanh);
        List<HoaDonChiTietDTO> listHoaDonHuyDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDHuy);

        model.addAttribute("listThongKeDTOS", listThongKeDTOS);
        model.addAttribute("ngayHienTai", ngayHienTai);
        model.addAttribute("soDonMoi", soDonMoi);
        model.addAttribute("soDonDangGiao", soDonDangGiao);
        model.addAttribute("soDonHoanThanh", soDonHoanThanh);
        model.addAttribute("soDonHuy", soDonHuy);
        model.addAttribute("page", page);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        model.addAttribute("listHoaDonChoXacNhanDTOS", listHoaDonChoXacNhanDTOS);
        model.addAttribute("listHoaDonDangGiaoDTOS", listHoaDonDangGiaoDTOS);
        model.addAttribute("listHoaDonHoanThanhDTOS", listHoaDonHoanThanhDTOS);
        model.addAttribute("listHoaDonHuyDTOS", listHoaDonHuyDTOS);

        List<BieuDoDTO> listBieuDoDTOS = hoaDonSer.listBieuDo();

        model.addAttribute("listBieuDoDTOS", listBieuDoDTOS);


        return "/admin/index";
    }

    @GetMapping("/admin/thong_ke/*")
    public String thongKe(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF) {
            model.addAttribute("adminOrStaff", "1");
        } else if (user.getRole() == RoleEnum.ADMIN) {
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        LocalDate ngayHienTai = LocalDate.now();
        LocalDate ngayHomTruoc = ngayHienTai.minus(1, ChronoUnit.DAYS);
        LocalDate ngayStart = ngayHienTai.minusMonths(4);
        YearMonth yearMonth = YearMonth.from(ngayHienTai);
        LocalDate firstDayOfMonth = yearMonth.atDay(1);


        Integer soDonNgayHienTai = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHienTai);
        Integer soDonNgayHomTruoc = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHomTruoc);

        if (soDonNgayHienTai == null) {
            soDonNgayHienTai = 0;
        }
        if (soDonNgayHomTruoc == null) {
            soDonNgayHomTruoc = 0;
        }

        Integer soLuongBanNgayHienTai = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHienTai);
        Integer soLuongBanNgayTruoc = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHomTruoc);

        if (soLuongBanNgayHienTai == null) {
            soLuongBanNgayHienTai = 0;
        }
        if (soLuongBanNgayTruoc == null) {
            soLuongBanNgayTruoc = 0;
        }

        Double doanhThuNgayHienTai = hoaDonSer.doanhThuTheoNgay(ngayHienTai);
        Double doanhThuNgayTruocStr = hoaDonSer.doanhThuTheoNgay(ngayHomTruoc);


        if (doanhThuNgayHienTai == null) {
            doanhThuNgayHienTai = 0.0;
        }
        if (doanhThuNgayTruocStr == null) {
            doanhThuNgayTruocStr = 0.0;
        }

        Integer soLuongKhachMuaNgayHienTai = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHienTai);
        Integer soLuongKhachMuaNgayTruocStr = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHomTruoc);


        if (soLuongKhachMuaNgayHienTai == null) {
            soLuongKhachMuaNgayHienTai = 0;
        }
        if (soLuongKhachMuaNgayTruocStr == null) {
            soLuongKhachMuaNgayTruocStr = 0;
        }


        int soSanhHoaDon;
        soSanhHoaDon = soDonNgayHienTai - soDonNgayHomTruoc;
        if (soSanhHoaDon >= 0) {
            model.addAttribute("soSanhHoaDon", "+" + soSanhHoaDon);
        } else {
            model.addAttribute("soSanhHoaDon", soSanhHoaDon);
        }

        int soSanhSoLuongBan;
        soSanhSoLuongBan = soLuongBanNgayHienTai - soLuongBanNgayTruoc;
        if (soSanhSoLuongBan >= 0) {
            model.addAttribute("soSanhSoLuong", "+" + soSanhSoLuongBan);
        } else {
            model.addAttribute("soSanhSoLuong", soSanhSoLuongBan);
        }
        NumberFormat numberFormat = new DecimalFormat("#,###");
        double soSanhDoanhThu;
        soSanhDoanhThu = doanhThuNgayHienTai - doanhThuNgayTruocStr;
        if (soSanhDoanhThu >= 0) {
            model.addAttribute("soSanhDoanhThu", "+" +numberFormat.format(soSanhDoanhThu) );
        }
        else{
            model.addAttribute("soSanhDoanhThu", numberFormat.format(soSanhDoanhThu));
        }



        int soSanhSoLuongKhach;
        soSanhSoLuongKhach = soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruocStr;
        if (soSanhSoLuongKhach >= 0) {
            model.addAttribute("soSanhSoLuongKhach", "+" + soSanhSoLuongKhach);
        }
        else{
            model.addAttribute("soSanhSoLuongKhach", soSanhSoLuongKhach);
        }


        List<Double> doanhThuTheoThang = hoaDonSer.doanhThuTheoThang(ngayStart, ngayHienTai);
        List<Integer> soLuongBanTheoThang = hoaDonChiTietSer.soLuongBanTheoThang(ngayStart, ngayHienTai);

        List<Integer> getThang = hoaDonSer.getDataThang(ngayStart, ngayHienTai);
        List<Integer> monthsInPeriod = new ArrayList<>();
        LocalDate currentDate = ngayStart;
        while (!currentDate.isAfter(ngayHienTai)) {
            monthsInPeriod.add(currentDate.getMonthValue());
            currentDate = currentDate.plusMonths(1);
        }

        List<Double> finalResult = new ArrayList<>();
        List<Integer> finalResult1 = new ArrayList<>();
        for (Integer month : monthsInPeriod) {
            boolean found = false, found1 = false;
            for (int i = 0; i < doanhThuTheoThang.size(); i++) {
                if (month == getThang.get(i)) {
                    finalResult.add(doanhThuTheoThang.get(i));
                    found = true;
                    break;
                }
            }
            if (!found) {
                finalResult.add(0.0);
            }
            for (int i = 0; i < soLuongBanTheoThang.size(); i++) {
                if (month == getThang.get(i)) {
                    finalResult1.add(soLuongBanTheoThang.get(i));
                    found1 = true;
                    break;
                }
            }
            if (!found1) {
                finalResult1.add(0);
            }
        }
        for (int i = 0; i < finalResult.size(); i++) {
            System.out.println(finalResult);
        }

        Double doanhThuThangHienTaiStr = hoaDonSer.doanhThuThangHienTai(firstDayOfMonth, ngayHienTai);

        Double doanhThuThangHienTai;

        if (doanhThuThangHienTaiStr == null){
            doanhThuThangHienTai = (double) 0;
        }else {
            doanhThuThangHienTai = doanhThuThangHienTaiStr;
        }

        String doanhThuFormatted = numberFormat.format(doanhThuThangHienTai);

        Integer soLuongBanThangHienTai = hoaDonChiTietSer.soLuongBanThangHienTai(firstDayOfMonth, ngayHienTai);
        model.addAttribute("doanhThuThangHienTai", doanhThuFormatted);
        model.addAttribute("soLuongBanThangHienTai", soLuongBanThangHienTai);
        model.addAttribute("soHoaDonHomNay", soDonNgayHienTai);
        model.addAttribute("soLuongHomNay", soLuongBanNgayHienTai);
        model.addAttribute("doanhThuHomNay",numberFormat.format(doanhThuNgayHienTai) );
        model.addAttribute("soLuongKhachMua", soLuongKhachMuaNgayHienTai);

        model.addAttribute("soHoaDonHomQua", soDonNgayHomTruoc);
        model.addAttribute("soLuongBanHomQua", soLuongBanNgayTruoc);
        model.addAttribute("doanhThuHomQua",numberFormat.format(doanhThuNgayTruocStr) );
        model.addAttribute("soLuongKhachHomQua", soLuongKhachMuaNgayTruocStr);

        model.addAttribute("listDoanhThu", finalResult);
        model.addAttribute("listSoLuong", finalResult1);
        model.addAttribute("mauSac", mauSacSer.getAll());
        model.addAttribute("loaiAo", loaiAoSer.getAll());
        model.addAttribute("ngayHienTai", ngayHienTai);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());

        List<ThongKeSoLuongAoDTO> listThongKeSoLuongAoDTOS = aoChiTietSer.thongKeSoLuongAoDTO();
        model.addAttribute("listThongKeSoLuongAoDTOS", listThongKeSoLuongAoDTOS);

        model.addAttribute("listLoaiAo", loaiAoSer.findAllByTrangThai(1));

        return "/admin/thongke";
    }

    @GetMapping("/admin/logout")
    public String adminLogout(HttpSession session){
        session.removeAttribute("userLogged");
        return "redirect:/login";
    }
}
