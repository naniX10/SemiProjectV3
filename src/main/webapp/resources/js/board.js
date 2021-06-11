
// new board 새글 쓰기
$('#newbdbtn').on('click', function () {
   location.href = '/board/write';
});

// gotolist 리스트로!
$('#listbdbtn').on('click', function () {
    location.href = '/board/list';
});


$('#joinbtn').on('click', function() {
    location.href='/join/agree.html';
});



// save board 글작성완료
$('#savebdbtn').on('click', function () {
    if ($('#title').val() == '') {
        alert('제목을 채워주세요!');
    } else if ($('#contents').val() == '') {
        alert('내용이 없으면 안되요!');
    } else if (grecaptcha.getResponse() == '') {
        alert('너 로봇이구나!');
    } else {
        const frm = $('#boardfrm')
        frm.attr('method','post');
        frm.attr('action','/board/write');
        frm.submit();
    }
});

// search board 검색기능
$('#findbtn').on('click', function () {
    if ($('#findkey').val() == '')
        alert('검색할 내용을 입력하세요!');
    else {
        let qry = '?findtype=' + $('#findtype').val();
        qry += "&findkey=" + $('#findkey').val() + "&cp=1";
        let url = '/board/find' + qry;
        location.href = url;
    }

});

// findtype tag setting 검색한 조건 유지?표시?하기?
// $('#findtype').val('#{param.findtype}').prop('selected', 'true');

// new board reply
$('#newbrbtn').on('click', function () {
    if ($('#reply').val() == '') alert('댓글 내용을 입력해주세요!');
    else {
        const frm = $('#replyfrm');
        frm.attr('method', 'post');
        frm.attr('action', '/reply/write');
        frm.submit();
    }
});

// show reply
function addReply(rno) {
    $('#replyModal').modal('show');
    $('#rpno').val(rno); // 대댓글 작성시 부모댓글번호를 넘겨줌
}

// new reply
$('#newrrpbtn').on('click', function (){
    if($('#rreply').val() == '') alert('내용을 입력해주세요!');
    else {
        const frm = $('#rpfrm');
        frm.attr('method', 'post');
        frm.attr('action', '/rreply/write');
        frm.submit();
    }
});



