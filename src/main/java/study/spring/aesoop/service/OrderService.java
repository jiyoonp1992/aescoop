package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Order_List;

/**
 * @filename OrderService.java
 * @description 비즈니스 로직을 수행하기 위한 인터페이스
 */
public interface OrderService {
	
	/**
	 * 주문 상세 조회
	 * @param Order_List 조회할 주문내역의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Eception
	 */
	public Order_List getOrderItem(Order_List input) throws Exception;
	
	/**
	 * 주문 제품 상세 목록 조회
	 * @param Order_List 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order_List> getOrderProdList(Order_List input) throws Exception;
	
	/**
	 * 주문 목록 조회
	 * @param Order_List 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order_List> getOrderList(Order_List input) throws Exception;
	
	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @param Order_List 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getOrderCount(Order_List input) throws Exception;
	
	/**
	 * 주문 데이터 등록하기
	 * @param Order_List 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int addOrder(Order_List input) throws Exception;
	
	/**
	 * 주문 데이터 수정하기
	 * @param Order_List 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editOrder(Order_List input) throws Exception;
	
	/**
	 * 날짜 업데이트 하기
	 * @param Order_List 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int addDate(Order_List input) throws Exception;
	
	/**
	 * 주문 데이터 삭제하기
	 * @param Order_List 삭제할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public void deleteOrder(String orderno);
}
