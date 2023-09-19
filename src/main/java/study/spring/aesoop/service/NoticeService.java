package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Notice;

/** 게시물 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface NoticeService {
    /**
     * 게시물 데이터 상세 조회
     * @param Notice 조회할 게시물의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Notice getNoticeItem(Notice input) throws Exception;
    
    /**
     * 게시물 데이터 목록 조회
     * @param Notice 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Notice> getNoticeList(Notice input) throws Exception;
    
    /**
     * 게시물 데이터가 저장되어 있는 갯수 조회
     * @param Notice 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getNoticeCount(Notice input) throws Exception;
    
    /**
     * 게시물 데이터 등록하기
     * @param Notice 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addNotice(Notice input) throws Exception;
    
    /**
     * 게시물 데이터 수정하기
     * @param Notice 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int editNotice(Notice input) throws Exception;
    
    /**
     * 게시물 데이터 삭제하기
     * @param Notice 삭제할 게시물의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteNotice(Notice input) throws Exception;
    
    public void deleteNotice(String notino);
    
}