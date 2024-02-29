package com.example.demo.controller.admin.banquay;


import com.example.demo.config.Constant;
import com.example.demo.config.Decode;
import com.example.demo.config.MomoModel;
import com.example.demo.config.ResultMoMo;
import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.dto.HoaDonDTO;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.ChatVai;
import com.example.demo.entity.sanpham.Form;
import com.example.demo.entity.sanpham.Hang;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.AnhSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.FormSer;
import com.example.demo.ser.sanpham.HangSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import com.example.demo.ser.sanpham.MauSacSer;
import com.example.demo.ser.sanpham.SizeSer;
import com.example.demo.ser.users.GioHangSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import com.example.demo.ser.users.UsersSer;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/ban-quay")
public class BanQuayController {

    @Autowired
    AoSer aoSer;

    @Autowired
    ChatVaiSer chatVaiSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    HangSer hangSer;

    @Autowired
    FormSer formSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    SizeSer sizeSer;

    @Autowired
    MauSacSer mauSacSer;

    @Autowired
    AnhSer anhSer;

    @Autowired
    private HoaDonSer hoaDonSer;

    @Autowired
    private UsersSer usersSer;

    @Autowired
    private UsersRepo usersRepo;

    @Autowired
    private GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    private HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    ChatSer chatSer;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    JavaMailSender mailSender;

    @GetMapping("/trang-chu")
    public String view(Model model, HttpServletRequest request, HttpSession session) {

//        String url = request.getRequestURI();
//        String[] parts = url.split("/admin/ban-quay/");
//        String ma = parts[1];

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF) {
            model.addAttribute("adminOrStaff", "1");
        } else if (user.getRole() == RoleEnum.ADMIN) {
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        ArrayList<HoaDon> listHD = (ArrayList<HoaDon>) hoaDonSer.listHoaDonFindByTrangThaiCho(5);
        model.addAttribute("listHD", listHD);

        ArrayList<Users> listKH = (ArrayList<Users>) usersSer.getAll();
        model.addAttribute("listKH", listKH);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());


//        int tongSoLuong= hoaDonChiTietSer.soLuongSanPham(5,);
//        model.addAttribute("soSanPham",tongSoLuong);

//        try {
//            Users users = usersSer.findByMa(ma);
//
//            model.addAttribute("idKh", users.getMa());
//            model.addAttribute("tenKh", users.getTen());
//        } catch (Exception e) {
//            model.addAttribute("idKh", "2");
//            model.addAttribute("tenKh", "2");
//        }

        String addKhachHangNhanhThanhCong = (String) session.getAttribute("addKhachHangNhanhThanhCong");
        String addGhiChuThanhCong = (String) session.getAttribute("addGhiChuThanhCong");
        String quayThanhToanThanhCong = (String) session.getAttribute("quayThanhToanThanhCong");

        if (addKhachHangNhanhThanhCong != null){
            model.addAttribute("themKhachHangNhanhThanhCong","2");
        }
        if (addGhiChuThanhCong != null){
            model.addAttribute("themGhiChuThanhCong","2");
        }
        if (quayThanhToanThanhCong != null){
            model.addAttribute("quayThanhToanThanhCongStr","2");
        }

        session.removeAttribute("addKhachHangNhanhThanhCong");
        session.removeAttribute("addGhiChuThanhCong");
        session.removeAttribute("quayThanhToanThanhCong");

