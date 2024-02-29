package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.dto.BieuDoDoanhThuDTO;
import com.example.demo.entity.dto.BieuDoSoLuongDTO;
import com.example.demo.entity.dto.DonHangDTO;
import com.example.demo.entity.dto.ThongKeDoanhThuDTO;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.WebColors;
import com.itextpdf.layout.Style;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.coyote.Response;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Table;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;

@RestController
@CrossOrigin("*")
public class ApiController {
    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    AoChiTietRepo aoChiTietRepo;

    @Value("${FONT}")
    private String font;
    private BieuDoDoanhThuDTO chartData = new BieuDoDoanhThuDTO();

    private BieuDoSoLuongDTO chartData1 = new BieuDoSoLuongDTO();

    private ThongKeDoanhThuDTO thongKeDoanhThuDTO = new ThongKeDoanhThuDTO();

    @GetMapping("/api/chart-data-doanhthu")
    public BieuDoDoanhThuDTO getChartData(@RequestParam String startDate, @RequestParam String endDate) {
        LocalDate date1 = null, date2 = null;

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Định dạng ngày
            date1 = LocalDate.parse(startDate, formatter);
            date2 = LocalDate.parse(endDate, formatter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Double> getDoanhThu = hoaDonSer.doanhThuTheoThang(date1, date2);
        List<Integer> thang = hoaDonSer.getDataThang(date1, date2);

        List<Integer> monthsInPeriod = new ArrayList<>();
        LocalDate currentDate = date1;
        while (!currentDate.isAfter(date2)) {
            monthsInPeriod.add(currentDate.getMonthValue());
            currentDate = currentDate.plusMonths(1);
        }
        List<String> getThang = new ArrayList<>();
        for (int i = 0; i < monthsInPeriod.size(); i++) {
            String a = "Thg " + monthsInPeriod.get(i);
            getThang.add(a);
        }
        System.out.println(monthsInPeriod.size());
        List<Double> finalResult = new ArrayList<>();
        for (Integer month : monthsInPeriod) {
            boolean found = false;
            for (int i = 0; i < getDoanhThu.size(); i++) {
                if (month == thang.get(i)) {
                    finalResult.add(getDoanhThu.get(i));
                    found = true;
                    break;
                }
            }
            if (!found) {
                finalResult.add(0.0);
            }
        }

        chartData.setLabels(getThang);
        chartData.setDatasetData(finalResult);
        return chartData;
    }

    @GetMapping("/api/chart-data-soluongban")
    public BieuDoSoLuongDTO getChartData1(@RequestParam String startDate, @RequestParam String endDate) {
        LocalDate date1 = null, date2 = null;

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Định dạng ngày
            date1 = LocalDate.parse(startDate, formatter);
            date2 = LocalDate.parse(endDate, formatter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Integer> getSoLuong = hoaDonChiTietSer.soLuongBanTheoThang(date1, date2);
        List<Integer> thang = hoaDonSer.getDataThang(date1, date2);

        List<Integer> monthsInPeriod = new ArrayList<>();
        LocalDate currentDate = date1;
        while (!currentDate.isAfter(date2)) {
            monthsInPeriod.add(currentDate.getMonthValue());
            currentDate = currentDate.plusMonths(1);
        }
        List<String> getThang = new ArrayList<>();
        for (int i = 0; i < monthsInPeriod.size(); i++) {
            String a = "Thg " + monthsInPeriod.get(i);
            getThang.add(a);
        }
        System.out.println(getThang.size());
        List<Integer> finalResult = new ArrayList<>();
        for (Integer month : monthsInPeriod) {
            boolean found = false;
            for (int i = 0; i < getSoLuong.size(); i++) {
                if (month == thang.get(i)) {
                    finalResult.add(getSoLuong.get(i));
                    found = true;
                    break;
                }
            }
            if (!found) {
                finalResult.add(0);
            }
        }

        chartData1.setLabels(getThang);
        chartData1.setDatasetData(finalResult);
        return chartData1;
    }

    @GetMapping("/api/thongketheoOption")
    public ThongKeDoanhThuDTO getThongKe(@RequestParam String thongKeOption, Model model) {
        LocalDate ngayHienTai = LocalDate.now();
        LocalDate ngayHomTruoc = ngayHienTai.minus(1, ChronoUnit.DAYS);
        LocalDate lastMonth = ngayHienTai.minusMonths(1);
        NumberFormat numberFormat = new DecimalFormat("#,###");
        if ("ngay".equals(thongKeOption)) {
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
            String formatSoSanhHoaDon = String.valueOf(soSanhHoaDon);
            if (soSanhHoaDon >= 0) {
                formatSoSanhHoaDon = "+" + formatSoSanhHoaDon;
            }

            int soSanhSoLuongBan;

            soSanhSoLuongBan = soLuongBanNgayHienTai - soLuongBanNgayTruoc;

            String formatSoSanhSoLuong = String.valueOf(soSanhSoLuongBan);
            if (soSanhSoLuongBan >= 0) {
                formatSoSanhSoLuong = "+" + formatSoSanhSoLuong;
            }
            System.out.println(formatSoSanhSoLuong);
            double soSanhDoanhThu;

            soSanhDoanhThu = doanhThuNgayHienTai - doanhThuNgayTruocStr;
            String formatSoSanhDoanhThu = numberFormat.format(soSanhDoanhThu);
            if (soSanhDoanhThu >= 0) {
                formatSoSanhDoanhThu = "+" + formatSoSanhDoanhThu;
            }

            int soSanhSoLuongKhach;

            soSanhSoLuongKhach = soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruocStr;

            String formatSoSanhSoLuongKhach = String.valueOf(soSanhSoLuongKhach);
            if (soSanhSoLuongKhach >= 0) {
                formatSoSanhSoLuongKhach = "+" + formatSoSanhSoLuongKhach;
            }

            thongKeDoanhThuDTO.setSoLuongHoaDon(String.valueOf(soDonNgayHienTai));
            thongKeDoanhThuDTO.setSoluongBan(String.valueOf(soLuongBanNgayHienTai));
            thongKeDoanhThuDTO.setDoanhThu(numberFormat.format(doanhThuNgayHienTai));
            thongKeDoanhThuDTO.setSoLuongKhachMua(String.valueOf(soLuongKhachMuaNgayHienTai));

            thongKeDoanhThuDTO.setSoSanhSoHoaDon(formatSoSanhHoaDon);
            thongKeDoanhThuDTO.setSoSanhSoLuongBan(formatSoSanhSoLuong);
            thongKeDoanhThuDTO.setSoSanhDoanhThu(formatSoSanhDoanhThu);
            thongKeDoanhThuDTO.setSoSanhSoLuongKhachMua(formatSoSanhSoLuongKhach);

            thongKeDoanhThuDTO.setSoLuongHoaDonHomQua(String.valueOf(soDonNgayHomTruoc));
            thongKeDoanhThuDTO.setSoluongBanHomQua(String.valueOf(soLuongBanNgayTruoc));
            thongKeDoanhThuDTO.setDoanhThuHomQua(numberFormat.format(doanhThuNgayTruocStr));
            thongKeDoanhThuDTO.setSoLuongKhachMuaHomQua(String.valueOf(soLuongKhachMuaNgayTruocStr));
        } else if ("thang".equals(thongKeOption)) {
            Integer soDonNgayHienTai = hoaDonSer.soHoaDonTrongThang(ngayHienTai);
            Integer soDonNgayHomTruoc = hoaDonSer.soHoaDonTrongThang(lastMonth);

            if (soDonNgayHienTai == null) {
                soDonNgayHienTai = 0;
            }
            if (soDonNgayHomTruoc == null) {
                soDonNgayHomTruoc = 0;
            }

            Integer soLuongBanNgayHienTai = hoaDonChiTietSer.soLuongBanTrongThang(ngayHienTai);
            Integer soLuongBanNgayTruoc = hoaDonChiTietSer.soLuongBanTrongThang(lastMonth);

            if (soLuongBanNgayHienTai == null) {
                soLuongBanNgayHienTai = 0;
            }
            if (soLuongBanNgayTruoc == null) {
                soLuongBanNgayTruoc = 0;
            }

            Double doanhThuNgayHienTai = hoaDonSer.doanhThuThang(ngayHienTai);
            Double doanhThuNgayTruocStr = hoaDonSer.doanhThuThang(lastMonth);


            if (doanhThuNgayHienTai == null) {
                doanhThuNgayHienTai = 0.0;
            }
            if (doanhThuNgayTruocStr == null) {
                doanhThuNgayTruocStr = 0.0;
            }

            Integer soLuongKhachMuaNgayHienTai = hoaDonSer.soLuongKhachMuaTrongThang(ngayHienTai);
            Integer soLuongKhachMuaNgayTruocStr = hoaDonSer.soLuongKhachMuaTrongThang(lastMonth);


            if (soLuongKhachMuaNgayHienTai == null) {
                soLuongKhachMuaNgayHienTai = 0;
            }
            if (soLuongKhachMuaNgayTruocStr == null) {
                soLuongKhachMuaNgayTruocStr = 0;
            }

            int soSanhHoaDon;
            soSanhHoaDon = soDonNgayHienTai - soDonNgayHomTruoc;
            String formatSoSanhHoaDon = String.valueOf(soSanhHoaDon);
            if (soSanhHoaDon >= 0) {
                formatSoSanhHoaDon = "+" + formatSoSanhHoaDon;
            }

            int soSanhSoLuongBan;

            soSanhSoLuongBan = soLuongBanNgayHienTai - soLuongBanNgayTruoc;

            String formatSoSanhSoLuong = String.valueOf(soSanhSoLuongBan);
            if (soSanhSoLuongBan >= 0) {
                formatSoSanhSoLuong = "+" + formatSoSanhSoLuong;
            }
            System.out.println(formatSoSanhSoLuong);
            double soSanhDoanhThu;

            soSanhDoanhThu = doanhThuNgayHienTai - doanhThuNgayTruocStr;
            String formatSoSanhDoanhThu = numberFormat.format(soSanhDoanhThu);
            if (soSanhDoanhThu >= 0) {
                formatSoSanhDoanhThu = "+" + formatSoSanhDoanhThu;
            }

            int soSanhSoLuongKhach;

            soSanhSoLuongKhach = soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruocStr;

            String formatSoSanhSoLuongKhach = String.valueOf(soSanhSoLuongKhach);
            if (soSanhSoLuongKhach >= 0) {
                formatSoSanhSoLuongKhach = "+" + formatSoSanhSoLuongKhach;
            }

            thongKeDoanhThuDTO.setSoLuongHoaDon(String.valueOf(soDonNgayHienTai));
            thongKeDoanhThuDTO.setSoluongBan(String.valueOf(soLuongBanNgayHienTai));
            thongKeDoanhThuDTO.setDoanhThu(numberFormat.format(doanhThuNgayHienTai));
            thongKeDoanhThuDTO.setSoLuongKhachMua(String.valueOf(soLuongKhachMuaNgayHienTai));

            thongKeDoanhThuDTO.setSoSanhSoHoaDon(formatSoSanhHoaDon);
            thongKeDoanhThuDTO.setSoSanhSoLuongBan(formatSoSanhSoLuong);
            thongKeDoanhThuDTO.setSoSanhDoanhThu(formatSoSanhDoanhThu);
            thongKeDoanhThuDTO.setSoSanhSoLuongKhachMua(formatSoSanhSoLuongKhach);

            thongKeDoanhThuDTO.setSoLuongHoaDonHomQua(String.valueOf(soDonNgayHomTruoc));
            thongKeDoanhThuDTO.setSoluongBanHomQua(String.valueOf(soLuongBanNgayTruoc));
            thongKeDoanhThuDTO.setDoanhThuHomQua(numberFormat.format(doanhThuNgayTruocStr));
            thongKeDoanhThuDTO.setSoLuongKhachMuaHomQua(String.valueOf(soLuongKhachMuaNgayTruocStr));
            System.out.println(soLuongBanNgayHienTai + " aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + soLuongBanNgayTruoc + formatSoSanhSoLuong);
        }
        return thongKeDoanhThuDTO;
    }

    @GetMapping("/api/listTon")
    public List<Integer> getListTon(@RequestParam String loaiAo, @RequestParam String tenAo, @RequestParam String mauSac) {
        List<AoChiTiet> listTon = aoChiTietRepo.listSoLuongbyMauAo(loaiAo, tenAo, mauSac);
        System.out.println(listTon.size());
        List<Integer> listSl = Arrays.asList(0, 0, 0, 0, 0, 0);
        for (AoChiTiet aoChiTiet : listTon
        ) {
            if (aoChiTiet.getSize().getMa().equals("L")) {
                listSl.set(0, aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("XXL")) {
                listSl.set(1, aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("S")) {
                listSl.set(2, aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("M")) {
                listSl.set(3, aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("XXXL")) {
                listSl.set(4, aoChiTiet.getSlton());
            }
            if (aoChiTiet.getSize().getMa().equals("XL")) {
                listSl.set(5, aoChiTiet.getSlton());
            }
        }
        System.out.println(listSl.size() + "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
        return listSl;
    }

    @GetMapping("/api/listAo")
    public List<String> getListAo(@RequestParam String loaiAo) {
        List<Ao> listAo = aoChiTietRepo.listAoByLoaiAo(loaiAo);
        System.out.println(listAo.size() + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        List<String> tenAo = new ArrayList<>();
        for (Ao ao : listAo
        ) {
            tenAo.add(ao.getTen());
            System.out.println(ao.getTen());
        }
        return tenAo;
    }

    @GetMapping("/api/thong_ke_so_luong_ao/{maLoaiAo}")
    public ResponseEntity<?> thongKeAo(@PathVariable String maLoaiAo) {

        List<AoDTO> listAoDTOS = aoChiTietSer.thongKeAoDto(maLoaiAo);
        return ResponseEntity.ok(listAoDTOS);
    }

    @GetMapping("/export-excel")
    public ResponseEntity<byte[]> exportExcel(HttpSession session) {

        List<DonHangDTO> listDonHangXuatExxcel = (List<DonHangDTO>) session.getAttribute("listDonHangXuatExxcel");
        // Tạo workbook và các cell trong file Excel
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sheet 1");
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Mã hóa đơn");
        headerRow.createCell(1).setCellValue("Số sản phẩm");
        headerRow.createCell(2).setCellValue("Tổng tiền");
        headerRow.createCell(3).setCellValue("Khách hàng");
        headerRow.createCell(4).setCellValue("Ngày tạo");
        headerRow.createCell(5).setCellValue("Hình thức");
        headerRow.createCell(6).setCellValue("Trạng thái hóa đơn");
        // Thêm dữ liệu mẫu

        int soPhantu = listDonHangXuatExxcel.toArray().length;

        Row[] dataRows = new Row[soPhantu];

        System.out.println("số phần tử " + soPhantu);

        int i = 0;

        for (DonHangDTO donHangDTO : listDonHangXuatExxcel) {
            dataRows[i] = sheet.createRow(i + 1); // Tạo dòng từ index 1 đến index 100
            dataRows[i].createCell(0).setCellValue(donHangDTO.getHoaDon().getMa()); // Cột 1 chứa giá trị i + 1
            dataRows[i].createCell(1).setCellValue(donHangDTO.getSoLuong());
            dataRows[i].createCell(2).setCellValue(String.valueOf(donHangDTO.getHoaDon().getTongTien()));
            dataRows[i].createCell(3).setCellValue(donHangDTO.getTen());
            dataRows[i].createCell(4).setCellValue(donHangDTO.getHoaDon().getNgayTao());

            dataRows[i].createCell(5).setCellValue(getHinhThucAsString(donHangDTO.getHoaDon().getHinhThuc()));
            dataRows[i].createCell(6).setCellValue(getTrangThaiAsString(donHangDTO.getHoaDon().getTrangThai()));

            i++;
        }

        // Chuẩn bị để ghi file Excel vào ByteArrayOutputStream
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            workbook.write(outputStream);
            HttpHeaders headers = new HttpHeaders();
            // Thiết lập các headers cho file Excel
            headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
            headers.setContentDispositionFormData("attachment", "thongKeExcel.xlsx");
            headers.setCacheControl("must-revalidate, no-cache, no-store");

            return new ResponseEntity<>(outputStream.toByteArray(), headers, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        } finally {
            try {
                workbook.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @GetMapping("/export-pdf")
    public ResponseEntity<byte[]> exportPdf(HttpSession session) {
        List<DonHangDTO> listDonHangXuatExxcel = (List<DonHangDTO>) session.getAttribute("listDonHangXuatExxcel");

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

        try (PdfWriter writer = new PdfWriter(outputStream);
             PdfDocument pdf = new PdfDocument(writer);
             Document document = new Document(pdf)) {

            // Tạo table để chứa dữ liệu
            Table table = new Table(7); // 7 cột cho 7 thuộc tính của DonHangDTO

            // Thêm header cho table
            table.addHeaderCell("Ma hoa don");
            table.addHeaderCell("So san pham");
            table.addHeaderCell("Tong tien");
            table.addHeaderCell("Khach hang");
            table.addHeaderCell("Ngay tao");
            table.addHeaderCell("Hinh thuc");
            table.addHeaderCell("Trang thai hoa don");

            // Thêm dữ liệu từ listDonHangXuatExxcel vào table
            for (DonHangDTO donHangDTO : listDonHangXuatExxcel) {
                table.addCell(String.valueOf(donHangDTO.getHoaDon().getMa()));
                table.addCell(String.valueOf(donHangDTO.getSoLuong()));
                table.addCell(String.valueOf(donHangDTO.getHoaDon().getTongTien()));
                if (donHangDTO.getTen() == null) {
                    table.addCell(" ");
                } else {
                    table.addCell(donHangDTO.getTen());
                }

                table.addCell(String.valueOf(donHangDTO.getHoaDon().getNgayTao()));

                // Thêm dữ liệu cho cột "Hình thức" và "Trạng thái hóa đơn"
                // (Bạn có thể điều chỉnh theo logic của mình)
                table.addCell(getHinhThucAsString(donHangDTO.getHoaDon().getHinhThuc()));
                table.addCell(getTrangThaiAsString(donHangDTO.getHoaDon().getTrangThai()));
            }

            // Thêm table vào document
            document.add(table);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "thongKePdf.pdf");
        headers.setCacheControl("must-revalidate, no-cache, no-store");

        return new ResponseEntity<>(outputStream.toByteArray(), headers, HttpStatus.OK);
    }

//    @GetMapping("/export-pdf-ban-quay")
//    public ResponseEntity<byte[]> exportPdfBanQuay(HttpSession session) {
//        HoaDon hdThanhCong = (HoaDon) session.getAttribute("hdThanhCong");
//
//        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hdThanhCong.getId());
//
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//
//        try (PdfWriter writer = new PdfWriter(outputStream);
//             PdfDocument pdf = new PdfDocument(writer);
//             Document document = new Document(pdf)) {
//
//            document.add(new Paragraph("Ma hoa don: " + hdThanhCong.getMa()).setBold());
//
//            if (hdThanhCong.getKhachHang() != null){
//                document.add(new Paragraph("Khach hang: " + hdThanhCong.getKhachHang().getTen()));
//            }
//
//            document.add(new Paragraph("Nhan vien thanh toan: " + hdThanhCong.getNhanVien().getTen()));
//
//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//            String formattedDate = hdThanhCong.getNgayTao().format(formatter);
//            document.add(new Paragraph("Thoi gian mua: " + formattedDate));
//
//            Table table = new Table(4);
//
//            table.setBorder(Border.NO_BORDER);
//
//            Style thStyle = new Style().setBackgroundColor(WebColors.getRGBColor("#4682B4"))
//                    .setFontColor(ColorConstants.WHITE)
//                    .setFontSize(12)
//                    .setFontColor(ColorConstants.BLACK);;
//
//            Cell headerCell1 = new Cell().add(new Paragraph("Áo").addStyle(thStyle));
//            Cell headerCell2 = new Cell().add(new Paragraph("Thong tin").addStyle(thStyle));
//            Cell headerCell3 = new Cell().add(new Paragraph("So luong").addStyle(thStyle));
//            Cell headerCell4 = new Cell().add(new Paragraph("Don gia").addStyle(thStyle));
//
//            headerCell1.setBorder(Border.NO_BORDER);
//            headerCell2.setBorder(Border.NO_BORDER);
//            headerCell3.setBorder(Border.NO_BORDER);
//            headerCell4.setBorder(Border.NO_BORDER);
//
//            // Thêm header cho table
//            table.addCell(headerCell1);
//            table.addCell(headerCell2);
//            table.addCell(headerCell3);
//            table.addCell(headerCell4);
//
//            Style tdStyle = new Style().setFontSize(10);
//            // Thêm dữ liệu từ listDonHangXuatExxcel vào table
//            for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
//                String aoChiTiet = hoaDonChiTiet.getAoChiTiet().getMau_sac().getTen() + ", " + hoaDonChiTiet.getAoChiTiet().getSize().getTen();
//
//                Cell cell1 = new Cell().add(new Paragraph(hoaDonChiTiet.getAoChiTiet().getAo().getTen()).addStyle(tdStyle));
//                Cell cell2 = new Cell().add(new Paragraph(aoChiTiet).addStyle(tdStyle));
//                Cell cell3 = new Cell().add(new Paragraph(String.valueOf(hoaDonChiTiet.getSoLuong())).addStyle(tdStyle));
//                Cell cell4 = new Cell().add(new Paragraph(String.valueOf(hoaDonChiTiet.getDonGia())).addStyle(tdStyle));
//
//                cell1.setBorder(Border.NO_BORDER);
//                cell2.setBorder(Border.NO_BORDER);
//                cell3.setBorder(Border.NO_BORDER);
//                cell4.setBorder(Border.NO_BORDER);
//
//                // Thêm header cho table
//                table.addCell(cell1);
//                table.addCell(cell2);
//                table.addCell(cell3);
//                table.addCell(cell4);
//            }
//            // Thêm table vào document
//            document.add(table);
//        } catch (IOException e) {
//            e.printStackTrace();
//            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_PDF);
//        headers.setContentDispositionFormData("attachment", "thongKePdf.pdf");
//        headers.setCacheControl("must-revalidate, no-cache, no-store");
//
//        session.removeAttribute("hdThanhCong");
//        return new ResponseEntity<>(outputStream.toByteArray(), headers, HttpStatus.OK);
//    }

    @GetMapping("/export-pdf-ban-quay")
    public ResponseEntity<ByteArrayResource> sendPdfToMailQuay(HttpSession session) throws IOException, DocumentException {

        HoaDon hdThanhCong = (HoaDon) session.getAttribute("hdThanhCong");
        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hdThanhCong.getId());

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        com.itextpdf.text.Document document = new com.itextpdf.text.Document();
        com.itextpdf.text.pdf.PdfWriter writer = com.itextpdf.text.pdf.PdfWriter.getInstance(document, baos);

        // Mở tài liệu PDF
        document.open();

        // Tạo font chữ cho tiêu đề và nội dung
        BaseFont bf = BaseFont.createFont(this.font, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font titleFont = new Font(bf, 18, Font.BOLD);
        Font headerFont = new Font(bf, 12, Font.BOLD);
        Font contentFont = new Font(bf, 12);


        // Tạo tiêu đề hóa đơn
        com.itextpdf.text.Paragraph title = new com.itextpdf.text.Paragraph("HÓA ĐƠN BÁN HÀNG", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20f);
        document.add(title);

        // Tạo thông tin cửa hàng
        com.itextpdf.text.Paragraph storeInfo = new com.itextpdf.text.Paragraph("CỬA HÀNG SD-99", headerFont);
        storeInfo.setAlignment(Element.ALIGN_LEFT);
        storeInfo.setSpacingAfter(10f);
        document.add(storeInfo);

        com.itextpdf.text.Paragraph storeAddress = new Paragraph("Số 19, Ngõ 204, Lê Thanh Nghị, Hai Bà Trưng, Hà Nội", contentFont);
        storeAddress.setAlignment(Element.ALIGN_LEFT);
        storeAddress.setSpacingAfter(20f);
        document.add(storeAddress);

        // Tạo thông tin hóa đơn
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{1.0f, 3.0f});

        // Thêm dòng Mã Hóa đơn
        PdfPCell cell = new PdfPCell(new Phrase("Mã Hóa đơn:", headerFont));

        table.addCell(cell);

        cell = new PdfPCell(new Phrase(String.valueOf(hdThanhCong.getMa()), contentFont));

        table.addCell(cell);

        // Thêm dòng Tên khách hàng
        cell = new PdfPCell(new Phrase("Tên khách hàng:", headerFont));
        table.addCell(cell);

        String tenKhachHang = (hdThanhCong.getKhachHang() != null) ? hdThanhCong.getKhachHang().getTen() : "Khách lẻ";
        cell = new PdfPCell(new Phrase(tenKhachHang, contentFont));
        table.addCell(cell);

        // Thêm dòng Địa chỉ
        cell = new PdfPCell(new Phrase("Địa chỉ:", headerFont));
        table.addCell(cell);

        String diaChi = (hdThanhCong.getKhachHang() != null) ? hdThanhCong.getKhachHang().getDia_chi() : "";
        cell = new PdfPCell(new Phrase(diaChi, contentFont));
        table.addCell(cell);

        // Thêm dòng Số điện thoại
        cell = new PdfPCell(new Phrase("Số điện thoại:", headerFont));
        table.addCell(cell);

        String soDienThoai = (hdThanhCong.getKhachHang() != null) ? hdThanhCong.getKhachHang().getSdt() : "";
        cell = new PdfPCell(new Phrase(soDienThoai, contentFont));
        table.addCell(cell);

        // Thêm dòng Ngày tạo
        cell = new PdfPCell(new Phrase("Ngày tạo:", headerFont));
        table.addCell(cell);

        LocalDateTime ngayTaoLocalDateTime = hdThanhCong.getNgayTao();
        Date ngayTaoDate = Date.from(ngayTaoLocalDateTime.atZone(ZoneId.systemDefault()).toInstant());

        // Format the date using SimpleDateFormat
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String ngayTaoFormatted = dateFormat.format(ngayTaoDate);

        cell = new PdfPCell(new Phrase(ngayTaoFormatted, contentFont));
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Sản phẩm:", headerFont));
        table.addCell(cell);

// Create a StringBuilder to concatenate product information for all items
        StringBuilder productDetails = new StringBuilder();

        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        currencyFormat.setCurrency(Currency.getInstance("VND"));

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
            String aoChiTiet = hoaDonChiTiet.getAoChiTiet().getMau_sac().getTen() + " , size " + hoaDonChiTiet.getAoChiTiet().getSize().getTen();

            // Append product details to the StringBuilder
            productDetails.append(hoaDonChiTiet.getAoChiTiet().getAo().getTen()).append(" , màu ");
            productDetails.append(aoChiTiet).append(" x ");
            productDetails.append(hoaDonChiTiet.getSoLuong()).append(" : ");
            productDetails.append(currencyFormat.format(hoaDonChiTiet.getDonGia())).append(" \n");

        }

// Create a PdfPCell with the concatenated product information
        cell = new PdfPCell(new Phrase(productDetails.toString(), contentFont));
        table.addCell(cell);

        // Thêm dòng Sản phẩm
//    for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
//        String aoChiTiet = hoaDonChiTiet.getAoChiTiet().getMau_sac().getTen() + ", " + hoaDonChiTiet.getAoChiTiet().getSize().getTen();
//
//        cell = new PdfPCell(new Phrase("Sản phẩm:", headerFont));
//
//        table.addCell(cell);
//
//        cell = new PdfPCell(new Phrase(hoaDonChiTiet.getAoChiTiet().getAo().getTen(), contentFont));
//
//        table.addCell(cell);
//
//    }

//        String tensp = null;
//        List<String> spp = null;
//        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
//            spp = new ArrayList<>();
//            tensp = null;
//            Integer sl = null;
//            String test = " ";
//
////        Locale vietnameseLocale = new Locale("vi", "VN");
////        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
//
//            tensp = hoaDonChiTiet.getAoChiTiet().getAo().getTen();
//            sl = hoaDonChiTiet.getSoLuong();
//            String all = tensp + " x " + sl;
//            spp.add(all);
//        }
//
//        cell = new PdfPCell(new Phrase("Sản phẩm:", headerFont));
//
//        table.addCell(cell);
//
//        cell = new PdfPCell(new Phrase(String.valueOf(spp), contentFont));
//
//        table.addCell(cell);


        // Thêm bảng thông tin hóa đơn vào tài liệu PDF
        document.add(table);

        // Đóng tài liệu PDF
        document.close();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "HoaDon_" + hdThanhCong.getId() + ".pdf");

        session.removeAttribute("hdThanhCong");
        // Return the PDF file as a ResponseEntity
        return new ResponseEntity<>(new ByteArrayResource(baos.toByteArray()), headers, HttpStatus.OK);
    }

    private String getHinhThucAsString(int hinhThuc) {
        // Điều chỉnh logic dựa trên hình thức thanh toán của bạn
        switch (hinhThuc) {
            case 1:
                return "Tai quay";
            case 2:
                return "VnPay";
            case 3:
                return "Thanh toan khi nhan hang";
            default:
                return "";
        }
    }

    // Phương thức chuyển đổi trạng thái hóa đơn sang chuỗi
    private String getTrangThaiAsString(int trangThai) {
        // Điều chỉnh logic dựa trên trạng thái của bạn
        switch (trangThai) {
            case 1:
                return "Cho xac nhan";
            case 2:
                return "Dang giao";
            case 3:
                return "Hoan thanh";
            case 4:
                return "Huy";
            default:
                return "";
        }
    }
}
