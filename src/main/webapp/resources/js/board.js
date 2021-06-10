
// new board 새글 쓰기
$('#newbdbtn').on('click', function () {
   location.href = '/board/write';
});

// gotolist 리스트로!
$('#listbdbtn').on('click', function () {
    location.href = '/board/list';
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



