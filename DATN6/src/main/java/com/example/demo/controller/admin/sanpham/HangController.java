package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Hang;
import com.example.demo.repo.sanpham.HangRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.sanpham.HangSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.UUID;

@Controller
public class HangController {

    @Autowired
    HangSer hangSer;

    @Autowired
    HangRepo hangRepo;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/admin/hang/view/*")
    public String view(Model model, HttpServletRequest request, HttpSession session) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Hang> listHangs = hangSer.getAll();
        model.addAttribute("listHangs", listHangs);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/hang/view/");
        String id = parts[1];

        try {
            Hang hang = hangSer.findById(UUID.fromString(id));
            model.addAttribute("item", hang);
        } catch (Exception e) {

        }

        String addThanhCong = (String) session.getAttribute("addThanhCong");
        String updateThanhCong = (String) session.getAttribute("updateThanhCong");

        if (addThanhCong != null){
            model.addAttribute("themThanhCong","2");
        }

        if (updateThanhCong != null){
            model.addAttribute("capNhatThanhCong","2");
        }

        session.removeAttribute("addThanhCong");
        session.removeAttribute("updateThanhCong");

        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        return "/admin/hang";
    }

    @PostMapping("/admin/hang/add")
    public String add(Model model, HttpServletRequest request, HttpSession session) {

        int slHang = hangRepo.soHang() + 1;

        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String tenNDD = request.getParameter("tenNDD");
        String sdt = request.getParameter("sdt");
        String trangthai = request.getParameter("trangthai");

        Hang hang = new Hang();

        hang.setMa("Hang"+slHang);
        hang.setTen(ten);
        hang.setSdt(sdt);
        hang.setTenNDD(tenNDD);
        hang.setDiaChi(diaChi);
        hang.setTrangthai(Integer.parseInt(trangthai));

        hangSer.add(hang);

        session.setAttribute("addThanhCong","2");
        return "redirect:/admin/hang/view/1";
    }

    @PostMapping("/admin/hang/update")
    public String update(Model model, HttpServletRequest request, HttpSession session) {

        String id = request.getParameter("id");
        String ten = request.getParameter("ten");
        String diaChi = request.getParameter("diaChi");
        String tenNDD = request.getParameter("tenNDD");
        String sdt = request.getParameter("sdt");
        String trangthai = request.getParameter("trangthai");

        Hang h = hangSer.findById(UUID.fromString(id));

        Hang hang = new Hang();

        hang.setTen(ten);
        hang.setMa(h.getMa());
        hang.setTenNDD(tenNDD);
        hang.setSdt(sdt);
        hang.setDiaChi(diaChi);
        hang.setTrangthai(Integer.parseInt(trangthai));

        hangSer.update(UUID.fromString(id), hang);
        session.setAttribute("updateThanhCong","2");
        return "redirect:/admin/hang/view/1";
    }

    @PostMapping("/admin/hang/detail")
    public String detail(Model model, HttpServletRequest request) {

        String id = request.getParameter("detail");
        Hang hang = hangSer.findById(UUID.fromString(id));

        return "redirect:/admin/hang/view/"+ hang.getId();
    }

    @PostMapping("/admin/hang/clear")
    public String clear() {
        return "redirect:/admin/hang/view/1";
    }
}
