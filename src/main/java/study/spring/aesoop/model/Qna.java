package study.spring.aesoop.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Qna {
 
    private int qnano;
    private String email;
    private String tel;
    private String username;
    private String title;
    private String content;
    private String memo;
    private String file;
    private static int offset;
	private static int listCount;
	private String date;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Qna.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Qna.listCount = listCount;
	}
}