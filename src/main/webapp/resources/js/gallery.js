// show img
function showimg(gno) {
    location.href = '/gallery/view?gno=' + gno;
}

// 새글 쓰기
$('#newgalbtn').on('click', function() {
    location.href = '/gallery/write';
});

// 목록으로
$('#galistbtn').on('click', function () {
    location.href = '/gallery/list'
});

// 글 작성 완료
$('#newgal').on('click', function () {
    if ($('#title').val() == '')
        alert('제목을 입력해주세요!');
    else if ($('#contents').val() == '')
        alert('내용을 입력해주세요!');
    else if (grecaptcha.getResponse() == '')
        alert('너... 로봇이구나!');
    else {
        const frm = $('#galfrm');
        frm.attr('method', 'post');
        frm.attr('action', '/gallery/write');
        frm.attr('enctype', 'multipart/form-data');
        frm.submit();
    }
});

// show attach filename(첨부한 파일 이름 보이게 하기)
$('#file1').on('change', function () {
    var fname = $(this).val();
    fname = fname.substring(fname.lastIndexOf("\\") + 1);
    $(this).next('.custom-file-label').html(fname);
});

$('#file2').on('change', function () {
    var fname = $(this).val();
    fname = fname.substring(fname.lastIndexOf("\\") + 1);
    $(this).next('.custom-file-label').html(fname);
});

$('#file3').on('change', function () {
    var fname = $(this).val();
    fname = fname.substring(fname.lastIndexOf("\\") + 1);
    $(this).next('.custom-file-label').html(fname);
});
