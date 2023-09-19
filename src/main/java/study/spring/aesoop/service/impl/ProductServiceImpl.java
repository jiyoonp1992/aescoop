package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Product;
import study.spring.aesoop.service.ProductService;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	
	/** MyBatis */
	// import org.apache.ibatis.session.SqlSession;
	@Autowired SqlSession sqlSession;
	
	/**
	 * 제품 조회
	 * @param Product 조회할 주문내역의 일련번호를 담고 있는 Beans
	 * @return 조회할 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Product getProductItem(Product input) throws Exception {
		Product result = null;
		
		try {
			result = sqlSession.selectOne("ProductMapper.getProductItem", input);
			
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
	 * 관리자 제품 상세 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Product> getProductList(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectList", input);
			
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
	 * 관리자 제품 갯수 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public int getProductCount(Product input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductMapper.productCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	

	/**
	 * 관리자 제품 데이터 수정하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editProduct(Product input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("ProductMapper.editProduct", input);
			
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
	 * 관리자 제품 데이터 생성하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addProduct(Product input) throws Exception {
		
		int result = 0;
		
		try {
			result = sqlSession.update("ProductMapper.addProduct", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}
	
	
	/**
	 * 관리자 제품 삭제하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteProduct(Product input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("ProductMapper.deleteProduct", input);
			
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
	
	
	/**
	 * 관리자 주문 다중 삭제하기
	 * @param Order_List 삭제할 주문 정보의 일련번호를 담고 있는 Beans
	 * @return String
	 * @throws Exception
	 */
	@Override
	public void deleteProducts(String no) {
		int prodno = Integer.parseInt(no);
		sqlSession.update("ProductMapper.unsetProduct1", prodno);
		sqlSession.update("ProductMapper.unsetProduct2", prodno); 
		sqlSession.delete("ProductMapper.deleteItem", prodno);

	}

	/**
	 * 유저페이지 제품 상세 목록 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Product> getUserProductList(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.getUserProductList", input);
			
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
	 * 제품 슬라이드 조회
	 * @param Product 제품 조회를 위한 일련번호를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Product> getProdSlide(Product input) {
		List<Product> result = null;
		
		result = sqlSession.selectList("ProductMapper.selectSlide", input);
		
		return result;
	}

}
