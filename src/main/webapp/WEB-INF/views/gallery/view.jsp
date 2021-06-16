<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="fnames" value="${fn:split(g.fnames, '[/]')}" />
<c:set var="fsizes" value="${fn:split(g.fsizes, '[/]')}" />
<c:set var="baseURL" value="http://localhost/cdn/" />

    <div id="main">
        <div>
            <i class="fas fa-image fa-2x"> 갤러리</i>
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
                    <button type="button" class="btn btn-secondary" id="newgalbtn">
                        <i class="fas fa-plus-circle"></i>&nbsp; 사진 올리기</button>
                </div>
            </div><!-- 머리 -->
            <br>
            <div class="row">
                <table class="table col-10 offset-1">
                    <tr class="tbbg1 text-center"><th colspan="2">
                        <h2>${g.title}</h2>
                        </th></tr>
                    <tr class="tbbg2">
                        <td style="width: 50%">${g.userid}</td>
                        <td class="text-right">${g.regdate} / ${g.thumbup} / ${g.views}</td></tr>
                    <tr class="tbbg3"><td colspan="2">
                            <c:forEach var="f" items="${fnames}">
                            <c:set var="pos" value="${fn:indexOf(f, '.')}" />
                            <c:set var="fname" value="${fn:substring(f, 0, pos)}" />
                            <c:set var="fext"
                                   value="${fn:substring(f, pos+1, fn:length(f))}" />
                            <div>
                                <img src="${baseURL}${fname}${g.uuid}.${fext}"
                                     class="img-fluid">
                            </div>
                            </c:forEach>
                        </td></tr>
                    <c:forEach begin="0" end="${fn:length(fnames) - 1}" var="i">
                        <tr>
                            <td colspan="2" class="tbbg4">
                            <i class="far fa-file-image"></i>
                                ${fnames[i]} (${fsizes[i]}Byte)</td>
                        </tr>
                    </c:forEach>
                </table>
            </div><!-- 가슴 -->
            <div class="row">
                <div class="col-5 offset-1">
                    <button type="button" class="btn btn-warning text-white">
                    <i class="fas fa-edit"></i> 수정하기</button>

                    <button type="button" class="btn btn-danger">
                    <i class="fas fa-times-circle"></i> 삭제하기</button>
                </div>
                <div class="col-5 text-right">
                    <button type="button" class="btn btn-secondary" id="galistbtn">
                        <i class="fas fa-list"></i>&nbsp; 목록으로</button>
                </div>
            </div><!-- 배 -->

        </div> <!-- 본문글 -->
        <br>
        <div>
            <div class="row">
                <h3 class="col-10 offset-1"><i class="far fa-comments"></i> 너도 한마디?</h3></div>
            <table class="table col-10 offset-1">
                <tr><td><h4>야옹이</h4></td>
                    <td><div class="cmtbg1">2021.05.21 11:11:11</div>
                    <p>진짜 외않뒈는거레? </p></td></tr>
            </table>
        </div> <!-- 댓글목록 -->

    </div>

