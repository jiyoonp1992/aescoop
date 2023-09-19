package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Category;

/** 게시물 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface CategoryService {
    /**
     * 게시물 데이터 상세 조회
     * @param Category 조회할 게시물의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Category getCategoryItem(Category input) throws Exception;
    
    /**
     * 게시물 데이터 목록 조회
     * @param Category 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Category> getCategoryList(Category input) throws Exception;
    
    /**
     * 게시물 데이터가 저장되어 있는 갯수 조회
     * @param Category 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getCategoryCount(Category input) throws Exception;
    
//    /**
//     * 멀티드롭다운 서브카테고리명 조회
//     * @param Category 검색조건을 담고 있는 Beans
//     * @return 조회 결과에 대한 컬렉션
//     * @throws Exception
//     */
//    public List<Category> getSubCategory(Category input) throws Exception;
    
    
    /**
	 * 유저페이지 제품 상세 목록 카테고리 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Category> getUserListCate(Category input2) throws Exception;
	
}