// list
$('#newpdsbtn').on('click', function () {
    location.href = '/pds/write';
});

// write
$('#newpds').on('click', function (){
    if ($('#title').val() == '')
        alert('제목을 입력하세요!');
    else if ($('#contents').val() == '')
        alert('내용을 입력하세요!');
    else if (grecaptcha.getResponse() == '')
        alert('너... 로봇이구나!');
    else {
        const frm = $('#pdsfrm');
        frm.attr('method', 'post');
        frm.attr('action', '/pds/write');
        frm.submit();
    }
});

// 추천
$('#pdthumbtn').on('click', function() {
    location.href = '/pds/recommd?pno=' + $('#pno').val();

});

// 이전 페이지
$('#pdprvbtn').on('click', function () {
    location.href = '/pds/prev?pno=' + $('#pno').val();
});

// 다음 페이지
$('#pdnxtbtn').on('click', function () {
    location.href = '/pds/next?pno=' + $('#pno').val();
});

// 삭제
$('#pdrmvbtn').on('click', function () {
    location.href = '/pds/pdrmv?pno=' + $('#pno').val();
});

