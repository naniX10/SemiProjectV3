// agree
// 하고 템플릿에 스크립트로 맨 밑에 추가하기!

$('#okagree').on('click', function () {
    if (!$('#agree1').is(':checked'))
        alert('이용약관에 동의해주세요!');
    else if (!$('#agree2').is(':checked'))
        alert('개인정보 수집 약관에 동의해주세요!');
    else
        location.href = '/join/checkme';
}); // 모두 동의

$('#noagree').on('click', function () {
    location.href = '/';
}); // 동의 X


// checkme
// $('').on('', function () {}); << 기본 양식임

$('#chk2btn').on('click', function () {
    if ($('#name2').val() == '') alert('이름을 입력하세요!');
    else if ($('#jumin1').val() == '' || $('#jumin2').val() == '')
        alert('주민번호를 입력하세요!');
    else if (!$('#chkjumin').is(':checked'))
        alert('처리에 체크해주세요');
    else {
        const frm = $('#checkfrm2')
        frm.attr('action','/join/joinme');
        frm.attr('method', 'post');
        frm.submit();
    }

});
$('#cancel2btn').on('click', function () {
    location.href = '/';
});

// userid check
$('#userid').on('blur', function () {  checkuserid(); });
$('#userid').on('focus', function () {
    $('#uidmsg').text(' 8~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.');
    $('#uidmsg').attr('style', 'color:black');
});

// ajax check uid
function checkuserid() {
    let uid = $('#userid').val();
    if (uid == '') { // 아이디를 입력하지 않고 탭을 누른 경우
        $('#uidmsg').text('8~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.');
        $('#uidmsg').attr('style', 'color:black');
        return;
    }
    $.ajax({
        url: '/join/checkuid' ,
        type : 'GET' ,
        data : { 'uid': uid }
    })
        .done(function (data) {
            let msg = '사용불가능한 아이디입니닷!!!!!!!';
            $('#uidmsg').attr('style', 'color:red');

            if (data.trim() == '0') {
                msg = '사용가능한 아이디 입니닷!!!!';
                $('#uidmsg').attr('style', 'color:blue');
            }
            $('#uidmsg').text( msg );
        })
        .fail(function (xhr, status, error) {
            alert(xhr.status + '/' + error);
        });
}

// check equal passwd 비번이 비번확인이랑 같을까?
$('#repasswd').on('blur', function () {
    let msg = '8~16자의 영문 대소문자, 숫자 및 특수문자를 사용할 수 있습니다';

    if ($('#passwd').val() == $('#repasswd').val()) {
        $('#pwdmsg').text ('비밀번호와 비밀번호 확인이 일치합니다.');
        $('#pwdmsg').attr('style', 'color:blue');
    } else {
        $('#pwdmsg').text ('방금 입력한거 벌써 까먹음?');
        $('#pwdmsg').attr('style', 'color:red');
    }
}); // 스타일이 안먹힐때는 'style', 'color:blue' 뒤에 !important를 추가해서 강제로 바꿈


// joinme

$('#joinbtn').on('click', function () {
    if ($('#userid').val() == '') alert('아이디를 입력하세요');
    else if ($('#passwd').val() == '') alert('비밀번호를 입력하세요');
    else if ($('#repasswd').val() == '') alert('비밀번호 확인을 입력해주세요');
    else if ($('#repasswd').val() != $('#passwd').val())
        alert('방금 입력한거 벌써 까먹음?');
    /*else if ($('#zip1').val() == '' || $('#zip2').val() == '')
        alert('우편번호 검색할 수 있죠?');*/
    else if ($('#addr1').val() == '' || $('#addr2').val() == '')
        alert('주소 모르면 안되는데...');
    else if ($('#email1').val() == '' || $('#email2').val() == '')
        alert('이메일 있는거 맞죠?');
    else if ($('#tel1').val() == '' || $('#tel2').val() == ''
        || $('#tel3').val() == '')
        alert('혹시 전화가 없는건가요?');
    else if (grecaptcha.GetResponse == '')
        alert('당신은 로봇입니까?');
    else{
        $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val() );
        $('#zipcode').val($('#zip1').val() + '-' + $('#zip2').val() );
        $('#email').val($('#email1').val() + '-' + $('#email2').val() );
        $('#phone').val(
            $('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel2').val() );

        const frm = $('#joinfrm')
        frm.attr('action','/join/joinok');
        frm.attr('method','post');
        frm.submit();
    }

});

$('#cancelbtn').on('click', function () {
    location.href = '/';
});

// show zipcode
$('#findzipbtn').on('click', function () {

    $.ajax({
        url: '/join/zipcode',
        type: 'GET',
        data: { dong: $('#dong').val() }
    })
        .done(function(data) {
            // 서버에서 넘어온 데이터는 JSON 형식임
            // alert(data);  // object로 출력
            let opts = "";
            $.each(data, function () {  // 행 단위 반복처리
                let zip = '';
                $.each(this, function (k,v) {   // 열 단위 반복처리 / k는 제목? v는 값?
                    if (v != null) zip += v + ' ';
                })
                opts += '<option>' + zip + '</option>';
            });
            $('#addrlist').find('option').remove(); // 기존의 option 태그 삭제
            $('#addrlist').append(opts);    // 새로 만든 option 태그를 추가함

        })
        .fail(function(xhr, status, error) {
            alert(xhr.status + '/' + error)
        });
});

// zipcode dong prevent enter key 엔터키 안 먹히게
$('input[type=text]').keydown(function () {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});


// send zipcode
$('#sendzip').on('click', function () {
    let addr = $('#addrlist option:selected').val();

    if (addr == undefined){
        alert('주소를 선택하세요!');
        return;
    }

    let addrs = addr.split(' '); // 선택한 주소를 공백으로 나눔

    $('#zip1').val( addrs[0].split('-')[0] ); // 첫번째 덩어리를 - 으로 나눔
    $('#zip2').val( addrs[0].split('-')[1] ); // 첫번째 덩어리를 - 으로 나눔

    // 잘라낸 나머지 뭉치들을 합쳐서 addr1로 보냄
    $('#addr1').val( addrs[1] + ' ' + addrs[2] + ' ' + addrs[3] );

    // 검색창 닫기
    $('#zipmodal').modal('hide');
});



// send email2
// option:selected => select 요소들 중 선택한 요소의 값 알아냄

$('#email3').on('change', function() {
   let val = $('#email3 option:selected').text();

   if (val == "직접입력하기") {
       $('#email2').attr('readonly', false); // readonly 속성 해제
       $('#email2').val(' ');
   } else {
       $('#email2').attr('readonly', true); // readonly 속성 설정
       $('#email2').val(val);
   }
});




