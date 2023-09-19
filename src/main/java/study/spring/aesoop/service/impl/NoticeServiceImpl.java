package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Notice;
import study.spring.aesoop.service.NoticeService;

/** 게시물 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// --> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

    /**
     * 게시물 데이터 상세 조회
     * @param Notice 조회할 게시물의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Notice getNoticeItem(Notice input) throws Exception {
        Notice result = null;

        try {
        	sqlSession.selectOne("NoticeMapper.ViewCount", input);
            result = sqlSession.selectOne("NoticeMapper.selectItem", input);

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
    public List<Notice> getNoticeList(Notice input) throws Exception {
        List<Notice> result = null;

        try {
            result = sqlSession.selectList("NoticeMapper.selectList", input);

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
    public int getNoticeCount(Notice input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("NoticeMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

    /**
     * 게시물 데이터 등록하기
     * @param Notice 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int addNotice(Notice input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("NoticeMapper.insertItem", input);

            if (result == 0) {
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
     * 게시물 데이터 수정하기
     * @param Notice 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int editNotice(Notice input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("NoticeMapper.updateItem", input);

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
     * 게시물 데이터 삭제하기
     * @param Notice 삭제할 게시물의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int deleteNotice(Notice input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("NoticeMapper.deleteItem", input);

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
	public void deleteNotice(String no) {
		int notino = Integer.parseInt(no);
		sqlSession.delete("NoticeMapper.deleteItem", notino);
		
	}
}