package com.example.demo.controller.admin.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import com.example.demo.entity.giamgia.GiamGiaSanPham;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.giamgia.GiamGiaHoaDonSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ChuongTrinhGiamGiaController {
    @Autowired
    GiamGiaSanPhamSer giamGiaSanPhamSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    AoSer aoSer;

    @Autowired
    ChatSer chatSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @GetMapping("/admin/chuong_trinh_giam_gia/add_view/*")
    public String viewAdd(Model model, HttpServletRequest request, HttpSession session) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/chuong_trinh_giam_gia/add_view/");
        String id = parts[1];

        try {
            GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamSer.findId(UUID.fromString(id));
            GiamGiaHoaDon giamGiaHoaDon = giamGiaHoaDonSer.findId(UUID.fromString(id));

            if (giamGiaSanPham != null) {
                model.addAttribute("item", giamGiaSanPham);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String ngayBatDau = dateFormat.format(giamGiaSanPham.getNgayBatDau());
                String ngayKetThuc = dateFormat.format(giamGiaSanPham.getNgayKetThuc());

                model.addAttribute("ngayBatDau_sp", ngayBatDau);
                model.addAttribute("ngayKetThuc_sp", ngayKetThuc);
                model.addAttribute("CTGG", giamGiaSanPham);
                model.addAttribute("loai", "giamgia_sp");
                model.addAttribute("CTGGSP", giamGiaSanPham);
            } else if (giamGiaHoaDon != null) {
                model.addAttribute("item", giamGiaHoaDon);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String ngayBatDau = dateFormat.format(giamGiaHoaDon.getNgayBatDau());
                String ngayKetThuc = dateFormat.format(giamGiaHoaDon.getNgayKetThuc());

                model.addAttribute("ngayBatDau_hd", ngayBatDau);
                model.addAttribute("ngayKetThuc_hd", ngayKetThuc);
                model.addAttribute("CTGG", giamGiaHoaDon);
                model.addAttribute("loai", "giamgia_hd");
                model.addAttribute("CTGGHD", giamGiaHoaDon);
            }


        } catch (Exception e) {

        }
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());

        String addThanhCong = (String) session.getAttribute("addThanhCong");
        String updateThanhCong = (String) session.getAttribute("updateThanhCong");
        String loiChuongTrinhDaTonTai = (String) session.getAttribute("loiChuongTrinhDaTonTai");

        if (addThanhCong != null){
            model.addAttribute("themThanhCong","2");
        }

        if (updateThanhCong != null){
            model.addAttribute("capNhatThanhCong","2");
        }

        if (loiChuongTrinhDaTonTai != null){
            model.addAttribute("loiChuongTrinhDaTonTaiStr","2");
        }

        session.removeAttribute("addThanhCong");
        session.removeAttribute("updateThanhCong");
        session.removeAttribute("loiChuongTrinhDaTonTai");

        return "/admin/add/add_chuong_trinh";
    }

    @GetMapping("/admin/view_chuong_trinh_giam_gia_sp/*")
    public String viewCTGGSP(Model model) {

        List<GiamGiaSanPham> listGiamGiaSanPhams = giamGiaSanPhamSer.getAll();
        model.addAttribute("listGiamGiaSanPhams", listGiamGiaSanPhams);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/chuong_trinh_giam_gia_sp";
    }

    @GetMapping("/admin/ap-dung")
    public String viewApDung(Model model, HttpSession session) {
        List<GiamGiaSanPhamChiTiet> listGiamGiaSanPhamChiTiets = giamGiaSanPhamChiTietSer.getAll();
        model.addAttribute("listGiamGiaSanPhamChiTiets",listGiamGiaSanPhamChiTiets);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());

        String loiGiamGiaChiTiet = (String) session.getAttribute("loiGiamGiaChiTiet");
        String addThanhCong = (String) session.getAttribute("addThanhCong");
        String deleteThanhCong = (String) session.getAttribute("deleteThanhCong");
        if (loiGiamGiaChiTiet != null){
            model.addAttribute("loiGiamGiaChiTietStr","2");
        }
        if (addThanhCong != null){
            model.addAttribute("themThanhCong","2");
        }
        if (deleteThanhCong != null){
            model.addAttribute("xoaThanhCong","2");
        }
        session.removeAttribute("loiGiamGiaChiTiet");
        session.removeAttribute("addThanhCong");
        session.removeAttribute("deleteThanhCong");

        return "/admin/add/ap_dung";
    }

    @GetMapping("/admin/view_chuong_trinh_giam_gia_hd/*")
    public String viewCTGGHD(Model model) {

        List<GiamGiaHoaDon> listGiamGiaHoaDons = giamGiaHoaDonSer.getAll();
        model.addAttribute("listGiamGiaHoaDons", listGiamGiaHoaDons);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/chuong_trinh_giam_gia_hd";
    }

    @PostMapping("/chuong-trinh-giam-gia/add")
    public String add(HttpServletRequest request, HttpSession session) {
        LocalDateTime now = LocalDateTime.now();
        String ma = "CTGG"+ now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond();
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String sosp = request.getParameter("sosp");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");

        if (loai.equals("giamgia_sp")) {

            List<GiamGiaSanPham> giamGiaSanPhamList = giamGiaSanPhamSer.findAll();

            for (GiamGiaSanPham ggsp : giamGiaSanPhamList){
                if (ggsp.getTen().equals(ten)){
                    session.setAttribute("loiChuongTrinhDaTonTai", "2");
                    return "redirect:/admin/chuong_trinh_giam_gia/add_view/1";
                }
            }

            GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
            giamGiaSanPham.setMa(ma);
            giamGiaSanPham.setTen(ten);
            giamGiaSanPham.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaSanPhamSer.add(giamGiaSanPham);
        } else if (loai.equals("giamgia_hd")) {

            List<GiamGiaHoaDon> giamGiaHoaDonList = giamGiaHoaDonSer.findAll();
            for (GiamGiaHoaDon gghd : giamGiaHoaDonList){
                if (gghd.getTen().equals(ten)){
                    session.setAttribute("loiChuongTrinhDaTonTai", "2");
                    return "redirect:/admin/chuong_trinh_giam_gia/add_view/1";
                }
            }

            BigDecimal tongtien = new BigDecimal(request.getParameter("tongtien"));
            GiamGiaHoaDon giamGiaHoaDon = new GiamGiaHoaDon();
            giamGiaHoaDon.setMa(ma);
            giamGiaHoaDon.setTen(ten);
            giamGiaHoaDon.setSoLuongSanPham(Integer.parseInt(sosp));
            giamGiaHoaDon.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaHoaDon.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaHoaDon.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaHoaDon.setSoTienHoaDon(tongtien);
            giamGiaHoaDonSer.add(giamGiaHoaDon);
        }

        session.setAttribute("addThanhCong","2");
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/1";
    }

    @PostMapping("/chuong-trinh-giam-gia/update")
    public String update(HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String sosp = request.getParameter("sosp");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");

        if (loai.equals("giamgia_sp")) {

            GiamGiaSanPham ggsp = giamGiaSanPhamSer.findId(UUID.fromString(id));
            String tenGG = ggsp.getTen();

            GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
            giamGiaSanPham.setMa(giamGiaSanPhamSer.findId(UUID.fromString(id)).getMa());
            giamGiaSanPham.setTen(ten);
            giamGiaSanPham.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaSanPhamSer.update(UUID.fromString(id), giamGiaSanPham);

            int checkGG = 0 ;

            List<GiamGiaSanPham> giamGiaSanPhamList = giamGiaSanPhamSer.findAll();
            for (GiamGiaSanPham gg : giamGiaSanPhamList){
                if (gg.getTen().equals(ten)){
                    checkGG ++;
                }
            }
            if (checkGG >= 2){
                GiamGiaSanPham giamGiaSanPham1 = new GiamGiaSanPham();
                giamGiaSanPham1.setMa(giamGiaSanPhamSer.findId(UUID.fromString(id)).getMa());
                giamGiaSanPham1.setTen(tenGG);
                giamGiaSanPham1.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

                String ngayBatDauSPString1 = request.getParameter("ngaybd");
                LocalDate ngayBatDauSP1 = LocalDate.parse(ngayBatDauSPString1);
                giamGiaSanPham1.setNgayBatDau(Date.from(ngayBatDauSP1.atStartOfDay(ZoneId.systemDefault()).toInstant()));

                String ngayKetThucSPString1 = request.getParameter("ngaykt");
                LocalDate ngayKetThucSP1 = LocalDate.parse(ngayKetThucSPString1);
                giamGiaSanPham1.setNgayKetThuc(Date.from(ngayKetThucSP1.atStartOfDay(ZoneId.systemDefault()).toInstant()));

                giamGiaSanPhamSer.update(UUID.fromString(id), giamGiaSanPham1);

                session.setAttribute("loiChuongTrinhDaTonTai", "2");
                return "redirect:/admin/chuong_trinh_giam_gia/add_view/"+ id;
            }

        } else if (loai.equals("giamgia_hd")) {

            GiamGiaHoaDon gghd = giamGiaHoaDonSer.findId(UUID.fromString(id));
            String tenGGHD = gghd.getTen();

            BigDecimal tongtien = new BigDecimal(request.getParameter("tongtien"));
            GiamGiaHoaDon giamGiaHoaDon = new GiamGiaHoaDon();
            giamGiaHoaDon.setMa(giamGiaHoaDonSer.findId(UUID.fromString(id)).getMa());
            giamGiaHoaDon.setTen(ten);
            giamGiaHoaDon.setSoLuongSanPham(Integer.parseInt(sosp));
            giamGiaHoaDon.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaHoaDon.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaHoaDon.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaHoaDon.setSoTienHoaDon(tongtien);
            giamGiaHoaDonSer.update(UUID.fromString(id), giamGiaHoaDon);

            int checkGGHD = 0 ;

            List<GiamGiaHoaDon> giamGiaHoaDonList = giamGiaHoaDonSer.findAll();

            for (GiamGiaHoaDon gg : giamGiaHoaDonList){
                if (gg.getTen().equals(ten)){
                    checkGGHD ++;
                }
            }
            if (checkGGHD >= 2){
                GiamGiaHoaDon giamGiaHoaDon1 = new GiamGiaHoaDon();
                giamGiaHoaDon1.setMa(giamGiaHoaDonSer.findId(UUID.fromString(id)).getMa());
                giamGiaHoaDon1.setTen(tenGGHD);
                giamGiaHoaDon1.setSoLuongSanPham(Integer.parseInt(sosp));
                giamGiaHoaDon1.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

                giamGiaHoaDon1.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

                giamGiaHoaDon1.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

                giamGiaHoaDon1.setSoTienHoaDon(tongtien);
                giamGiaHoaDonSer.update(UUID.fromString(id), giamGiaHoaDon1);

                session.setAttribute("loiChuongTrinhDaTonTai", "2");
                return "redirect:/admin/chuong_trinh_giam_gia/add_view/"+ id;
            }
        }
        session.setAttribute("updateThanhCong","2");
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/1";
    }

    @PostMapping("/chuong-trinh-giam-gia/detail_sp")
    public String detailGGSP(HttpServletRequest request) {
        String detail = request.getParameter("detail_sp");
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/" + detail;
    }

    @PostMapping("/chuong-trinh-giam-gia/detail_hd")
    public String detailGGHD(HttpServletRequest request) {
        String detail = request.getParameter("detail_hd");
        return "redirect:/admin/chuong_trinh_giam_gia/add_view/" + detail;
    }

    @PostMapping("/chuong-trinh-giam-gia/ap-dung-san-pham")
    public String apDungSanPham(HttpServletRequest request, HttpSession session) {

        String tenSanPham = request.getParameter("tenSanPham");
        String tenChuongTrinh = request.getParameter("tenChuongTrinh");
        Ao ao = aoSer.findByTen(tenSanPham);

        GiamGiaSanPhamChiTiet ggspct = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

        if (ggspct == null){
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = new GiamGiaSanPhamChiTiet();


            GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamSer.findByTen(tenChuongTrinh);

            BigDecimal phanTramGiam = BigDecimal.valueOf(giamGiaSanPham.getPhanTramGiam());

            giamGiaSanPhamChiTiet.setGiamGiaSanPham(giamGiaSanPham);
            giamGiaSanPhamChiTiet.setAo(ao);
            giamGiaSanPhamChiTiet.setSoTienDaGiam(ao.getGiaBan().multiply(phanTramGiam));
            giamGiaSanPhamChiTiet.setTrangThai(0);

            giamGiaSanPhamChiTietSer.add(giamGiaSanPhamChiTiet);
            session.setAttribute("addThanhCong", "2");
        }else {
            session.setAttribute("loiGiamGiaChiTiet", "2");
        }
        return "redirect:/admin/ap-dung";
    }

    @PostMapping("/admin/ctggspct/xoa/*")
    public String deleteCTGG(HttpServletRequest request, HttpSession session){
        String url = request.getRequestURI();
        String[] parts = url.split("/admin/ctggspct/xoa/");
        String id = parts[1];
        giamGiaSanPhamChiTietSer.delete(UUID.fromString(id));
        session.setAttribute("deleteThanhCong","2");
        return "redirect:/admin/ap-dung";
    }
}
