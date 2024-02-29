package com.example.demo.config;

import com.example.demo.filler.loGinInterceptor;
import com.example.demo.filler.adminInterceptor;
import com.example.demo.filler.userInterceptor;
import com.example.demo.filler.satffInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");

        registry
                .addResourceHandler("/upload/**")
                .addResourceLocations("/upload/");
    }


    //   Authorize the size web

    @Autowired
    loGinInterceptor loginInterceptor;

    @Autowired
    adminInterceptor adminInterceptor;

    @Autowired
    satffInterceptor satffInterceptor;

    @Autowired
    userInterceptor userInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry){

        //chỉ xem member
//        registry.addInterceptor(userInterceptor)
//                .addPathPatterns("/user/don_hang/*","/user/doi_mat_khau_view/*");

        registry.addInterceptor(satffInterceptor)
                .addPathPatterns("/admin/index/*","/admin/ao/**","/admin/chat_vai/**",
                        "/admin/form/**","/admin/hang/**","/admin/huong_dan_bao_quan/**",
                        "/admin/loai_ao/**","/admin/mau_sac/**","/admin/size/**",
                        "/admin/khachhang/**","/admin/ban-quay/**","/admin/quan_li_don_hang/**",
                        "/admin/don_hang/xac_nhan","/admin/don_hang/huy","/admin/don_hang/hoan_thanh");


        //Phân quyền bắt đăng nhập
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/index/*","/admin/ao/**","/admin/chat_vai/**",
                        "/admin/form/**","/admin/hang/**","/admin/huong_dan_bao_quan/**",
                        "/admin/loai_ao/**","/admin/mau_sac/**","/admin/size/**",
                        "/admin/khachhang/**","/admin/ban-quay/**","/admin/quan_li_don_hang/**",
                        "/admin/don_hang/xac_nhan","/admin/don_hang/huy","/admin/don_hang/hoan_thanh");
      }
}




