package study.spring.aesoop.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Outuser;
import study.spring.aesoop.model.User;
import study.spring.aesoop.service.UserService;


/**
 * @filename MembersServiceImpl.java
 * @author songs
 * @description 정의한 인터페이스에 대한 구현체
 */

@Service
@Slf4j
/** 회원 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// import study.spring.springhelper.service.ProfessorService;
public class UserServiceImpl implements UserService {
	
	/** MyBatis */
	// import org.apache.ibatis.session.SqlSession;
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원 데이터 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public User getUserItem(User input) throws Exception {
		User result = null;
		
		try {
			result = sqlSession.selectOne("UserMapper.userSelectItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 탈퇴 회원 데이터 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public User getOutUserItem(User input) throws Exception {
		User result = null;
		
		try {
			result = sqlSession.selectOne("UserMapper.outUserSelectItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 회원 데이터 목록 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public List<User> getUserList(User input) throws Exception {
		List<User> result = null;
		
		try {
			result = sqlSession.selectList("UserMapper.userSelectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 탈퇴 회원 데이터 목록 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public List<User> getOutUserList(User input) throws Exception {
		List<User> result = null;
		
		try {
			result = sqlSession.selectList("UserMapper.outUserSelectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 회원 데이터가 저장되어 있는 갯수 조회
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int getUserCount(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("UserMapper.userSelectCountAll", input);
		}  catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 탈퇴 회원 데이터가 저장되어 있는 갯수 조회
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int getOutUserCount(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("UserMapper.outUserSelectCountAll", input);
		}  catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 회원 데이터 등록하기 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	@Override
	public int addUserInfo(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UserMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원가입에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 관리자 회원 데이터 수정
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @retrun String
	 * @throws Exception
	 */
	@Override
	public int editAdminUser(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.adminUpdate", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 회원정보가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		}
		
		return result;
	}

	/**
	 * 회원 데이터(이름) 수정하기
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @retrun String
	 * @throws Exception
	 */
	@Override
	public int editUserNameInfo(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.updateNameItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 회원정보가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 회원 데이터(비번) 수정하기
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @retrun String
	 * @throws Exception
	 */
	@Override
	public int editUserPwInfo(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.updatePwItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("비밀번호가 다릅니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 회원 데이터(주소) 수정하기
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @retrun String
	 * @throws Exception
	 */
	@Override
	public int editUserAddrInfo(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.updateAddrItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 회원정보가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 탈퇴 회원 이유, 탈퇴일 등록하기
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	
	@Override
	public int addOutReason(Outuser input_rs) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UserMapper.outReasonItem", input_rs);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		}  catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("탈퇴 이유 저장에 실패했습니다.");
		}
		
		return result;
	} */

	/**
	 * 회원 탈퇴하기 (단, 회원이 탈퇴하더라도 해당 회원의 데이터를 삭제하지 않고
	 * is_out 컬럼의 데이터를 ‘Y’로, edit_date를 현재 시각으로 변경)
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public void doOut(User input) throws Exception {
		
		try {
			sqlSession.insert("UserMapper.outReasonItem", input);
			sqlSession.update("UserMapper.outItem", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("탈퇴된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원 탈퇴에 실패했습니다.");
		}
		
	}

	/**
	 * 로그인하기
	 * (단, is_out 컬럼의 데이터가 ‘Y’인 경우 가입되지 않은 회원으로 간주)
	 * @param User 아이디와 비밀번호를 담고 있는 Beans
	 * @return 아이디와 비밀번호가 동시에 일치하는 회원 데이터가 저장된 Beans
	 * @throws Eception
	 */
	@Override
	public User doLogin(User input) throws Exception {
		User result = null;
		
		try {
			//sqlSession.update("UserMapper.loginDateItem", input);
			result = sqlSession.selectOne("UserMapper.loginItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디 또는 비밀번호를 확인하세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 관리자 로그인하기
	 * (단, is_out 컬럼의 데이터가 ‘Y’인 경우 가입되지 않은 회원으로 간주)
	 * @param User 아이디와 비밀번호를 담고 있는 Beans
	 * @return 아이디와 비밀번호가 동시에 일치하는 회원 데이터가 저장된 Beans
	 * @throws Eception
	 */
	@Override
	public User doLoginAdmin(User input) throws Exception {
		User result = null;
		
		try {
			//sqlSession.update("UserMapper.loginDateItem", input);
			result = sqlSession.selectOne("UserMapper.adminLoginItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 회원이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 아이디 중복검사
	 * @param User id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int idChk(User input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("UserMapper.idChkItem", input);
			if (result == 1) {
				throw new NullPointerException("result=1");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("중복된 아이디가 존재합니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 비번 확인 검사
	 * @param User id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int pwChk(User input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("UserMapper.oldPwItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("비밀번호가 다릅니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 아이디 찾기
	 * @param User id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User idFind(User input) throws Exception {
		User result = null;
		try {
			result = sqlSession.selectOne("UserMapper.idFindItem", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이름과 이메일을 확인해주세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 비밀번호 찾기
	 * @param User id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int pwFind(User input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("UserMapper.pwFindItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디나 이메일을 확인해주세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 임시 비밀번호 변경
	 * @param User id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int pwUpItem(User input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("UserMapper.pwUpItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디나 이메일을 확인해주세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
}