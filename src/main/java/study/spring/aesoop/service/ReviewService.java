package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Review;

public interface ReviewService {
	

	
	/**
	 * 관리자 리뷰 조회
	 * @param Review 이미 담겨진 상품 수를 조회할 상품번호와 회원번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getReviewCount(Review input);
	
	/**
	 * 유저 리뷰 조회
	 * @param Review 이미 담겨진 상품 수를 조회할 상품번호와 회원번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getReviewCountUser(Review input);
	
	/**
	 * 리뷰 쓰기
	 * @param Review 리뷰를 저장할 상품번호와 회원번호를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int addReview(Review input) throws Exception;
	
	/**
	 * 리뷰 목록 조회
	 * @param Review 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Review> getReviewList(Review input) throws Exception;
	
	/**
	 * 마이페이지 리뷰 목록 조회
	 * @param Review 회원정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Review> getMyReivewList(Review input) throws Exception;
	
	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @param Order_List 회원정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getMyReviewCount(Review input) throws Exception;
	
	/**
	 * 리뷰 조회
	 * @param Review 조회할 리뷰의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Eception
	 */
	public Review getReviewItem(Review input) throws Exception;
	
	
	/**
	 * 리뷰 데이터 수정하기
	 * @param Review 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editReview(Review input) throws Exception;
	
	/**
	 * 리뷰 데이터 삭제하기
	 * @param Review 삭제할 리뷰의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deleteReview(Review input) throws Exception;
	
	public void deleteReview(String reviewno);
	
	public List<Review> getAdminReviewList(Review input) throws Exception;
}
