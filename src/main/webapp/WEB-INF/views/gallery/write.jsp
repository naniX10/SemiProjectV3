<%@ page pageEncoding="UTF-8"%>

<script src="https://www.google.com/recaptcha/api.js"></script>

<div id="main">
    <div>
        <i class="fas fa-image fa-2x"> 갤러리</i>
        <hr> <!-- 페이지 타이틀? -->
    </div>
    <div class="row">
        <div class="col-5 offset-1"><h3><i class="fas fa-plus-circle"> 새글쓰기</i></h3></div>
        <div class="col-5 text-right">
            <button type="button" class="btn btn-secondary"><i class="fas fa-list"></i>&nbsp; 목록으로</button>
        </div>
    </div>

    <div class="card card-body bg-light col-10 offset-1">
        <form id="boardfrm" name="boardfrm">

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="title">제목</label>
                        <input type="text" name="title" id="title" class="form-control border-danger col-9">
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="userid">작성자</label>
                        <input type="text" name="userid" id="userid" class="form-control border-danger col-9" readonly>
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="content">본문내용</label>
                        <textarea class="form-control border-danger col-9" name="contents" id="contents" rows = "15"></textarea>
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right" for="file1">파일첨부</label>
                        <div class="custom-file col-9">
                            <input type="file" name="file" id="file1" class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                        </div>
                        <div class="custom-file col-9 offset-2">
                            <input type="file" name="file" id="file2" class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                        </div>
                        <div class="custom-file col-9 offset-2">
                            <input type="file" name="file" id="file3" class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-danger text-right">자동<br>입력방지</label>
                        <div class="g-recaptcha" 
				   		data-sitekey="6LfdIwgbAAAAAGZdSMWuY4f3zaKP-dIuhTMUrU8_"></div>
				   		<input type="hidden" id="g-recaptcha" name="g-recaptcha" />
                    </div>


            <div class="form-group row">
                <hr class=col-10>
            <div class="col-12 text-center">
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-check-circle"></i> 입력완료</button>
                <button type="button" class="btn btn-danger">
                    <i class="fas fa-times-circle"></i> 입력취소</button>
            </div>
        </div><!-- 버튼들 -->

        </form>

    </div>

</div>