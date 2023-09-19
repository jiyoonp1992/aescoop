package study.spring.aesoop.model;

import lombok.Data;

@Data
public class Product {
	// 1) 기본 칼럼
	private int prodno;	
	private int subcateno;	 
	private String sub_category;	
	private String pname;	
	private String content; 
	private int price; 
	private String size; 
	private int stock; 
	private String file;
	private String file2;
	private String skintype;
	private String feels;
	private String amount;
	private String texture;
	private String ingredient;
	private String scent;
	private String directions;
	private String category;
	private String is_view;
	private int cateno;
	
	
	// 2) 페이지 구현을 위한  static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Product.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Product.listCount = listCount;
	}
	
}
