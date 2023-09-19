package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Cart;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.CartService;


@Service
@Slf4j
public class CartServiceImpl implements CartService{
	
	@Autowired SqlSession sqlSession;
	
	/**
	 * 카트 목록 조회
	 * @param Cart 조회할 카트의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public List<Cart> getCartList(Cart input) throws Exception {
		
		List<Cart> result = null;
		
		
		try {
			result = sqlSession.selectList("CartMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다");
		}
				
		return result;
	}


	/**
	 * 카트 데이터 삭제하기
	 * @param Cart 삭제할 카트의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CartMapper.deleteCart", input);
			
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
	public int UpdateCart(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CartMapper.updateCart", input);
			
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
	public int updateCartOrderno(Cart input) throws Exception {
		
		int result = 0;
		
		try {
			result = sqlSession.update("CartMapper.updateCart2", input);
			if(result == 0) {
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

	/**
	 * 이미 담겨진 카트 수 조회하기
	 * @param Cart 이미 담겨진 상품 수를 조회할 상품번호와 회원번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCartCount(Cart input) {
		int result = 0;
		
		result = sqlSession.selectOne("CartMapper.selectCartCount", input);

		
		return result;
	}
	
	/**
	 * 카트 담기
	 * @param Cart 카트를 저장할 상품번호와 회원번호를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int addCartItem(Cart input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CartMapper.addCartItem", input);
			
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
	 * 리뷰 작성 전 배송완료 상태인지 확인
	 * @param Cart 배송완료된 상품인지를 확인하기 위한 회원번호와 상품번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getOrderComplete(Cart input2) {
		int result = 0;
		
		result = sqlSession.selectOne("CartMapper.getOrderCount", input2);
		
		return result;
	}
	
}
