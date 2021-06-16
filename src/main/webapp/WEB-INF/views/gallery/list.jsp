<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="thumbURL" value="http://localhost/thumb/" />

<div id="main">
	 <div>
	     <i class="fas fa-image fa-2x"> 갤러리</i>
	     <hr> <!-- 페이지 타이틀? -->
	 </div>
	 <div class="row">
	     <div class="col-5 offset-1"></div>
	     <div class="col-5 text-right">
	         <button type="button" id="newgalbtn" name="newgalbtn"
					 class="btn btn-secondary">
				 <i class="fas fa-images"></i>사진올리기</button>
	     </div>
	 </div>
	 <br>
	 <div class="row">
	     <div class="col-12">
	     <ul class="list-inline moveright">
			 <c:forEach var="g" items="${gals}">
	         <li class="list-inline-item pushdown">
	             <div class="card cdwide">
	                 <img class="imgsize card-img-top"
	                      onclick="showimg('${g.gno}');"
						  src="${thumbURL}small_${g.gno}_${uuid}${fn:split(g.fnames,"[/]")[0]}">
	                 <div class="card-body">
	                     <h5 class="card-title">${g.title}</h5>
	                     <p class="card-text">${g.userid}
	                         <span class="pushright">
									 ${fn:substring(g.regdate, 0, 10)}</span></p>
	                     <p class="card-text">
	                         <i class="far fa-eye"></i> ${g.views}
	                         <span class="pushright">
	                         <i class="far fa-thumbs-up"></i> ${g.thumbup}
	                         </span>
	                     </p>
	                 </div><!-- cardbody -->
	             </div><!-- card -->
	         </li>

	         </li>
			 </c:forEach>
	     </ul>
	     </div><!-- 이미지 리스트 -->
	
	 </div>
	 <br>
	 <div class="row">
	     <div class="col-12">
	         <ul class="pagination justify-content-center">
	             <li class="page-item"><a href=# class="page-link">이전</a></li>
	
	             <li class="page-item active"><a class="page-link">1</a></li>
	             <li class="page-item"><a href=# class="page-link">2</a></li>
	             <li class="page-item"><a href=# class="page-link">3</a></li>
	             <li class="page-item"><a href=# class="page-link">4</a></li>
	             <li class="page-item"><a href=# class="page-link">5</a></li>
	             <li class="page-item"><a href=# class="page-link">6</a></li>
	             <li class="page-item"><a href=# class="page-link">7</a></li>
	             <li class="page-item"><a href=# class="page-link">8</a></li>
	             <li class="page-item"><a href=# class="page-link">9</a></li>
	             <li class="page-item"><a href=# class="page-link">10</a></li>
	
	             <li class="page-item"><a href=# class="page-link">다음</a></li>
	         </ul>
	     </div>
	 </div><!-- 페이지 네이션 -->
	</div>