package study.spring.aesoop.model;

import lombok.Data;

@Data
public class Cart {
	private int cartno;
	private int userno;
	private int prodno;
	private int amount;
	private int has_orderno;
	
	private String pname;
	private String size;
	private int price;
	
}