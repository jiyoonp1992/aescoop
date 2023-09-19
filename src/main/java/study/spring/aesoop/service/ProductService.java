package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Product;


/**
 * @filename ProductService.java
 * @description 비즈니스 로직을 수행하기 위한 인터페이스
 */
public interface ProductService {
	
	/**
	 * 관리자 제품 조회
	 * @param Product 조회할 주문내역의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Product getProductItem(Product input) throws Exception;
	
	/**
	 * 관리자 제품 상세 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getProductList(Product input) throws Exception;
	
	/**
	 * 관리자 제품 갯수 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public int getProductCount(Product input) throws Exception;

	/**
	 * 관리자 제품 데이터 생성하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProduct(Product input) throws Exception;
	
	/**
	 * 관리자 제품 데이터 수정하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProduct(Product input) throws Exception;
	
	/**
	 * 관리자 주문 취소하기
	 * @param Order_List 삭제할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteProduct(Product input) throws Exception;
	
	/**
	 * 관리자 주문 다중 삭제하기
	 * @param Order_List 삭제할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return String
	 * @throws Exception
	 */
	public void deleteProducts(String prodno);
	
	/**
	 * 유저페이지 제품 상세 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getUserProductList(Product input) throws Exception;
	
	
	/**
	 * 제품 슬라이드 조회
	 * @param Product 제품 조회를 위한 일련번호를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getProdSlide(Product input);

}
