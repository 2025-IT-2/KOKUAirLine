$(document).ready(function () { // 로그인 화면 로드시 로그인 실패시 에러 출력하는 jquery 함수 (실패시 로그인 화면에 에러를 보내고 리다이랙트함)
    const error = $("#loginErrorMessage").val();
    if (error) {
        alert(error);
    }
});
