<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--
데이터가 너무 많아서 한페이지에 모든 것을 출력하기 어려운 경우
페이징을 이용해서 전체 데이터를 일정한 범위로 나누고
특정범위의 데이터만 출력하는 것이 효율적임

ex)총 데이터 수 :100 한 페이지 당 추력할 게시글 수 : 25
>> 총 페이지수 : 5
-->

<!--
게시판 네비게이션
현재 페이지에 따라 보여줄 페이지 블럭을 결정

ex) 총 페이지 수가 27 일때

cp = 1 : 1 ~ 10 까지 나옴
cp = 5 : 1 ~ 10 까지 나옴
cp = 11 : 11 ~ 20 까지 나옴
cp = 25 : 21 ~ 27 까지 나옴
따라서 cp 에 따라 페이지 블럭의 시작값을 계산
perpage = 30
startpage = (( cp - 1 ) / 10 ) * 10 + 1
endpage = startpage + 9
-->

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="sp" value="${ (cp - 1) / 10 }" integerOnly="true" />
<fmt:parseNumber var="sp" value="${ sp * 10 + 1 }" />
<fmt:parseNumber var="ep" value="${sp + 9}" />

<!-- 총게시물 수를 페이지당 게시물 수로 나눔 > 총 페이지수 -->
<fmt:parseNumber var="tp" value="${bdcnt / 30}" integerOnly="true" />
<c:if test="${(bdcnt % 30) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<%-- 글번호 --%>
<fmt:parseNumber var="snum" value="${bdcnt -  (cp - 1) * 30}" />


<%--페이지 링크 : 검색기능 x--%>
<c:set var = "pglink" value="/board/list?cp=" />

<%-- 검색 링크 : 검색기능 o --%>
<c:if test="${not empty param.findkey}">
    <c:set var = "pglink"
           value="/board/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>

<div class="container">

<div id="main">
    <div>
        <h1><i class="fas fa-comments"></i> ${tp} / ${bdcnt} 자유 게시판</h1>
        <hr> <!-- 페이지 타이틀? -->
    </div>
    <div class="row">
        <div class="col-5 offset-1">
            <div class="form-group row">
                <select class="form-control col-3 border-primary"
                        name="findtype" id="findtype">
                    <option value="title">제목</option>
                    <option value="contents">내용</option>
                    <option value="titcont">제목+내용</option>
                    <option value="userid">작성자</option>
                </select>&nbsp;
                <input type="text" name="findkey" id="findkey"
                       class="form-control col-4 border-primary"
                        value="${param.findkey}">&nbsp;
                <button type="button" id="findbtn" class="btn btn-primary">
                    <i class="fas fa-search"></i> 검색</button>
            </div>
        </div>
        <div class="col-5 text-right">
        <c:if test="${not empty UID}">
        <button type="button" class="btn btn-secondary" id="newbdbtn">
            <i class="fas fa-plus-circle"></i>&nbsp; 새글쓰기</button>
        </c:if>
        </div>
    </div>
    <div class="row">
        <div class="col-10 offset-1">
            <table class="table table-striped text-center table-hover">
                <thead style="background: #dff0d8">
                    <tr>
                        <th style="width: 7%">번호</th>
                        <th>제목</th>
                        <th style="width: 12%">작성자</th>
                        <th style="width: 10%">작성일</th>
                        <th style="width: 7%">추천</th>
                        <th style="width: 7%">조회</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="text-danger">
                        <th>공지</th>
                        <th><span class="badge badge-danger">Hot
                        </span>아쿠아맨 12월 대개봉</th>
                        <th>운영자</th>
                        <th>2021.01.01</th>
                        <th>11</th>
                        <th>111</th>
                    </tr>

                    <c:forEach var="bd" items="${bds}">
                    <tr>
                        <td>${snum}</td>
                        <td><a href="/board/view?bdno=${bd.bdno}">${bd.title}</a></td>
                        <td>${bd.userid}</td>
                        <td>${fn:substring(bd.regdate,0,10)}</td>
                        <td>${bd.thumbup}</td>
                        <td>${bd.views}</td>
                        <c:set var="snum" value="${snum - 1}" />
                    </tr>
                    </c:forEach>


                </tbody>
            </table>
        </div>

    </div>
    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">

                <!-- 이전 버튼이 작동되야 할때는 sp가 11보다 클때 -->
                <li class="page-item <c:if test="${sp lt 11}"> disabled </c:if>" >
                    <a href="${pglink}${sp-10}" class="page-link">이전</a></li>

                <!-- 반복문을 이용해서 페이지 링크 생성 -->
                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <!-- 표시하는 페이지 i 가 총 페이지 수 보다 작거나 같을 동안만 출력 -->
                    <c:if test="${i le tp}">
                        <c:if test="${i eq cp}">
                        <li class="page-item active">
                            <a href="${pglink}${i}" class="page-link">${i}</a></li>
                        </c:if>

                        <c:if test="${i ne cp}">
                        <li class="page-item">
                            <a href="${pglink}${i}" class="page-link">${i}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>


                <!-- 이전 버튼이 작동되야 할때는 sp가 11보다 작을때 -->
                <li class="page-item <c:if test="${ep gt tp}"> disabled </c:if>">
                    <a href="${pglink}${sp+10}" class="page-link">다음</a></li>

            </ul>
        </div>
    </div><!-- 페이지 네이션 -->


</div>


</div>


</body>

</html>