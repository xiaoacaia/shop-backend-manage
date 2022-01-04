package com.zhang.goods_manage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.zhang.goods_manage.mapper")
@SpringBootApplication
public class ShopManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShopManageApplication.class, args);
    }

}
