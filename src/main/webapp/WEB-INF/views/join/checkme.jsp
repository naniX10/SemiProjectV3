<%@ page pageEncoding="UTF-8"%>


<div id="main">
    <div>
        <i class="fas fa-users fa-2x"> 회원가입</i>
        <hr>
    </div><!-- 페이지 타이틀 -->

    <nav>
        <ul class="breadcrumb">
            <li class="breadcrumb-item active">
                <button type="button" disabled class="btn btn-success">이용약관</button></li>
            <li class="breadcrumb-item active">
                <button type="button" disabled class="btn btn-success">가입인증</button></li>
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">정보입력</button></li>
            <li class="breadcrumb-item">
                <button type="button" disabled class="btn btn-light">가입완료</button></li>
        </ul>
    </nav> <!-- 브레드 크럼 -->

    <div>
        <h2>가입인증</h2>
        <small class="text-muted">회원으로 가입하는 방법에는 2가지 방법이 있습니다. 아래에서 원하는 방법을 선택해주세요 <br>입력하신 정보는 가입완료 전까지 본 사이트에 저장되지 않습니다</small>
        <hr>
    </div> <!-- 섹션 타이틀 -->

    <div class="card card-body bg-light">
        <h3>회원가입</h3>
        <form id="checkfrm1" name="checkfrm1">
            <div class="row">
                <div class="col-5 offset-1">
                    <div class="form-group row">
                        <label class="col-4 col-form-label text-warning text-right" for="name">이름</label>
                        <input type="text" name="name" id="name" class="form-control border-warning col-6">
                    </div><!-- 이름 -->

                    <div class="form-group row">
                        <label class="col-4 col-form-label text-warning text-right" for="byear">
                            생년월일</label>
                        <select id="byear" name="byear" class="form-control col-2 border-warning">
                            <option>년도</option>
                            <option>2002</option>
                            <option>2001</option>
                            <option>2000</option>
                        </select>&nbsp;
                        <select id="bmonth" name="bmonth" class="form-control col-2 border-warning">
                            <option>월</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>&nbsp;
                        <select id="bday" name="bday" class="form-control col-2 border-warning">
                            <option>일</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                        </select>
                    </div><!-- 생년월일 -->

                    <div class="form-group row">
                        <label class="col-4 text-warning text-right" for="gender">
                            성별</label>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="gmale" name="gender" value="m" class="custom-control-input">
                            <label for="gmale" class="custom-control-label text-warning">남자</label></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="custom-control custom-radio">
                            <input type="radio" id="fmale" name="gender" value="f" class="custom-control-input">
                            <label for="fmale" class="custom-control-label text-warning">여자</label>
                        </div>
                    </div> <!-- 성별 -->
                </div>
                <div class="col-5">
                    <ul style="color: blue; font-weight: bold">
                        <li>주민번호 입력없이 전화번호로 회원가입가능!!!!!!!!</li>
                        <li>이름, 생년월일, 성별은 <span class="text-danger">나중에는 변경불가!!!!</span></li>
                        <li>!!!!!!!!!!!!!!!!!!!!!!!!?<span class="text-danger">!!!!!!!!!!!!!!!!!!</span></li>
                    </ul>
                </div>
            </div><!-- 1번 입력폼 -->

            <div class="row">
                <div class="col text-center">
                <hr>
                    <button type="button" id="chk1btn" class="btn btn-primary">
                        <i class="fas fa-check"></i> 확인하기</button>
                    <button type="button" id="cancel1btn" class="btn btn-danger">
                        <i class="fas fa-times"></i> 취소하기</button>
                </div>
            </div> <!-- 버튼 -->
        </form>
    </div><!-- 회원가입 -->
    <div class="card card-body bg-light">
        <h3>실명확인 회원가입</h3>
        <form id="checkfrm2" name="checkfrm2">
            <div class="row">
                <div class="col-5 offset-1">
                    <div class="form-group row">
                        <label class="col-4 col-form-label text-warning text-right" for="name2">이름</label>
                        <input type="text" id="name2" name="name" class="form-control border-warning col-6">
                    </div> <!-- 이름 -->

                    <div class="form-group row">
                        <label class="col-4 col-form-label text-right text-warning" for="jumin1">
                        주민번호</label>
                        <input type="text" id="jumin1" name="jumin1" class="form-control border-warning col-3">
                        <span class="col-form-label">&nbsp; &mdash; &nbsp; </span>
                        <input type="password" id="jumin2" name="jumin2" class="form-control border-warning col-3">
                    </div> <!-- 주민번호 -->

                    <div class="form-group row">
                        <label class="col-4"></label>
                            <div class="custom-control custom-checkbox">
                            <input type="checkbox" id="chkjumin" name="chkjumin" class="custom-control-input" value="y">
                            <label class="custom-control-label text-warning" for="chkjumin">
                                동의하실꺼?</label>
                        </div>
                    </div><!-- 동의여부 -->
                </div> <!-- 왼쪽 -->

                <div class="col-5">
                    <ul style="color:blue; font-weight: bold">
                        <li>실명확인 회원가입시 공개 게시판 이용이 가능합니다.</li>
                        <li>타인의 주민등록번호를 임의로 사용하면 '무슨무슨법'에 의해 3년 이하의 민초형 또는 1천만원 어치의 하와이안 피자가 부과될 수 있습니다</li>
                        <li>입력하신 주민등록번호는 별도 저장되지 않으며, 해달을 위한 기금 조성용으로만 사용됩니다 </li>
                        <li>개인정보보호법에 따라 이용 동의를 받을까요?</li>
                    </ul>
                </div>

            </div> <!-- 2번 입력폼 -->


                <div class="row">
                    <div class="col text-center">
                        <hr>
                         <button type="button" id="chk1btn" class="btn btn-primary">
                        <i class="fas fa-check"></i> 확인하기</button>
                    <button type="button" id="cancel1btn" class="btn btn-danger">
                        <i class="fas fa-times"></i> 취소하기</button>
                    </div>
                </div> <!-- 버튼 -->






        </form>
    </div> <!-- 실명확인 회원가입-->

</div>