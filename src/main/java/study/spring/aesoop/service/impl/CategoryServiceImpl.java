package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Category;
import study.spring.aesoop.service.CategoryService;

/** 게시물 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// --> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class CategoryServiceImpl implements CategoryService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

    /**
     * 게시물 데이터 상세 조회
     * @param Category 조회할 게시물의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Category getCategoryItem(Category input) throws Exception {
        Category result = null;

        try {
            result = sqlSession.selectOne("CategoryMapper.selectItem", input);

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
     * 게시물 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Category> getCategoryList(Category input) throws Exception {
        List<Category> result = null;

        try {
            result = sqlSession.selectList("CategoryMapper.selectList", input);

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
     * 게시물 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    @Override
    public int getCategoryCount(Category input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("CategoryMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }
    
    
//    /**
//     * 멀티드롭다운 서브카테고리명 조회
//     * @param Category 검색조건을 담고 있는 Beans
//     * @return 조회 결과에 대한 컬렉션
//     * @throws Exception
//     */
//	@Override
//	public List<Category> getSubCategory(Category input) throws Exception {
//		List<Category> result = null;
//
//        try {
//            result = sqlSession.selectList("CategoryMapper.selectSubCategory", input);
//
//            if (result == null) {
//                throw new NullPointerException("result=null");
//            }
//        } catch (NullPointerException e) {
//            log.error(e.getLocalizedMessage());
//            throw new Exception("조회된 데이터가 없습니다.");
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            throw new Exception("데이터 조회에 실패했습니다.");
//        }
//
//        return result;
//	}

	/**
	 * 유저페이지 제품 상세 목록 카테고리 조회
	 * @param Product 검색조건과 페이지 구현 정보를 담고 있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Category> getUserListCate(Category input) throws Exception {
		List<Category> result = null;
		
		try {
			result = sqlSession.selectList("CategoryMapper.selectSubCategory2", input);
			
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