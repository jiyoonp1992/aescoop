package study.spring.aesoop.service;

import java.util.List;

import study.spring.aesoop.model.Outuser;
import study.spring.aesoop.model.User;


/**
 * @filename MembersService.java
 * @author songs
 * @description 비즈니스 로직을 수행하기 위한 인터페이스
 */
public interface UserService {
	
	/**
	 * 회원 데이터 조회
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public User getUserItem(User input) throws Exception;
	
	/**
	 * 탈퇴 회원 데이터 조회
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public User getOutUserItem(User input) throws Exception;
	
	/**
	 * 회원 데이터 목록 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public List<User> getUserList(User input) throws Exception;
	
	/**
	 * 탈퇴 회원 데이터 목록 조회
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public List<User> getOutUserList(User input) throws Exception;
	
	/**
	 * 회원 데이터 갯수 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int getUserCount(User input) throws Exception;
	
	/**
	 * 탈퇴 회원 데이터 갯수 조회 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int getOutUserCount(User input) throws Exception;

	/**
	 * 회원 데이터 등록하기 (비밀번호는 암호화 처리. 이 때 is_out 컬럼에는 ‘N’을 기본값으로 저장)
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int addUserInfo(User input) throws Exception;
	
	/**
	 * 관리자 회원 데이터 수정하기
	 * @param Members 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editAdminUser(User input) throws Exception;
	
	/**
	 * 회원 데이터(이름) 수정하기
	 * @param Members 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editUserNameInfo(User input) throws Exception;
	
	/**
	 * 회원 데이터(비번) 수정하기
	 * @param Members 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editUserPwInfo(User input) throws Exception;
	
	/**
	 * 회원 데이터(주소) 수정하기
	 * @param Members 수정할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	 */
	public int editUserAddrInfo(User input) throws Exception;
	
	/**
	 * 회원 탈퇴하기 (단, 회원이 탈퇴하더라도 해당 회원의 데이터를 삭제하지 않고
	 * is_out 컬럼의 데이터를 ‘Y’로, edit_date를 현재 시각으로 변경)
	 * @param Members 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public void doOut(User input) throws Exception;
	
	/**
	 * 탈퇴 회원 이유, 탈퇴일 등록하기
	 * @param Members 저장할 정보를 담고 있는 Beans
	 * @retrun int
	 * @throws Exception
	
	public int addOutReason(Outuser input_rs) throws Exception; */
	
	/**
	 * 로그인하기
	 * (단, is_out 컬럼의 데이터가 ‘Y’인 경우 가입되지 않은 회원으로 간주)
	 * @param Members 아이디와 비밀번호를 담고 있는 Beans
	 * @return 아이디와 비밀번호가 동시에 일치하는 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User doLogin(User input) throws Exception;
	
	/**
	 * 관리자로그인하기
	 * (단, is_admint 컬럼의 데이터가 ‘Y’인 경우)
	 * @param Members 아이디와 비밀번호를 담고 있는 Beans
	 * @return 아이디와 비밀번호가 동시에 일치하는 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User doLoginAdmin(User input) throws Exception;
	
	/**
	 * 아이디 중복검사
	 * @param Members id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int idChk(User input) throws Exception;
	
	/**
	 * 아이디 찾기
	 * @param Members id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User idFind(User input) throws Exception;
	
	/**
	 * 비밀번호 찾기
	 * @param Members id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int pwFind(User input) throws Exception;
	
	/**
	 * 비번 중복검사
	 * @param Members id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int pwChk(User input) throws Exception;
	
	/**
	 * 임시 비밀번호 변경
	 * @param Members id를 담고 있는 Beans
	 * @return 회원 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public int pwUpItem(User input) throws Exception;
	
}
