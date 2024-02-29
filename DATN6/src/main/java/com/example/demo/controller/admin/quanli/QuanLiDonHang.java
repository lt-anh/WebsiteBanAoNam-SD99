package com.example.demo.controller.admin.quanli;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.GiaoDichVi;
import com.example.demo.entity.khachhang.GioHangChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.HoaDonTraHang;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.dto.DonHangDTO;
import com.example.demo.entity.khachhang.ViShop;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.repo.users.HoaDonRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.users.GiaoDichViSer;
import com.example.demo.ser.users.GioHangChiTietSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import com.example.demo.ser.users.HoaDonTraHangSer;
import com.example.demo.ser.users.ViShopSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@Controller
public class QuanLiDonHang {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    ChatSer chatSer;

    @Autowired
    HoaDonTraHangSer hoaDonTraHangSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    ViShopSer viShopSer;

    @Autowired
    GiaoDichViSer giaoDichViSer;

    @GetMapping("/admin/quan_li_don_hang/*")
    public String viewQuanLiDonHang(HttpServletRequest request, Model model, HttpSession session) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF) {
            model.addAttribute("adminOrStaff", "1");
        } else if (user.getRole() == RoleEnum.ADMIN) {
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/quan_li_don_hang/");
        String ma = parts[1];

        model.addAttribute("maHdLoc", ma);

        try {
            HoaDon hoaDon = hoaDonSer.findByMa(ma);
            List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("hoaDonChiTiets", hoaDonChiTiets);
            if (hoaDon.getHinhThuc() == 1 || hoaDon.getHinhThuc() == 6) {
                model.addAttribute("trangThai", "5");
            } else if (hoaDon.getTrangThai() == 4 && hoaDon.getNgayXacNhan() != null){
                model.addAttribute("trangThai", "7");
            }else {
                model.addAttribute("trangThai", hoaDon.getTrangThai());
            }
        } catch (Exception e) {
            model.addAttribute("trangThai", "0");
        }

        List<DonHangDTO> listDonHangDTOS = hoaDonSer.findAllByOrderByNgayTaoDesc();
        List<DonHangDTO> donHangDTOList = (List<DonHangDTO>) session.getAttribute("listDonHangDTOS");

        LocalDate fromDateSession = (LocalDate) session.getAttribute("fromDate");
        LocalDate toDateSession = (LocalDate) session.getAttribute("toDate");
        String trangThaiLoc = (String) session.getAttribute("trangThaiLoc");
        String emailKhachHang = (String) session.getAttribute("emailKhachHang");
        List<DonHangDTO> listDonHangXuatExxcel = new ArrayList<>();
        if (donHangDTOList != null) {
            model.addAttribute("listDonHangDTOS", donHangDTOList);
            listDonHangXuatExxcel = donHangDTOList;
        } else {
            model.addAttribute("listDonHangDTOS", listDonHangDTOS);
            listDonHangXuatExxcel = listDonHangDTOS;
        }

        model.addAttribute("fromDateSession", fromDateSession);
        model.addAttribute("toDateSession", toDateSession);
        model.addAttribute("trangThaiSession", trangThaiLoc);
        model.addAttribute("emailKhachHangLoc", emailKhachHang);

        session.setAttribute("listDonHangXuatExxcel", listDonHangXuatExxcel);

        session.removeAttribute("listDonHangDTOS");
        session.removeAttribute("fromDate");
        session.removeAttribute("toDate");
        session.removeAttribute("trangThaiLoc");
        session.removeAttribute("emailKhachHang");

        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());

        return "/admin/quan_li_don_hang_admin";
    }

    @GetMapping("/admin/san_pham_tra/*")
    public String viewTraHang(Model model, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF) {
            model.addAttribute("adminOrStaff", "1");
        } else if (user.getRole() == RoleEnum.ADMIN) {
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<HoaDonTraHang> listHoaDonTraHangs = hoaDonTraHangSer.getAll();
        model.addAttribute("listHoaDonTraHangs", listHoaDonTraHangs);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/san_pham_tra/");
        String id = parts[1];

        try {
            HoaDonTraHang hoaDonTraHang = hoaDonTraHangSer.findById(UUID.fromString(id));
            model.addAttribute("item", hoaDonTraHang);
            model.addAttribute("trangThai", hoaDonTraHang.getTrangThai());
        } catch (Exception e) {

        }

        return "/admin/tra_hang";
    }

    @PostMapping("/admin/tra_hang/detail")
    public String detailTraHang(HttpServletRequest request) {
        String detail = request.getParameter("detail");
        return "redirect:/admin/san_pham_tra/" + detail;
    }

    @PostMapping("/admin/tra_hang/delete")
    public String deleteTraHang(HttpServletRequest request) {
        String delete = request.getParameter("delete");

        HoaDonTraHang hoaDonTraHang = hoaDonTraHangSer.findById(UUID.fromString(delete));

        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(hoaDonTraHang.getHoaDon().getId(), hoaDonTraHang.getAoChiTiet().getId());
        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setHoaDon(hoaDonChiTiet.getHoaDon());
        hdct.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
        hdct.setSoLuong(hoaDonChiTiet.getSoLuong());
        hdct.setDonGia(hoaDonChiTiet.getDonGia());
        hdct.setSoLuongYeuCauTraHang(0);

        hoaDonChiTietSer.update(hoaDonChiTiet.getId(), hdct);

        hoaDonTraHangSer.delete(UUID.fromString(delete));
        return "redirect:/admin/san_pham_tra/1";
    }

    @PostMapping("/admin/tra_hang_admin/xac_nhan")
    public String adminXacNhanTraHang(HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String idDonHangHoanTra = request.getParameter("idDonHangHoanTra");
        String ghiChu = request.getParameter("ghiChu");


        HoaDonTraHang hoaDonTraHang = hoaDonTraHangSer.findById(UUID.fromString(idDonHangHoanTra));

        HoaDon hoaDon = hoaDonTraHang.getHoaDon();

        AoChiTiet act = hoaDonTraHang.getAoChiTiet();

        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(hoaDon.getId(), act.getId());

        int TongTienGiam = hoaDonTraHang.getSoLuongTra() * hoaDonTraHang.getDonGia().intValue();
        int soTienConHDCT = hoaDonChiTiet.getDonGia().intValue() - TongTienGiam;
        int SoTienConHd = hoaDon.getTongTien().intValue() - TongTienGiam;
        BigDecimal newTongTienHDCT = new BigDecimal(soTienConHDCT);
        BigDecimal newTongTienHD = new BigDecimal(SoTienConHd);

        HoaDon hd1 = new HoaDon();

        hd1.setMa(hoaDon.getMa());
        hd1.setTongTien(hoaDon.getTongTien());
        hd1.setNgayTao(hoaDon.getNgayTao());
        hd1.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd1.setNgayXacNhan(hoaDon.getNgayXacNhan());
        hd1.setNgayHoanThanh(hoaDon.getNgayHoanThanh());
        hd1.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd1.setNhanVien(hoaDon.getNhanVien());
        hd1.setKhachHang(hoaDon.getKhachHang());
        hd1.setMoTa(hoaDon.getMoTa());
        hd1.setTongTien(newTongTienHD);
        hd1.setTrangThai(hoaDon.getTrangThai());
        hd1.setHinhThuc(hoaDon.getHinhThuc());

        hoaDonSer.update(hoaDon.getId(), hd1);

        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setHoaDon(hoaDonChiTiet.getHoaDon());
        hdct.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
        hdct.setSoLuong(hoaDonChiTiet.getSoLuong() - hoaDonTraHang.getSoLuongTra());
        hdct.setDonGia(newTongTienHDCT);
        hdct.setSoLuongYeuCauTraHang(0);

        hoaDonChiTietSer.update(hoaDonChiTiet.getId(), hdct);

        HoaDonTraHang hoaDonTraHang1 = new HoaDonTraHang();

        hoaDonTraHang1.setHoaDon(hoaDon);
        hoaDonTraHang1.setAoChiTiet(hoaDonTraHang.getAoChiTiet());
        hoaDonTraHang1.setNhanVien(user);
        hoaDonTraHang1.setNgayYeuCau(hoaDonTraHang.getNgayYeuCau());
        hoaDonTraHang1.setNgayXacNhan(LocalDateTime.now());
        hoaDonTraHang1.setSoLuongTra(hoaDonTraHang.getSoLuongTra());
        hoaDonTraHang1.setGhiChu(hoaDonTraHang.getGhiChu());
        hoaDonTraHang1.setDonGia(hoaDonTraHang.getDonGia());
        hoaDonTraHang1.setNote(ghiChu);
        hoaDonTraHang1.setTrangThai(2);

        hoaDonTraHangSer.update(hoaDonTraHang.getId(), hoaDonTraHang1);

        AoChiTiet aoChiTiet = new AoChiTiet();

        int slBan = act.getSlban() - hoaDonTraHang.getSoLuongTra();

        int slTra;
        if (act.getSlTra() == null){
            slTra = 0;
        }else {
            slTra = act.getSlTra();
        }
        int updateSlTra = slTra + hoaDonTraHang.getSoLuongTra();

        aoChiTiet.setMau_sac(act.getMau_sac());
        aoChiTiet.setSize(act.getSize());
        aoChiTiet.setAo(act.getAo());
        aoChiTiet.setSlton(act.getSlton());
        aoChiTiet.setSlban(slBan);
        aoChiTiet.setSlTra(updateSlTra);
        aoChiTiet.setTrangthai(act.getTrangthai());

        aoChiTietSer.update(act.getId(), aoChiTiet);

        return "redirect:/admin/san_pham_tra/" + hoaDonTraHang.getId();
    }

    @PostMapping("/admin/quan_li_don_hang/loc")
    public String loc(HttpServletRequest request, HttpSession session) {

        String emailKhachHangStr = request.getParameter("emailKhachHang");
        String trangThai = request.getParameter("trangThai");
        String fromDateStr = request.getParameter("fromDate");
        String toDateStr = request.getParameter("toDate");

        LocalDate fromDate = null;
        LocalDate toDate = null;

        String emailKhachHang;

        if (emailKhachHangStr == null || emailKhachHangStr.trim().isEmpty()) {
            emailKhachHang = null;
        }else {
            emailKhachHang = emailKhachHangStr;
        }



        if (fromDateStr != null && !fromDateStr.isEmpty()) {
            fromDate = LocalDate.parse(fromDateStr);
        }

        if (toDateStr != null && !toDateStr.isEmpty()) {
            toDate = LocalDate.parse(toDateStr);
        }

        List<DonHangDTO> listDonHangDTOS = new ArrayList<>();
        if (trangThai.equals("0")) {
            listDonHangDTOS = hoaDonSer.findAllByStartDateAndEndDateOrBoth(fromDate, toDate, emailKhachHang);
        }
        if (!trangThai.equals("0")) {
            listDonHangDTOS = hoaDonSer.findAllByOptionalFilters(Integer.parseInt(trangThai), fromDate, toDate, emailKhachHang);
        }

        System.out.println("Trạng thái tìm:" + trangThai);
        System.out.println(fromDate);
        System.out.println(toDate);

        session.setAttribute("emailKhachHang", emailKhachHang);
        session.setAttribute("trangThaiLoc", trangThai);
        session.setAttribute("fromDate", fromDate);
        session.setAttribute("toDate", toDate);
        session.setAttribute("listDonHangDTOS", listDonHangDTOS);

        return "redirect:/admin/quan_li_don_hang/1";
    }

    @PostMapping("/admin/quan_li_don_hang/detail")
    public String detail(HttpServletRequest request) {
        String maHd = request.getParameter("detail");
        return "redirect:/admin/quan_li_don_hang/" + maHd;
    }

    @PostMapping("/admin/don_hang/xac_nhan")
    public String xanNhanDonHang(HttpServletRequest request) {
        LocalDate currentDate = LocalDate.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayXacNhan(LocalDateTime.now());
        hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(6);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }
    @PostMapping("/admin/don_hang/chuyen_sang_giao_hang")
    public String chuyenSangGiaoHang(HttpServletRequest request) {
        LocalDate currentDate = LocalDate.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayXacNhan(LocalDateTime.now());
        hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(2);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

    @PostMapping("/admin/don_hang/huy")
    public String huyDonHang(HttpServletRequest request) {

        LocalDateTime now = LocalDateTime.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");
        String ghiChu = request.getParameter("ghiChu");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);

        if (hoaDon.getNgayThanhToan() != null){
            ViShop v = viShopSer.findByIdKhachHang(hoaDon.getKhachHang().getId());

            BigDecimal tt = v.getTongTien().add(hoaDon.getTongTien());

            ViShop viShop = new ViShop();

            viShop.setMa(v.getMa());
            viShop.setKhachHang(v.getKhachHang());
            viShop.setTongTien(tt);
            viShop.setTrangThai(1);

            viShopSer.update(v.getId(), viShop);

            GiaoDichVi giaoDichVi = new GiaoDichVi();

            giaoDichVi.setMa("GDV" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
            giaoDichVi.setViShop(v);
            giaoDichVi.setNhanVien(user);
            giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
            giaoDichVi.setDonGia(hoaDon.getTongTien());
            giaoDichVi.setHinhThuc(1);
            giaoDichVi.setTrangThai(1);

            giaoDichViSer.add(giaoDichVi);
        }

        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayHuy(LocalDateTime.now());
        hd.setNgayThanhToan(null);
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(4);
        hd.setGhiChu(ghiChu);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(hoaDon.getKhachHang().getEmail());
        message.setSubject("Thông tin đơn hàng");
        String bodymail = "";

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();
            int slBan = act.getSlban() - hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
            bodymail += hoaDonChiTiet.getAoChiTiet().getAo().getTen()+" "+hoaDonChiTiet.getAoChiTiet().getSize().getTen()+" x "+hoaDonChiTiet.getSoLuong()+"\n";
        }
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedTongTien = currencyFormat.format(hoaDon.getTongTien());
        String chiSoTongTien = formattedTongTien.replace("₫", "").trim();

        message.setText("Cảm ơn bạn vì đã mua hàng bởi SD-99 tuy nhiên vì 1 vài lí do "+ ghiChu +
                "\nMã đơn hàng : " + hoaDon.getMa()
                +"\nSản phẩm :\n"+bodymail+"\nTổng tiền : "+chiSoTongTien+" VND"+
                "\nHiện tại chưa thể giao cho bạn được"+
                "\nXin trân trọng cảm ơn");

        mailSender.send(message);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

    @PostMapping("/admin/don_hang/quay_lai")
    public String donHangQuayLai(HttpServletRequest request) {

        LocalDateTime now = LocalDateTime.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");
        String ghiChu = request.getParameter("ghiChu");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);

        if (hoaDon.getNgayThanhToan() != null){
            ViShop v = viShopSer.findByIdKhachHang(hoaDon.getKhachHang().getId());

            BigDecimal tt = v.getTongTien().add(hoaDon.getTongTien());

            ViShop viShop = new ViShop();

            viShop.setMa(v.getMa());
            viShop.setKhachHang(v.getKhachHang());
            viShop.setTongTien(tt);
            viShop.setTrangThai(1);

            viShopSer.update(v.getId(), viShop);

            GiaoDichVi giaoDichVi = new GiaoDichVi();

            giaoDichVi.setMa("GDV" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
            giaoDichVi.setViShop(v);
            giaoDichVi.setNhanVien(user);
            giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
            giaoDichVi.setDonGia(hoaDon.getTongTien());
            giaoDichVi.setHinhThuc(1);
            giaoDichVi.setTrangThai(1);

            giaoDichViSer.add(giaoDichVi);
        }

        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(null);
        hd.setNgayXacNhan(null);
        hd.setNgayHuy(null);
        hd.setNgayThanhToan(null);
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(0);
        hd.setGhiChu(ghiChu);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(hoaDon.getKhachHang().getEmail());
        message.setSubject("Thông tin đơn hàng");
        String bodymail = "";

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();
            int slBan = act.getSlban() - hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
            bodymail += hoaDonChiTiet.getAoChiTiet().getAo().getTen()+" "+hoaDonChiTiet.getAoChiTiet().getSize().getTen()+" x "+hoaDonChiTiet.getSoLuong()+"\n";
        }
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedTongTien = currencyFormat.format(hoaDon.getTongTien());
        String chiSoTongTien = formattedTongTien.replace("₫", "").trim();

        message.setText("Cảm ơn bạn vì đã mua hàng bởi SD-99 tuy nhiên vì 1 vài lí do "+ ghiChu +
                "\nMã đơn hàng : " + hoaDon.getMa()
                +"\nSản phẩm :\n"+bodymail+"\nTổng tiền : "+chiSoTongTien+" VND"+
                "\nHiện tại chưa thể giao cho bạn được"+
                "\nXin trân trọng cảm ơn");

        mailSender.send(message);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

    @PostMapping("/admin/don_hang/hoan_thanh")
    public String hoanThanhDonHang(HttpServletRequest request) {
        LocalDate currentDate = LocalDate.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        if (hoaDon.getNgayThanhToan() == null) {
            hd.setNgayThanhToan(LocalDateTime.now());
        } else {
            hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        }

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayXacNhan(hoaDon.getNgayXacNhan());
        hd.setNgayHoanThanh(LocalDateTime.now());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(3);
        hd.setMoTa(hoaDon.getMoTa());

        if (hoaDon.getNgayThanhToan() == null) {
            hd.setNgayThanhToan(LocalDateTime.now());
        } else {
            hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        }

        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            GioHangChiTiet gioHangChiTiet = gioHangChiTietSer.findByKhachHangAndAoChiTiet(hoaDon.getKhachHang().getId(), act.getId());
            if (gioHangChiTiet != null) {
                gioHangChiTietSer.delete(gioHangChiTiet.getId());
            }
        }

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

    @PostMapping("/admin/don_hang/hoan_don_hang")
    public String hoanDonHang(HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");
        String ghiChu = request.getParameter("ghiChu");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayXacNhan(hoaDon.getNgayXacNhan());
        hd.setNgayHuy(LocalDateTime.now());
        hd.setNgayThanhToan(null);
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(4);
        hd.setGhiChu(ghiChu);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(hoaDon.getKhachHang().getEmail());
        message.setSubject("Thông tin đơn hàng");
        String bodymail = "";

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();
            int slBan = act.getSlban() - hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
            bodymail += hoaDonChiTiet.getAoChiTiet().getAo().getTen()+" "+hoaDonChiTiet.getAoChiTiet().getSize().getTen()+" x "+hoaDonChiTiet.getSoLuong()+"\n";
        }
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedTongTien = currencyFormat.format(hoaDon.getTongTien());
        String chiSoTongTien = formattedTongTien.replace("₫", "").trim();

        message.setText("Cảm ơn bạn vì đã mua hàng bởi SD-99 tuy nhiên vì 1 vài lí do "+ ghiChu +
                "\nMã đơn hàng : " + hoaDon.getMa()
                +"\nSản phẩm :\n"+bodymail+"\nTổng tiền : "+chiSoTongTien+" VND"+
                "\nHiện tại chưa thể giao cho bạn được"+
                "\nXin trân trọng cảm ơn");

        mailSender.send(message);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

}
