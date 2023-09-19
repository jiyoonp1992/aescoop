package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Qna;

/** Q&A 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface QnaService {
    /**
     * Q&A 데이터 상세 조회
     * @param Qna 조회할 Q&A의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Qna getQnaItem(Qna input) throws Exception;
    
    /**
     * Q&A 데이터 목록 조회
     * @param Qna 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Qna> getQnaList(Qna input) throws Exception;
    
    /**
     * Q&A 데이터가 저장되어 있는 갯수 조회
     * @param Qna 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getQnaCount(Qna input) throws Exception;
    
    /**
     * Q&A 데이터 등록하기
     * @param Qna 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addQna(Qna input) throws Exception;
    
    /**
     * Q&A 데이터 수정하기
     * @param Qna 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int editQna(Qna input) throws Exception;
    
    /**
     * Q&A 데이터 삭제하기
     * @param Qna 삭제할 Q&A의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteQna(Qna input) throws Exception;

	public void deleteQna(String qnano);
    
}