        return "/ban_quay/trang_chu";
    }

    @GetMapping("/view-cart/{id}")
    public String viewHD(Model model, @PathVariable("id") UUID id, HttpSession session, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF) {
            model.addAttribute("adminOrStaff", "1");
        } else if (user.getRole() == RoleEnum.ADMIN) {
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Users> listKhachHang = usersSer.findAllKhachHang();
        model.addAttribute("listKhachHang", listKhachHang);

        List<Ao> listAos = aoSer.findAllByTrangThai(2);
        List<Hang> listHangs = hangSer.findAllByTrangThai(1);
        List<ChatVai> listChatVais = chatVaiSer.findAllByTrangThai(1);
        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        List<Form> listForms = formSer.findAllByTrangThai(1);
        List<MauSac> listMauSacs = mauSacSer.findAllByTrangThai(1);
        List<Size> listSizes = sizeSer.findAllByTrangThai(1);

        int slHDCTByHoaDon = hoaDonChiTietSer.soLuongHoaDonCHiTietByHoaDon(id);

        model.addAttribute("listChatVais", listChatVais);
        model.addAttribute("listLoaiAos", listLoaiAos);
        model.addAttribute("listForms", listForms);
        model.addAttribute("listMauSacs", listMauSacs);
        model.addAttribute("listSizes", listSizes);
        model.addAttribute("listAos", listAos);
        model.addAttribute("listHangs", listHangs);
        model.addAttribute("idHoaDon", id);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        model.addAttribute("slHDCTByHoaDon", slHDCTByHoaDon);
//Detail
        String aoDetail = (String) session.getAttribute("aoDetail");


        if (aoDetail == null) {
            model.addAttribute("noneOrBlock", "none");
        } else {
            model.addAttribute("noneOrBlock", "block");
            Ao aoDetail1 = aoSer.findByMa(aoDetail);
            model.addAttribute("ao", aoSer.findById(aoDetail1.getId()));
            model.addAttribute("slAoDaBan", aoSer.soLuongBanByUUID(aoDetail1.getId()));
            model.addAttribute("anhs", anhSer.findAllByAoId(aoDetail1.getId()));
            model.addAttribute("mauSacs", aoChiTietSer.findMauSacByIdAo(aoDetail1.getId()));
            model.addAttribute("sizes", aoChiTietSer.findSizeByIdAo(aoDetail1.getId()));
            System.out.println(aoDetail1.getId());

            try {
                GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(aoDetail1.getId());
                model.addAttribute("giamgia", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam());
                model.addAttribute("time", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getNgayKetThuc());
            } catch (Exception e) {
                model.addAttribute("giamgia", "2");
            }

        }
        session.removeAttribute("aoDetail");

        HoaDon hoaDon = hoaDonSer.findId(id);

        Users users = usersSer.findByHD(hoaDon.getId());
        model.addAttribute("khachHang", users);


        List<HoaDonChiTiet> listHDCT = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        List<HoaDonDTO> listHoaDonChiTiets = new ArrayList<>();
        int tongTien = 0;
        for (HoaDonChiTiet hoaDonChiTiet : listHDCT) {
            Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            HoaDonDTO hoaDonDTO = new HoaDonDTO();

            int gia;
            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }
            hoaDonDTO.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
            hoaDonDTO.setGia(gia);
            hoaDonDTO.setHoaDonChiTiet(hoaDonChiTiet);
            listHoaDonChiTiets.add(hoaDonDTO);
            tongTien += hoaDonChiTiet.getSoLuong() * gia;
        }
        model.addAttribute("tongTien", tongTien);
        model.addAttribute("listHoaDonChiTiets", listHoaDonChiTiets);
        model.addAttribute("hoaDon", hoaDon.getId());

        String loiHoaDonBySoLuong = (String) session.getAttribute("loiHoaDonBySoLuong");

        if (loiHoaDonBySoLuong != null) {
            model.addAttribute("loiThanhToan","2");
        }
        session.removeAttribute("loiHoaDonBySoLuong");

        String addHoaDonThanhCong = (String) session.getAttribute("addHoaDonThanhCong");
        String addGioHangThanhCong = (String) session.getAttribute("addGioHangThanhCong");
        String xoaSanPhamThanhCong = (String) session.getAttribute("xoaSanPhamThanhCong");
        String addKhachHangThanhCong = (String) session.getAttribute("addKhachHangThanhCong");
        String xoaKhachHangThanhCong = (String) session.getAttribute("xoaKhachHangThanhCong");
        String nullIdAoChiTiet = (String) session.getAttribute("nullIdAoChiTiet");
        String hinhThucThanhToanNull = (String) session.getAttribute("hinhThucThanhToanNull");
        String hetAoChiTiet = (String) session.getAttribute("hetAoChiTiet");
        String aoChiTietKhongDu = (String) session.getAttribute("aoChiTietKhongDu");

        if (addHoaDonThanhCong != null){
            model.addAttribute("themHoaDonThanhCong","2");
        }
        if (addGioHangThanhCong != null){
            model.addAttribute("themGioHangThanhCong","2");
        }
        if (xoaSanPhamThanhCong != null){
            model.addAttribute("deleteSanPhamThanhCong","2");
        }
        if (addKhachHangThanhCong != null){
            model.addAttribute("themKhachHangThanhCong","2");
        }
        if (xoaKhachHangThanhCong != null){
            model.addAttribute("deleteKhachHangThanhCong","2");
        }
        if (nullIdAoChiTiet != null){
            model.addAttribute("trongAoChiTiet","2");
        }
        if (hinhThucThanhToanNull != null){
            model.addAttribute("nullHinhThucThanhToan","2");
        }
        if (hetAoChiTiet != null){
            model.addAttribute("hetAoChiTietStr","2");
        }
        if (aoChiTietKhongDu != null){
            model.addAttribute("aoChiTietKhongDuStr","2");
        }

        session.removeAttribute("addHoaDonThanhCong");
        session.removeAttribute("addGioHangThanhCong");
        session.removeAttribute("xoaSanPhamThanhCong");
        session.removeAttribute("addKhachHangThanhCong");
        session.removeAttribute("xoaKhachHangThanhCong");
        session.removeAttribute("nullIdAoChiTiet");
        session.removeAttribute("hinhThucThanhToanNull");
        session.removeAttribute("hetAoChiTiet");
        session.removeAttribute("aoChiTietKhongDu");

        return "/ban_quay/gio_hang";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, HttpSession session) {
        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(id);
        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(act.getSlban());
            aoChiTiet.setSlTra(act.getSlTra());
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);

            hoaDonChiTietSer.delete(hoaDonChiTiet.getId());
        }
        hoaDonSer.delete(id);
        session.setAttribute("xoaHoaDonThanhCong","2");
        return "redirect:/admin/ban-quay/trang-chu";
    }

    @GetMapping("/delete-san-pham/*/*")
    public String deleteSP(HttpServletRequest request, HttpSession session) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/ban-quay/delete-san-pham/");
        String pStr = parts[1];
        String[] p = pStr.split("/");

        String idHD = p[0];
        String idHDCT = p[1];

        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSer.findById(UUID.fromString(idHDCT));

        AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

        AoChiTiet aoChiTiet = new AoChiTiet();

        int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();

        aoChiTiet.setMau_sac(act.getMau_sac());
        aoChiTiet.setSize(act.getSize());
        aoChiTiet.setAo(act.getAo());
        aoChiTiet.setSlton(slTon);
        aoChiTiet.setSlban(act.getSlban());
        aoChiTiet.setSlTra(act.getSlTra());
        aoChiTiet.setTrangthai(act.getTrangthai());

        aoChiTietSer.update(act.getId(), aoChiTiet);

        hoaDonChiTietSer.delete(UUID.fromString(idHDCT));

        session.setAttribute("xoaSanPhamThanhCong","2");

        return "redirect:/admin/ban-quay/view-cart/" + idHD;
    }

    @PostMapping("/addHD")
    public String addHD(Model model, HttpServletRequest request, HttpSession session) {

//        String url = request.getRequestURI();
//        String[] parts = url.split("/admin/ban-quay/addHD/");
//        String ma = parts[1];
//
//        Users users = usersSer.findByMa(ma);
//        model.addAttribute("idKh", users.getMa());

        LocalDateTime now = LocalDateTime.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa("HD" + now.getMonthValue() + now.getDayOfMonth() + now.getHour() + now.getMinute() + now.getSecond());
        hoaDon.setKhachHang(null);
        hoaDon.setNhanVien(user);
        hoaDon.setHinhThuc(1);
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setTrangThai(5);

        hoaDonSer.add(hoaDon);

        session.setAttribute("addHoaDonThanhCong","2");

        return "redirect:/admin/ban-quay/view-cart/" + hoaDon.getId();
    }

    @PostMapping("/add_gio_hang/{id}")
    public String addGioHang(HttpServletRequest request, @PathVariable("id") UUID id, HttpSession session) {


        HoaDon hoaDon = hoaDonSer.findId(id);

        String idAo = request.getParameter("idAo");
        String mauSac = request.getParameter("mauSac");
        String size = request.getParameter("size");
        String sl = request.getParameter("sl");

        AoChiTiet aoChiTiet = aoChiTietSer.findIdByIdAoMsSize(UUID.fromString(idAo), UUID.fromString(mauSac), UUID.fromString(size));

        HoaDonChiTiet checkGHCT = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(hoaDon.getId(), aoChiTiet.getId());

        if(aoChiTiet.getSlton() == 0){
            session.setAttribute("hetAoChiTiet","2");
            return "redirect:/admin/ban-quay/view-cart/" + hoaDon.getId();
        }

        if(aoChiTiet.getSlton() < Integer.parseInt(sl)){
            session.setAttribute("aoChiTietKhongDu","2");
            return "redirect:/admin/ban-quay/view-cart/" + hoaDon.getId();
        }
        if (checkGHCT == null) {

            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();

            hoaDonChiTiet.setHoaDon(hoaDonSer.findId(hoaDon.getId()));
            hoaDonChiTiet.setAoChiTiet(aoChiTiet);
            hoaDonChiTiet.setSoLuong(Integer.parseInt(sl));

            hoaDonChiTietSer.add(hoaDonChiTiet);

            AoChiTiet aoChiTiet1 = new AoChiTiet();

            int slTon = aoChiTiet.getSlton() - Integer.parseInt(sl);

            aoChiTiet1.setMau_sac(aoChiTiet.getMau_sac());
            aoChiTiet1.setSize(aoChiTiet.getSize());
            aoChiTiet1.setAo(aoChiTiet.getAo());
            aoChiTiet1.setSlton(slTon);
            aoChiTiet1.setSlban(aoChiTiet.getSlban());
            aoChiTiet1.setSlTra(aoChiTiet.getSlTra());
            aoChiTiet1.setTrangthai(aoChiTiet.getTrangthai());

            aoChiTietSer.update(aoChiTiet.getId(), aoChiTiet1);

        } else {
            HoaDonChiTiet hdct = new HoaDonChiTiet();

            int soLuong = checkGHCT.getSoLuong() + Integer.parseInt(sl);

            hdct.setHoaDon(checkGHCT.getHoaDon());
            hdct.setAoChiTiet(checkGHCT.getAoChiTiet());
            hdct.setSoLuong(soLuong);
            hdct.setDonGia(checkGHCT.getDonGia());
            hdct.setTrangThai(checkGHCT.getTrangThai());

            hoaDonChiTietSer.update(checkGHCT.getId(), hdct);

            AoChiTiet aoChiTiet1 = new AoChiTiet();

            int slTon = aoChiTiet.getSlton() - Integer.parseInt(sl);

            aoChiTiet1.setMau_sac(aoChiTiet.getMau_sac());
            aoChiTiet1.setSize(aoChiTiet.getSize());
            aoChiTiet1.setAo(aoChiTiet.getAo());
            aoChiTiet1.setSlton(slTon);
            aoChiTiet1.setSlban(aoChiTiet.getSlban());
            aoChiTiet1.setSlTra(aoChiTiet.getSlTra());
            aoChiTiet1.setTrangthai(aoChiTiet.getTrangthai());

            aoChiTietSer.update(aoChiTiet.getId(), aoChiTiet1);
        }

        session.setAttribute("addGioHangThanhCong","2");
        return "redirect:/admin/ban-quay/view-cart/" + hoaDon.getId();
    }

    @PostMapping("/update-khach-hang/{id}")
    public String updateKH(HttpServletRequest request, @PathVariable("id") UUID id,HttpSession session) {

        String idHoaDon = request.getParameter("idHoaDon");

        Users users = usersSer.findById(id);

        for (HoaDon hoaDon : hoaDonSer.getAll()
        ) {
            if (hoaDon.getId().equals(UUID.fromString(idHoaDon))) {
                hoaDon.setKhachHang(users);
                hoaDonSer.update(UUID.fromString(idHoaDon), hoaDon);
            }
        }
        session.setAttribute("addKhachHangThanhCong","2");
        return "redirect:/admin/ban-quay/view-cart/" + idHoaDon;
    }

    @PostMapping("/delete-khach-hang/{id}")
    public String deleteKH(HttpServletRequest request, HttpSession session) {

        String idHoaDon = request.getParameter("idHoaDon");

        for (HoaDon hoaDon : hoaDonSer.getAll()
        ) {
            if (hoaDon.getId().equals(UUID.fromString(idHoaDon))) {
                hoaDon.setKhachHang(null);
                hoaDonSer.update(UUID.fromString(idHoaDon), hoaDon);
            }
        }
        session.setAttribute("xoaKhachHangThanhCong","2");
        return "redirect:/admin/ban-quay/view-cart/" + idHoaDon;
    }

    @PostMapping("/ao-detail")
    public String detail(HttpServletRequest request, HttpSession session) {
        String idSp = request.getParameter("idSp");
        String idHoaDon = request.getParameter("idHoaDon");
        Ao ao = aoSer.findById(UUID.fromString(idSp));
        session.setAttribute("aoDetail", ao.getMa());


        return "redirect:/admin/ban-quay/view-cart/" + idHoaDon;
    }

    @PostMapping("/thanh-toan/{id}")
    public String thanhToan(Model model, @PathVariable("id") UUID id,
                            @RequestParam("tongTien") BigDecimal tongTien,
                            @RequestParam("ghiChu") String ghiChu,
                            @RequestParam(value = "chon", required = false) List<String> chon,
                            @RequestParam(value = "idAoChiTiet", required = false) List<UUID> idAoChiTiet,
                            @RequestParam(value = "soLuong", required = false) List<String> soLuong,
                            HttpSession session, HttpServletRequest request) throws JsonProcessingException {

        if(idAoChiTiet == null){
            session.setAttribute("nullIdAoChiTiet", "2");
            return "redirect:/admin/ban-quay/view-cart/"+id;
        }

//        int checkSoLuongTon = 0;
//
//        for (int i = 0; i < idAoChiTiet.size(); i++) {
//            AoChiTiet actStr = aoChiTietSer.findById(idAoChiTiet.get(i));
//            Integer slCheck = Integer.parseInt(soLuong.get(i));
//            if (slCheck >= actStr.getSlton()) {
//                checkSoLuongTon += 1;
//            }
//        }
//
//        if (checkSoLuongTon > 0) {
//            session.setAttribute("loiHoaDonBySoLuong", "2");
//            return "redirect:/admin/ban-quay/view-cart/"+id;
//        }

        String hinhThucTT = request.getParameter("hinhThucThanhToan");

        if (hinhThucTT == null){
            session.setAttribute("hinhThucThanhToanNull","2");
            return "redirect:/admin/ban-quay/view-cart/"+id;
        }

        HoaDon hd = hoaDonSer.findId(id);

        HoaDon hoaDon = new HoaDon();

        hoaDon.setMa(hd.getMa());
        hoaDon.setTongTien(tongTien);
        hoaDon.setGhiChu(ghiChu);
        hoaDon.setTrangThai(3);
        hoaDon.setKhachHang(hd.getKhachHang());
        hoaDon.setNgayTao(hd.getNgayTao());
        hoaDon.setNgayHoanThanh(LocalDateTime.now());
        hoaDon.setNgayThanhToan(LocalDateTime.now());
        hoaDon.setNhanVien(hd.getNhanVien());
        hoaDon.setHinhThuc(1);

        int tongDonGia = 0;

        for (String selectedValue : chon) {

            HoaDonChiTiet hdct = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(id, idAoChiTiet.get(Integer.parseInt(selectedValue)));

            AoChiTiet act = aoChiTietSer.findById(idAoChiTiet.get(Integer.parseInt(selectedValue)));
            Ao ao = act.getAo();

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            int gia;

            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }

            int donGia = gia * Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue)));

            tongDonGia += donGia;

            BigDecimal bigDecimalDonGia = new BigDecimal(donGia);

            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();

            hoaDonChiTiet.setHoaDon(hoaDonSer.findId(id));
            hoaDonChiTiet.setAoChiTiet(act);
            hoaDonChiTiet.setSoLuong(Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue))));
            hoaDonChiTiet.setDonGia(bigDecimalDonGia);
            hoaDonChiTietSer.update(hdct.getId(), hoaDonChiTiet);

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slBan = act.getSlban() + Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue)));

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(act.getSlton());
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
        }
        BigDecimal bigDecimalTongDonGia = new BigDecimal(tongDonGia);
        hoaDon.setTongTien(bigDecimalTongDonGia);

        hoaDonSer.update(id, hoaDon);

        if(hinhThucTT.equals("momo")){

            LocalDateTime now = LocalDateTime.now();

            HoaDon hoaDon1 = new HoaDon();

            hoaDon1.setMa("HD" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
            hoaDon1.setTongTien(bigDecimalTongDonGia);
            hoaDon1.setGhiChu(ghiChu);
            hoaDon1.setTrangThai(5);
            hoaDon1.setKhachHang(hd.getKhachHang());
            hoaDon1.setNgayTao(hd.getNgayTao());
            hoaDon1.setNgayHoanThanh(null);
            hoaDon1.setNgayThanhToan(null);
            hoaDon1.setNhanVien(hd.getNhanVien());
            hoaDon1.setHinhThuc(3);
            hoaDon1.setMoTa(hd.getMoTa());

            hoaDonSer.update(hd.getId(), hoaDon1);

            for (String selectedValue : chon) {
                AoChiTiet act = aoChiTietSer.findById(idAoChiTiet.get(Integer.parseInt(selectedValue)));

                AoChiTiet aoChiTiet = new AoChiTiet();

                int slBan = act.getSlban() - Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue)));

                aoChiTiet.setMau_sac(act.getMau_sac());
                aoChiTiet.setSize(act.getSize());
                aoChiTiet.setAo(act.getAo());
                aoChiTiet.setSlton(act.getSlton());
                aoChiTiet.setSlban(slBan);
                aoChiTiet.setTrangthai(act.getTrangthai());

                aoChiTietSer.update(act.getId(), aoChiTiet);
            }

            session.setAttribute("maHoaDonByMomoTaiQuay", hoaDon1.getMa());

            ObjectMapper mapper = new ObjectMapper();
            String orderId = hoaDon1.getMa();
            MomoModel jsonRequest = new MomoModel();
            jsonRequest.setPartnerCode(Constant.IDMOMO);
            jsonRequest.setOrderId(orderId);
            jsonRequest.setStoreId(orderId);
            jsonRequest.setRedirectUrl(Constant.redirectUrl);
            jsonRequest.setIpnUrl(Constant.ipnUrl);
            jsonRequest.setAmount(bigDecimalTongDonGia.toString());
            jsonRequest.setOrderInfo("Thanh toán Male Fashion.");
            jsonRequest.setRequestId(orderId);
            jsonRequest.setOrderType(Constant.orderType);
            jsonRequest.setRequestType(Constant.requestType);
            jsonRequest.setTransId("1");
            jsonRequest.setResultCode("200");
            jsonRequest.setMessage("");
            jsonRequest.setPayType(Constant.payType);
            jsonRequest.setResponseTime("300000");
            jsonRequest.setExtraData("");

            String decode = "accessKey=" + Constant.accessKey + "&amount=" + jsonRequest.amount + "&extraData="
                    + jsonRequest.extraData + "&ipnUrl=" + Constant.ipnUrl + "&orderId=" + orderId + "&orderInfo="
                    + jsonRequest.orderInfo + "&partnerCode=" + jsonRequest.getPartnerCode() + "&redirectUrl="
                    + Constant.redirectUrl + "&requestId=" + jsonRequest.getRequestId() + "&requestType="
                    + Constant.requestType;


            String signature = Decode.encode(Constant.serectkey, decode);
            jsonRequest.setSignature(signature);
            String json = mapper.writeValueAsString(jsonRequest);
            HttpClient client = HttpClient.newHttpClient();
            ResultMoMo res = new ResultMoMo();

            try {
                HttpRequest requestMomo = HttpRequest.newBuilder().uri(new URI(Constant.Url))
                        .POST(HttpRequest.BodyPublishers.ofString(json)).headers("Content-Type", "application/json")
                        .build();
                HttpResponse<String> response = client.send(requestMomo, HttpResponse.BodyHandlers.ofString());
                res = mapper.readValue(response.body(), ResultMoMo.class);
            } catch (InterruptedException | URISyntaxException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if (res == null) {

                session.setAttribute("error_momo", "Thanh toán thất bại");
                return "redirect:/home";

            } else {
                return "redirect:" + res.payUrl;
            }
        }

        model.addAttribute("hoaDon", id);
        session.setAttribute("quayThanhToanThanhCong","2");
        session.setAttribute("hdThanhCong",hd);

        return "redirect:/admin/ban-quay/trang-chu";
    }

    @PostMapping("/luuHD/{id}")
    public String luuHD(Model model, @PathVariable("id") UUID id,
                        @RequestParam("ghiChu") String ghiChu, HttpSession session) {

        HoaDon hoaDon1 = hoaDonSer.findId(id);

        for (HoaDon hoaDon : hoaDonSer.getAll()
        ) {
            if (hoaDon.getId().equals(id)) {

                hoaDon.setGhiChu(ghiChu);

                hoaDonSer.update(id, hoaDon);
            }

        }

        model.addAttribute("hoaDon", hoaDon1.getId());
        session.setAttribute("addGhiChuThanhCong","2");
        return "redirect:/admin/ban-quay/trang-chu";
    }

    @PostMapping("/tao_nhanh_tk")
    public String taoNhanhTk(HttpServletRequest request,HttpSession session) {
        String ten = request.getParameter("ten");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");

        Users users = new Users();

        int slKH = usersSer.soLuongUser() + 3;
        String ma = "00" + slKH;

        String mk = RandomStringUtils.randomNumeric(8);

        users.setMa(ma);
        users.setTen(ten);
        users.setEmail(email);
        users.setSdt(sdt);
        users.setMatKhau(mk);
        users.setRole(RoleEnum.MENBER);
        users.setTrangThai(1);

        usersSer.add(users);

        int slGH = gioHangSer.soLuongGioHang() + 1;

        String gh = "GH00" + slGH;

        GioHang g = new GioHang();
        g.setMa(gh);
        g.setKhachHang(users);
        g.setNgayTao(new Date());
        g.setTrangThai(1);
        gioHangSer.add(g);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Thông tin tài khoản");
        message.setText("Chúc mừng bạn đã đăng ký thành công tài khoản từ SD-99" +
                "\nTên khách hàng : " + ten +
                "\nEmail : " + email +
                "\nSố điện thoại : " + sdt + "\nMật khẩu : " + mk +
                "\nCảm ơn bạn và chúc bạn mua hàng vui vẻ");
        mailSender.send(message);
        session.setAttribute("addKhachHangNhanhThanhCong","2");
        return "redirect:/admin/ban-quay/trang-chu";
    }

}
