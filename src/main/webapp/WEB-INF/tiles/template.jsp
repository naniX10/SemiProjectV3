<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!doctype html>
<html lang="ko">
    <head>

   <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
     <!-- Bootstrap icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <!-- user define CSS -->
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="/css/gallery.css">

    <!-- font awesome icons -->
    <script src="https://kit.fontawesome.com/968029ae0d.js" crossorigin="anonymous"></script>


    <title>semiprojectv2</title>

    </head>
    <body>
        <div class="container">
        
            <tiles:insertAttribute name="header" />

            <br>
            
            <tiles:insertAttribute name="main" />

            <br>
            
            <tiles:insertAttribute name="footer" />
            
        </div>


<!-- 로그인 폼 모달-->
<div class="modal" id="loginmodal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>로그인</h3>
                <button type="button" id="lgmbtn" class="btn btn-light">닫기</button>
            </div>

            <div class="modal-body">
                <form name="loginfrm" id="loginfrm" method="post">
                    <div class="form-group row text-danger">
                        <label class="col-form-label col-4 text-right"
                               for="userid">아이디</label>
                        <input type="text" id="userid" name="userid"
                               class="form-control col-5 border-danger">
                    </div>
                    <div class="form-group row text-danger">
                        <label class="col-form-label col-4 text-right"
                               for="userid">비밀번호</label>
                        <input type="password" id="passwd" name="passwd"
                               class="form-control col-5 border-danger">
                    </div>
                    <div class="form-group row">
                        <div class="col-4"></div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input">
                            <label class="form-check-label text-warning">로그인 상태 유지</label>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer justify-content-center">
                 <button type="button" class="btn btn-danger" id="loginbtn">
                     로그인</button>
                 <button type="button" class="btn btn-warning">
                     아이디/비밀번호 찾기</button>
            </div>
        </div>
    </div>
</div>



    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/js/join.js"></script>
    <script src="/js/board.js"></script>
    <script src="/js/pds.js"></script>
    <script src="/js/gallery.js"></script>

    <script>
        // findtype tag setting 검색한 조건 유지?표시?하기?
        $('#findtype').val('${param.findtype}').prop('selected', 'true');
    </script>

   </body>

</html>
