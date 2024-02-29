package com.example.demo.controller.admin.auth;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.GioHang;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.khachhang.ViShop;
import com.example.demo.repo.users.ViShopRepo;
import com.example.demo.ser.users.GioHangChiTietSer;
import com.example.demo.ser.users.GioHangSer;
import com.example.demo.ser.users.UsersSer;
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
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
public class AuthController {

    @Autowired
    UsersSer usersSer;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    ViShopRepo viShopRepo;

    @GetMapping("/login")
    public String showLoginForm(Model model, HttpSession session) {
        List<Users> listUsers = usersSer.getAll();

        model.addAttribute("user", new Users());
        model.addAttribute("listUsers", listUsers);

        String addThanhCong = (String) session.getAttribute("addThanhCong");

        if (addThanhCong != null){
            model.addAttribute("themThanhCong","2");
        }

        session.removeAttribute("addThanhCong");
        return "/admin/sign-in";
    }

    @GetMapping("/dangky")
    public String dangky(Model model) {
        model.addAttribute("user", new Users());
        return "/admin/sign-up";
    }

    @GetMapping("/quenmk")
    public String quenmk(Model model) {
        List<Users> listTK= usersSer.getAll();
        model.addAttribute("listTK",listTK);
        return "/admin/password-reset";
    }

    @GetMapping("/404")
    public String test404(Model model){
        model.addAttribute("user",new Users());
        return "/admin/add/404";
    }

    @GetMapping("/login_google_thanh_cong/*")
    public String loginGoogleThanhCong(HttpSession session, HttpServletRequest request){
        String url = request.getRequestURI();
        String[] parts = url.split("/login_google_thanh_cong/");
        String gmail = parts[1];
        int test = usersSer.demLoginGG(gmail);

        if (test > 0) {

            Users users = usersSer.findByEmail(gmail);

            session.setAttribute("userLogged1", users);
            return "redirect:/user/thong_tin/"+users.getMa();
        } else if (test == 0) {
            Users users = new Users();

            int slKH = usersSer.soLuongUser() + 3;
            String ma = "00" + slKH;

            users.setMa(ma);
            users.setEmail(gmail);
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

            BigDecimal b = new BigDecimal(0);
            viShopRepo.save(new ViShop(null,"ViShop"+slKH,users,b,1));

            session.setAttribute("userLogged1", users);
            return "redirect:/user/thong_tin/"+users.getMa();
        }
        return "redirect:/user/thong_tin/"+gmail;
    }

    @PostMapping("/guiemail")
    public String guiemail(HttpServletRequest request,Model model) {
        String email = request.getParameter("email");

        Users u = usersSer.findByEmail(email);

        if (u == null) {
            model.addAttribute("tb",1);
            return "/admin/password-reset";
        } else {
            String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder randomString = new StringBuilder();

            Random random = new Random();
            for (int i = 0; i < 8; i++) {
                int index = random.nextInt(characters.length());
                char randomChar = characters.charAt(index);
                randomString.append(randomChar);
            }
            String newpass = randomString.toString();

            u.setMatKhau(newpass);
            usersSer.update(u.getId(),u);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Mật khẩu mới");
            message.setText("Chúc mừng bạn đã đặt lại mật khẩu mới thành công mật khẩu là : " + newpass);

            mailSender.send(message);
            return "/admin/form-message";
        }


    }

    @PostMapping("/dangky-done")
    public String signupdone(HttpServletRequest request,Model model, HttpSession session) {
        String ten = request.getParameter("Ten");
        String email = request.getParameter("Email");
        Users u1 = usersSer.findByEmail(email);
        if (u1==null){
            String matKhau = request.getParameter("MatKhau");
            int slKH = usersSer.soLuongUser()+3;
            String ma = "00"+slKH;
            Users users = new Users(null, ma, ten, "", null, "", "", "", "","", email, matKhau, RoleEnum.MENBER, 1);

            usersSer.add(users);

            int slGH = gioHangSer.soLuongGioHang()+1;

            String gh = "GH00" + slGH;
            GioHang g = new GioHang();
            g.setMa(gh);
            g.setKhachHang(users);
            g.setNgayTao(new Date());
            g.setTrangThai(1);
            gioHangSer.add(g);

            BigDecimal b = new BigDecimal(0);
            viShopRepo.save(new ViShop(null,"ViShop"+slKH,users,b,1));

            session.setAttribute("addThanhCong","2");
            return "redirect:/login";
        }else{
            model.addAttribute("tb",1);
            return "/admin/sign-up";
        }

    }

    @PostMapping("/login")
    public String login(HttpSession session, HttpServletRequest request, Model model) {
        String tk = request.getParameter("taiKhoan");
        String mk = request.getParameter("matKhau");

        Users user = usersSer.findByEmailAndMatKhau(tk, mk);
        if (user == null) {
            model.addAttribute("tb", 1);
            return "/admin/sign-in";
        } else {
            if (user.getRole() == RoleEnum.ADMIN) {
                session.setAttribute("userLogged", user);
                return "redirect:/admin/index/1";
            } if (user.getRole() == RoleEnum.STAFF) {
                session.setAttribute("userLogged", user);
                return "redirect:/admin/index/1";
            } else if (user.getRole() == RoleEnum.MENBER) {
                session.setAttribute("userLogged1", user);
                session.setAttribute("login_google_thanh_cong","Thành công");
                return "redirect:/user/trang_chu/" + user.getMa();
            }
            return "redirect:/admin/ao/view/1";
        }
    }
}
