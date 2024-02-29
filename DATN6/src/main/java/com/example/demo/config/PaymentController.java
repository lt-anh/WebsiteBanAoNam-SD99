package com.example.demo.config;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.GiaoDichVi;
import com.example.demo.entity.khachhang.GioHangChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.khachhang.ViShop;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.users.GiaoDichViSer;
import com.example.demo.ser.users.GioHangChiTietSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import com.example.demo.ser.users.ViShopSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

@Controller
public class PaymentController {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    ViShopSer viShopSer;

    @Autowired
    GiaoDichViSer giaoDichViSer;
    private String generatePaymentUrl(String ma, BigDecimal tongTien) throws UnsupportedEncodingException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = tongTien.toBigInteger().intValue() * 100;
        String bankCode = "NCB";

        String vnp_TxnRef = ma;
        String vnp_IpAddr = "127.0.0.1";

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        vnp_Params.put("vnp_BankCode", bankCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (!fieldValue.isEmpty())) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        return Config.vnp_PayUrl + "?" + queryUrl;
    }

	@GetMapping("/pay/*/*")
	public String getPay(HttpServletRequest request) throws UnsupportedEncodingException{

        String url = request.getRequestURI();
        String[] p = url.split("/pay/");
        String idStr = p[1];
        String[] idSt = idStr.split("/");
        String ma = idSt[0];
        String tongTien = idSt[1];

        String paymentUrl = generatePaymentUrl(ma, BigDecimal.valueOf(Double.valueOf(tongTien)));

		return "redirect:"+ paymentUrl;
	}

    @GetMapping("/paywithmomo/*")
    public String thanhCongMomo(HttpSession session, Model model, HttpServletRequest request,
                                @RequestParam(value = "orderId", required = false) String orderId,
                                @RequestParam(value = "message", required = false) String message){
        System.out.println("orderId la :"+orderId);
        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (orderId.contains("HD")){
            HoaDon hoaDon = hoaDonSer.findByMa(orderId);
            String webOrQuay = null;
            if (hoaDon.getTrangThai() == 0){
                webOrQuay = "web";
            }else if (hoaDon.getTrangThai() == 5){
                webOrQuay = "quay";
            }

            SimpleMailMessage message1 = new SimpleMailMessage();
            if (webOrQuay.equals("web")){
                message1.setTo(hoaDon.getKhachHang().getEmail());
            }
            message1.setSubject("Thông tin đơn hàng");
            String bodymail = "";

            if (message.equals("Successful.")){
                HoaDon hd1 = new HoaDon();

                hd1.setMa(hoaDon.getMa());
                hd1.setTongTien(hoaDon.getTongTien());
                hd1.setNgayTao(hoaDon.getNgayTao());
                hd1.setNgayChoXacNhan(LocalDateTime.now());
                hd1.setNgayThanhToan(LocalDateTime.now());
                if (webOrQuay.equals("web")){
                    hd1.setNgayHoanThanh(null);
                }else if (webOrQuay.equals("quay")){
                    hd1.setNgayHoanThanh(LocalDateTime.now());
                }
                hd1.setKhachHang(hoaDon.getKhachHang());

                if (webOrQuay.equals("web")){
                    hd1.setTrangThai(1);
                }else if (webOrQuay.equals("quay")){
                    hd1.setTrangThai(3);
                }

                if (webOrQuay.equals("quay")){
                    hd1.setNhanVien(user);
                }

                hd1.setMoTa(hoaDon.getMoTa());

                if (webOrQuay.equals("web")){
                    hd1.setHinhThuc(4);
                }else if (webOrQuay.equals("quay")){
                    hd1.setHinhThuc(6);
                }


                hoaDonSer.update(hoaDon.getId(), hd1);

                if (webOrQuay.equals("web")){
                    model.addAttribute("idKh",hoaDon.getKhachHang().getMa());
                }


                List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

                for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){
                    Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();

                    GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

                    int gia;

                    if (giamGiaSanPhamChiTiet != null) {
                        gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
                    } else {
                        gia = ao.getGiaBan().toBigInteger().intValue();
                    }

                    int donGia = gia * hoaDonChiTiet.getSoLuong();
                    BigDecimal bigDecimalDonGia = new BigDecimal(donGia);

                    HoaDonChiTiet hdct = new HoaDonChiTiet();
                    hdct.setHoaDon(hoaDonChiTiet.getHoaDon());
                    hdct.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
                    hdct.setSoLuong(hoaDonChiTiet.getSoLuong());
                    hdct.setDonGia(bigDecimalDonGia);

                    hoaDonChiTietSer.update(hoaDonChiTiet.getId(), hdct);

                    AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

                    AoChiTiet aoChiTiet = new AoChiTiet();

                    int slTon = act.getSlton() - hoaDonChiTiet.getSoLuong();
                    int slBan = act.getSlban() + hoaDonChiTiet.getSoLuong();

                    aoChiTiet.setMau_sac(act.getMau_sac());
                    aoChiTiet.setSize(act.getSize());
                    aoChiTiet.setAo(act.getAo());

                    if (webOrQuay.equals("web")){
                        aoChiTiet.setSlton(slTon);
                    }else if (webOrQuay.equals("quay")){
                        aoChiTiet.setSlton(act.getSlton());
                    }

                    aoChiTiet.setSlban(slBan);
                    aoChiTiet.setSlTra(act.getSlTra());
                    aoChiTiet.setTrangthai(act.getTrangthai());

                    aoChiTietSer.update(act.getId(), aoChiTiet);
                    bodymail += hdct.getAoChiTiet().getAo().getTen()+" "+hdct.getAoChiTiet().getSize().getTen()+" x "+hdct.getSoLuong()+"\n";
                }
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                String formattedTongTien = currencyFormat.format(hoaDon.getTongTien());
                String chiSoTongTien = formattedTongTien.replace("₫", "").trim();

                message1.setText("Chúc mừng bạn đã đặt hàng thành công sản phẩm từ SD-99" +
                        "\nMã đơn hàng : " + hoaDon.getMa()
                        +"\nSản phẩm :\n"+bodymail+"\nTổng tiền : "+chiSoTongTien+" VND"+
                        "\nCảm ơn bạn đã mua hàng");

                if (webOrQuay.equals("web")){
                    mailSender.send(message1);
                    return "/user/thanh_cong";
                }else if (webOrQuay.equals("quay")){
                    session.setAttribute("quayThanhToanThanhCong","2");
                    session.setAttribute("hdThanhCong",hoaDon);
                    return "redirect:/admin/ban-quay/trang-chu";
                }
            }else {
                if (webOrQuay.equals("web")){
                    HoaDon hoaDon1 = hoaDonSer.findByMa(orderId);

                    model.addAttribute("idKh",hoaDon1.getKhachHang().getMa());
                    return "/user/erorr";
                }else if (webOrQuay.equals("quay")){
                    HoaDon hoaDon1 = hoaDonSer.findByMa(orderId);

                    return "redirect:/admin/ban-quay/view-cart/"+hoaDon1.getId();
                }

            }
        }
        if(orderId.contains("GDV")){
            GiaoDichVi giaoDichVi = giaoDichViSer.findByMa(orderId);
            if (message.equals("Successful.")){
                ViShop v = giaoDichVi.getViShop();

                BigDecimal tt = v.getTongTien().add(giaoDichVi.getDonGia());

                ViShop viShop = new ViShop();

                viShop.setMa(v.getMa());
                viShop.setKhachHang(v.getKhachHang());
                viShop.setTongTien(tt);
                viShop.setTrangThai(1);

                viShopSer.update(v.getId(), viShop);

                GiaoDichVi gdv = new GiaoDichVi();

                gdv.setMa(giaoDichVi.getMa());
                gdv.setViShop(v);
                gdv.setNgayGiaoDich(LocalDateTime.now());
                gdv.setDonGia(giaoDichVi.getDonGia());
                gdv.setHinhThuc(1);
                gdv.setTrangThai(1);

                giaoDichViSer.update(giaoDichVi.getId(),gdv);

                session.setAttribute("napThanhCong","2");

                return "redirect:/user/vi_view/"+giaoDichVi.getViShop().getKhachHang().getMa();
            }else {
                session.setAttribute("napThatBai","2");
                return "redirect:/user/vi_view/"+giaoDichVi.getViShop().getKhachHang().getMa();
            }
        }
        return null;
    }

    @GetMapping("/thanh_cong/*")
    public String thanhCong(HttpSession session, Model model,HttpServletRequest request,
                            @RequestParam("vnp_Amount") String vnpAmount,
                            @RequestParam("vnp_BankCode") String vnpBankCode,
                            @RequestParam("vnp_TxnRef") String vnp_TxnRef,
                            @RequestParam(name = "vnp_BankTranNo", required = false) String vnpBankTranNo){

        HoaDon hoaDon = hoaDonSer.findByMa(vnp_TxnRef);

        if (vnpBankCode.equals("VNPAY")) {

            HoaDon hd = new HoaDon();

            hd.setMa(hoaDon.getMa());
            hd.setTongTien(hoaDon.getTongTien());
            hd.setNgayTao(hoaDon.getNgayTao());
            hd.setNgayChoXacNhan(null);
            hd.setNgayThanhToan(null);
            hd.setKhachHang(hoaDon.getKhachHang());
            hd.setHinhThuc(0);
            hd.setTrangThai(0);
            hd.setMoTa("");

            hoaDonSer.update(hoaDon.getId(),hd);
            model.addAttribute("idKh",hoaDon.getKhachHang().getMa());

            session.removeAttribute("maHoaDon");
            return "/user/erorr";

        } else if(vnpBankCode.equals("NCB")){
            if(vnpBankTranNo!= null){

                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(hoaDon.getKhachHang().getEmail());
                message.setSubject("Thông tin đơn hàng");
                String bodymail = "";

                HoaDon hd = new HoaDon();

                hd.setMa(hoaDon.getMa());
                hd.setTongTien(hoaDon.getTongTien());
                hd.setNgayTao(hoaDon.getNgayTao());
                hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
                hd.setNgayThanhToan(LocalDateTime.now());
                hd.setKhachHang(hoaDon.getKhachHang());
                hd.setHinhThuc(2);
                hd.setTrangThai(1);
                hd.setMoTa(hoaDon.getMoTa());
                hoaDonSer.update(hoaDon.getId(),hd);
                model.addAttribute("idKh",hoaDon.getKhachHang().getMa());

                List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

                for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
                    Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();

                    GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

                    int gia;

                    if (giamGiaSanPhamChiTiet != null) {
                        gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
                    } else {
                        gia = ao.getGiaBan().toBigInteger().intValue();
                    }

                    int donGia = gia * hoaDonChiTiet.getSoLuong();
                    BigDecimal bigDecimalDonGia = new BigDecimal(donGia);

                    HoaDonChiTiet hdct = new HoaDonChiTiet();
                    hdct.setHoaDon(hoaDonChiTiet.getHoaDon());
                    hdct.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
                    hdct.setSoLuong(hoaDonChiTiet.getSoLuong());
                    hdct.setDonGia(bigDecimalDonGia);

                    hoaDonChiTietSer.update(hoaDonChiTiet.getId(), hdct);

                    AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

                    AoChiTiet aoChiTiet = new AoChiTiet();

                    int slTon = act.getSlton() - hoaDonChiTiet.getSoLuong();
                    int slBan = act.getSlban() + hoaDonChiTiet.getSoLuong();

                    aoChiTiet.setMau_sac(act.getMau_sac());
                    aoChiTiet.setSize(act.getSize());
                    aoChiTiet.setAo(act.getAo());
                    aoChiTiet.setSlton(slTon);
                    aoChiTiet.setSlban(slBan);
                    aoChiTiet.setSlTra(act.getSlTra());
                    aoChiTiet.setTrangthai(act.getTrangthai());

                    aoChiTietSer.update(act.getId(), aoChiTiet);
                    bodymail += hdct.getAoChiTiet().getAo().getTen()+" "+hdct.getAoChiTiet().getSize().getTen()+" x "+hdct.getSoLuong()+"\n";
                }
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                String formattedTongTien = currencyFormat.format(hoaDon.getTongTien());
                String chiSoTongTien = formattedTongTien.replace("₫", "").trim();

                message.setText("Chúc mừng bạn đã đặt hàng thành công sản phẩm từ SD-99" +
                        "\nMã đơn hàng : " + hoaDon.getMa()
                        +"\nSản phẩm :\n"+bodymail+"\nTổng tiền : "+chiSoTongTien+" VND"+
                        "\nCảm ơn bạn đã mua hàng");

                mailSender.send(message);

                return "/user/thanh_cong";
            }else {

                LocalDateTime now = LocalDateTime.now();

                HoaDon hd = new HoaDon();

                hd.setMa("HD" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
                hd.setTongTien(hoaDon.getTongTien());
                hd.setNgayTao(hoaDon.getNgayTao());
                hd.setNgayChoXacNhan(null);
                hd.setNgayThanhToan(null);
                hd.setKhachHang(hoaDon.getKhachHang());
                hd.setHinhThuc(0);
                hd.setTrangThai(0);
                hd.setMoTa("");

                hoaDonSer.update(hoaDon.getId(),hd);
                model.addAttribute("idKh",hoaDon.getKhachHang().getMa());

                return "/user/erorr";
            }
        }
        return "/user/thanh_cong";
    }
}
