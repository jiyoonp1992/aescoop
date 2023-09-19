package study.spring.aesoop.model;



import java.util.Date;

import lombok.Data;

@Data
public class Notice {

	private int notino;
	private String title;
	private String content;
	private int view;
	private String date;
	private String file;

	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Notice.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Notice.listCount = listCount;
	}
}
