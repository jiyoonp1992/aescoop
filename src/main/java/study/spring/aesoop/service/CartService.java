package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Cart;

public interface CartService {
	
	
	/**
	 * 카트 제품 상세 목록 조회
	 * @param Cart 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Cart> getCartList(Cart input) throws Exception;
	
	/**
	 * 카트 제품 데이터 삭제하기
	 * @param Cart 삭제할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCart(Cart input) throws Exception;
	
	/**
	 * 카트 수정하기 (카트 → 주문)
	 * @param Cart 수정할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int UpdateCart(Cart input) throws Exception;
	
	/**
	 * 카트 주문번호 추가하기 (카트 → 주문)
	 * @param Cart 수정할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int updateCartOrderno(Cart input) throws Exception;
	
	/**
	 * 이미 담겨진 카트 수 조회하기
	 * @param Cart 이미 담겨진 상품 수를 조회할 상품번호와 회원번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getCartCount(Cart input);
	
	/**
	 * 카트 담기
	 * @param Cart 카트를 저장할 상품번호와 회원번호를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int addCartItem(Cart input) throws Exception;
	
	/**
	 * 리뷰 작성 전 배송완료 상태인지 확인
	 * @param Cart 배송완료된 상품인지를 확인하기 위한 회원번호와 상품번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getOrderComplete(Cart input2);
}
