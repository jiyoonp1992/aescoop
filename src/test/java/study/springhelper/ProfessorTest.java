package study.springhelper;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.aesoop.model.Notice;
import study.spring.aesoop.model.Product;
import study.spring.aesoop.model.User;

/** 다중행 조회 테스트 */
/** Lombok의 Log4j 객체 */
//import lombok.extern.slf4j.Slf4j;
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class ProfessorTest {

   //MyBatis의 SQL세션 주입 설정
   //import org.springframework.beans.factory.annotation.Autowired;
   @Autowired
   private SqlSession sqlSession;
         
   //데이터 저장 테스트
   
@Test
   public void testA() {
      
      User input = new User();
      input.setUserid("admin[00]");
      input.setUserpw("123");
      input.setUsername("박박박");
      input.setUsermail("sdasd@naver.com");
      input.setUsertel("010-0000-0001");
      input.setBirthdate("2020-01-01");
      sqlSession.insert("UserMapper.insertItem", input);
      }
   
@Test
   public void testB() {
      User input = new User();
      input.setUserno(1);
      input.setUserpw("123123");
      sqlSession.update("UserMapper.updatePwItem", input);
   }

@Test
public void testC() {
   User input = new User();
   input.setUserid("admin[00]");
   input.setUserpw("123123");
   sqlSession.selectOne("UserMapper.loginItem", input);
}

@Test
public void testD() {
	User input = new User();
	input.setUserno(1);
	sqlSession.update("UserMapper.outItem", input);
}

@Test
public void testE() {
	Product input = new Product();
	input.setSubcateno(11);
	input.setPname("향수");
	input.setContent("이렇게 하기");
	input.setPrice(10000);
	input.setSize("100mL");
	input.setStock(100);
	input.setFile("skfj");
	input.setSkintype("건성");
	input.setFeels("상쾌한");
	input.setAmount("100");
	input.setTexture("우드");
	input.setIngredient("허브");
	input.setScent("");
	input.setDirections("");
	input.setIs_view("Y");
	sqlSession.insert("ProductMapper.addProduct", input);
}

@Test
public void testF() {
	Product input = new Product();
	input.setProdno(11);
	input.setSubcateno(11);
	input.setPname("향수");
	input.setContent("이렇게 하기");
	input.setPrice(10000);
	input.setSize("100mL");
	input.setStock(100);
	input.setFile("skfj");
	input.setSkintype("건성");
	input.setFeels("상쾌한");
	input.setAmount("100");
	input.setTexture("우드");
	input.setIngredient("허브");
	input.setScent("");
	input.setDirections("");
	input.setIs_view("Y");
//	input.getFile2();
	sqlSession.update("ProductMapper.editProduct", input);
}

@Test
public void testG() {
	Product input = new Product();
	input.setProdno(24);
	sqlSession.delete("ProductMapper.deleteItem", input);
}

@Test
public void testH() {
	Notice input = new Notice();
	input.setTitle("안녕");
	input.setContent("이런 내용입니다.");
	sqlSession.insert("NoticeMapper.insertItem", input);
}

@Test
public void testI() {
	Notice input = new Notice();
	input.setNotino(1);
	input.setTitle("안녕");
	input.setContent("안녕하세요2");
	sqlSession.update("NoticeMapper.updateItem", input);
}

@Test
public void testJ() {
	Notice input = new Notice();
	input.setNotino(4);
	sqlSession.delete("NoticeMapper.deleteItem", input);
}


}