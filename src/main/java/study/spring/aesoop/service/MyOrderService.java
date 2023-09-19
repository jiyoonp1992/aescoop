package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Order_List;

/**
 * @filename MyOrderService.java
 * @description 비즈니스 로직을 수행하기 위한 인터페이스
 */
public interface MyOrderService {
	
	/**
	 * 주문 상세 조회
	 * @param Order_List 조회할 주문내역의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Eception
	 */
	public Order_List getMyOrderItem(Order_List input) throws Exception;
	
	/**
	 * 주문 제품 상세 목록 조회
	 * @param Order_List 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order_List> getMyOrderProdList(Order_List input) throws Exception;
	
	/**
	 * 주문 목록 조회
	 * @param Order_List 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order_List> getMyOrderList(Order_List input) throws Exception;
	
	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @param Order_List 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getMyOrderCount(Order_List input) throws Exception;
	
	
	/**
	 * 주문 데이터 수정하기
	 * @param Order_List 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editMyOrder(Order_List input) throws Exception;
	
	/**
	 * 주문 취소하기
	 * @param Order_List 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int cancelMyOrder(Order_List input) throws Exception;
	
}
