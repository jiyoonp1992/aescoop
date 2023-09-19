package study.spring.aesoop.model;

import lombok.Data;

@Data
public class Order_List {
	
	private int orderno;
	private String requirement;
	private int tprice;
	private String postno;
	private String address1;
	private String address2;
	private String address3;
	private int orderamount;
	private String orderstatus;
	private String username;
	private String usertel;
	private String paid;
	private String shipped;
	private String cancel;
	private int userno;
	
	private String userid;
	
	private int prodno;
	private String pname;
	private int price;
	private String size;
	private int amount;
	
	// 3) 페이지 구현을 위한 static 변수
    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
    	Order_List.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
    	Order_List.listCount = listCount;
    }
	
	
}
