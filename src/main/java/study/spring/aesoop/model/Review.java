package study.spring.aesoop.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Review {
	private int reviewno; // 리뷰번호
	private int rate; // 별점
	private int prodno; // 리뷰번호
	private int userno; // 회원번호
	private String content; // 후기
	private String userid; // 아이디
	private int has_orderno;
	private String pname;
	

	// 3) 페이지 구현을 위한 static 변수
    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
    	Review.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
    	Review.listCount = listCount;
    }
}
