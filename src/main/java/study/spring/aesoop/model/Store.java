package study.spring.aesoop.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Store {
 
    private int storeno;
    private String sname;
    private double loc_w;
    private double loc_g;
    private String tel;
    private String email;
    private String address;
    private String open_hours;
    private String info;
}