package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Order_List;
import study.spring.aesoop.service.MyOrderService;

@Service
@Slf4j
public class MyOrderServiceImpl implements MyOrderService{
	
	/** MyBatis */
	// import org.apache.ibatis.session.SqlSession;
	@Autowired SqlSession sqlSession;
	
	/**
	 * 주문 상세 조회
	 * @param Order_List 조회할 주문내역의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Eception
	 */
	@Override
	public Order_List getMyOrderItem(Order_List input) throws Exception {
		Order_List result = null;
		
		try {
			result = sqlSession.selectOne("MyOrderMapper.selectItem", input);
			
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
	 * 주문 제품 상세 목록 조회
	 * @param Order_List 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Order_List> getMyOrderProdList(Order_List input) throws Exception {
		List<Order_List> result = null;
		
		try {
			result = sqlSession.selectList("MyOrderMapper.selectProdList", input);
			
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
	 * 주문 목록 조회
	 * @param Order_List 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Order_List> getMyOrderList(Order_List input) throws Exception {
		List<Order_List> result = null;
		
		try {
			result = sqlSession.selectList("MyOrderMapper.selectList", input);
			
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
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @param Order_List 검색조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getMyOrderCount(Order_List input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MyOrderMapper.orderCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	

	/**
	 * 주문 데이터 수정하기
	 * @param Order_List 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int editMyOrder(Order_List input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("MyOrderMapper.updateItem", input);
			
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
	 * 주문 취소하기
	 * @param Order_List 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int cancelMyOrder(Order_List input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("MyOrderMapper.updateCancel", input);
			
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
}
