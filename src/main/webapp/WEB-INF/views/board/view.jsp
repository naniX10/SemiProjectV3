<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 줄바꿈 기호를 변수로 생성 : br 태그로 변환 필요! --%>
<c:set var="newChar" value="
" scope="application" />


<div id="main">
    <div>
        <h1><i class="fas fa-comments"></i> 자유 게시판</h1>
        <hr>
    </div> <!-- 페이지 타이틀? -->
    <div>
        <div class="row">
            <div class="col-5 offset-1">
                <button type="button" class="btn btn-secondary">
                <i class="fas fa-chevron-left"></i> 이전게시물</button>

                <button type="button" class="btn btn-secondary">
                <i class="fas fa-chevron-right"></i> 다음게시물</button>
            </div>
            <div class="col-5 text-right">
                <c:if test="${not empty UID}">
                <button type="button" class="btn btn-secondary" id="newbdbtn">
                    <i class="fas fa-plus-circle"></i>&nbsp; 새글쓰기</button>
                </c:if>
            </div>
        </div><!-- 머리 -->
        <br>
        <div class="row">
            <table class="table col-10 offset-1">
                <tr class="tbbg1 text-center"><th colspan="2">
                    <h2>${bd.title}</h2>
                    </th></tr>
                <tr class="tbbg2">
                    <td style="width: 50%">${bd.userid}</td>
                    <td class="text-right">${bd.regdate} / ${bd.thumbup} / ${bd.views}</td></tr>
                <tr class="tbbg3 bdcsize"><td colspan="2">
                    ${fn:replace(bd.contents, newChar, "<br>")}
                    </td></tr>
            </table>
        </div><!-- 가슴 -->
        <div class="row">
            <div class="col-5 offset-1">
                <%--자신이 작성한 글 이외에는 보이면 안됨--%>
                <c:if test="${not empty UID and UID eq bd.userid}">
                    <button type="button" class="btn btn-warning text-white">
                    <i class="fas fa-edit"></i> 수정하기</button>

                    <button type="button" class="btn btn-danger">
                    <i class="fas fa-times-circle"></i> 삭제하기</button>
                </c:if>
            </div>
            <div class="col-5 text-right">
                <a href="/board/list">
                    <button type="button" class="btn btn-secondary" id="listbdbtn">
                        <i class="fas fa-list"></i>&nbsp; 목록으로</button></a>
            </div>
        </div><!-- 배 -->

    </div> <!-- 본문글 -->
    <br>
    <div>
        <div class="row">
            <h3 class="col-10 offset-1"><i class="far fa-comments"></i> 너도 한마디?</h3></div>
        <table class="table col-10 offset-1">
            <tr><td><h4>멍멍이</h4></td>
                <td><div class="cmtbg1">2021.05.21 11:11:11</div>
                <p>나도 먹고싶다</p></td></tr>
            <tr><td></td>
                <td><div class="cmtbg2">
                    <span>스팸</span>
                    <span class="pushright">2021.05.21 11:11:19</span></div>
                <p>나도 먹고싶다</p></td></tr>
            <tr><td><h4>멍멍이</h4></td>
                <td><div class="cmtbg1">2021.05.21 11:11:12</div>
                <p>나도 먹고싶다</p></td></tr>
            <tr><td><h4>멍멍이</h4></td>
                <td><div class="cmtbg1">2021.05.21 11:11:15</div>
                <p>나도 먹고싶다</p></td></tr>
            <tr><td><h4>멍멍이</h4></td>
                <td><div class="cmtbg1">2021.05.21 11:11:20</div>
                <p>나도 먹고싶다</p></td></tr>
        </table>
    </div> <!-- 댓글목록 -->
    <div>
        <div class="row">
            <form name="replyfrm" id="replyfrm"
                  class="card card-body bg-light col-10 offset-1">
                <div class="form-group row justify-content-center">
                    <label class="col-form-label col-2 pushdwn" for="reply">작성자</label>
                    <textarea class="form-control col-7" name="reply" id="reply" rows="5"></textarea>&nbsp;&nbsp;
                    <button class="btn btn-dark form-control col-2 pushdwn" type="button">
                        <i class="fas fa-comment-dots"></i> 댓글쓰기</button>
                </div>
            </form>
        </div>

    </div> <!-- 댓글쓰기 -->
</div>

<script>
    $('#newbdbtn').click(function() { location.href='/board/write.html'; })
</script>
<script>
    $('#joinbtn').click(function() { location.href='/join/agree.html'; })
</script>
<script>
    $('#listbdbtn').click(function() { location.href='/board/list.html'; })
</script>
