<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<script src="${pageContext.request.contextPath}/assets/js/footer.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

<div id="footer">
        <div class="panel">
            <div class="panel-heading">
                <a class="accordian-toggle full-size" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" id="btn1" >문의하기<div class="pointer"><img src="${pageContext.request.contextPath}/assets/img/footer_icon.png"></div></a>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul class="media-list">
                        <li class="media"><a href="${pageContext.request.contextPath}/ask/qna">
                                <div class="pull-left">문의하기</div>
                        </a></li>
                        <li class="media"><a href="${pageContext.request.contextPath}/ask/faqs">
                                <div class="pull-left">FAQS</div>
                        </a></li>
                        <li class="media"><a href="${pageContext.request.contextPath}/ask/tac">
                                <div class="pull-left">이용 약관</div>
                        </a></li>
                        <li class="media"><a href="${pageContext.request.contextPath}/ask/pipp">
                                <div class="pull-left">개인정보 정책</div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="panel-heading">
                <a class="accordian-toggle full-size" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" id="btn2" >브랜드 소개<div class="pointer"><img src="${pageContext.request.contextPath}/assets/img/footer_icon.png"></div></a>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul class="media-list">
                        <li class="media"><a href="${pageContext.request.contextPath}/ask/notice">
                                <div class="pull-left">공지사항</div>
                        </a></li>
                        <li class="media"><a href="${pageContext.request.contextPath}/read/story">
                                <div class="pull-left">브랜드 스토리</div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="panel-heading">
                <a class="accordian-toggle full-size" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" id="btn3" >소셜<div class="pointer"><img src="${pageContext.request.contextPath}/assets/img/footer_icon.png"></div></a>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul class="media-list">
                        <li class="media"><a href="https://www.instagram.com/aesoop__4/?hl=ko">
                                <div class="pull-left">Instagram<img src="${pageContext.request.contextPath}/assets/img/sns_icon.jpg"></div>
                        </a></li>
                        <li class="media"><a href="https://twitter.com/UqqJk2GZtvuxyrg">
                                <div class="pull-left">Twitter<img src="${pageContext.request.contextPath}/assets/img/sns_icon.jpg"></div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="cop-info">상호: 이숲코리아 유한회사 | 주소: 서초구 서초대로77길 55 에이프로스퀘어 3층
			| 대표자: 유정원, 박지윤, 최송이, 최승묵, 조현석, 김기헌 | 대표전화: 8282-8282
            | 호스팅 사업자: 이젠아이티아카데미학원<br>
            Copyright by aesoop All rights reserved.</div>
        <hr>
        <div id="copyright"><a href="${pageContext.request.contextPath}/admin">&copy;</a> 이숲
        <div class="portfolio_text">이 사이트는 학생들이 취업을 위해<br>제작한 포트폴리오 사이트입니다.<br>
추가 문의는 jiyoonp92@naver.com, songsong8040@gmail.com으로 부탁드립니다.</div></div>
    </div>