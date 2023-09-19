package study.spring.aesoop.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class SubCategory {
	private int subcateno; // 소분류번호
	private int cateno; // 대분류번호
	private String sub_category; // 소분류카테고리명
}
