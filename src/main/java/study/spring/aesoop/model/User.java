package study.spring.aesoop.model;

import lombok.Data;

@Data
public class User {
	
	private int userno;
    private String userid;
    private String userpw;
    private String username;
    private String usermail;
    private String usertel;
    private String birthdate;
    private String regdate;
    private String postno;
    private String address1;
    private String address2;
    private String address3;
    private String is_admin;
    private String is_out;
    

    // 2) 조인절
    private String reason;
    private String outdate;

	// 3) 페이지 구현을 위한 static 변수
    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
    	User.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
    	User.listCount = listCount;
    }
}
