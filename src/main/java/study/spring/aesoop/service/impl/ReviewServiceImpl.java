package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Review;
import study.spring.aesoop.service.ReviewService;



@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired SqlSession sqlSession;

	/**
	 * 관리자 유저 조회
	 * @param Review 이전에 주문한 횟수를 조회할 상품번호와 회원번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getReviewCount(Review input) {
		int result = 0;
		
		result = sqlSession.selectOne("ReviewMapper.ReviewCount", input);
		
		return result;
	}
	
	/**
	 * 유저 리뷰 조회
	 * @param Review 이전에 주문한 횟수를 조회할 상품번호와 회원번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getReviewCountUser(Review input) {
		int result = 0;
		
		result = sqlSession.selectOne("ReviewMapper.reviewCountUser", input);
		
		return result;
	}
	
	
	/**
	 * 리뷰 쓰기
	 * @param Review 리뷰를 저장할 상품번호와 회원번호를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int addReview(Review input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("ReviewMapper.addReviewItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("카트담기에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 리뷰 목록 조회
	 * @param Review 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Review> getReviewList(Review input) throws Exception {
		List<Review> result = null;
		
		try {
			result = sqlSession.selectList("ReviewMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	
	/**
	 * 마이페이지 리뷰 목록 조회
	 * @param Review 회원정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Review> getMyReivewList(Review input) throws Exception {
		List<Review> result = null;
		
		try {
			result = sqlSession.selectList("ReviewMapper.selectMyList", input);
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 리뷰 데이터가 저장되어 있는 갯수 조회
	 * @param Review 회원정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getMyReviewCount(Review input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.getMyCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("카트담기에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 리뷰 조회
	 * @param Review 조회할 리뷰의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Eception
	 */
	@Override
	public Review getReviewItem(Review input) throws Exception {
		Review result = null;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectReviewItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 리뷰 데이터 수정하기
	 * @param Review 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int editReview(Review input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("ReviewMapper.updateItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 리뷰 데이터 삭제하기
	 * @param Review 삭제할 리뷰의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteReview(Review input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("ReviewMapper.delReview", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public void deleteReview(String no) {
		int reviewno = Integer.parseInt(no);
		sqlSession.delete("ReviewMapper.delReview", reviewno);
	}
	
	/**
	 * 리뷰 데이터 수정하기
	 * @param Review 관리자 페이지에서 정보를 담고 있는 Beans
	 * @retrun 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Review> getAdminReviewList(Review input) throws Exception {
		List<Review> result = null;
		
		try {
			result = sqlSession.selectList("ReviewMapper.selectAdminReview", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

}
