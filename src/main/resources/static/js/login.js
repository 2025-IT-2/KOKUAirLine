$(document).ready(function () { // 로그인 화면 로드시 로그인 실패시 에러 출력하는 jquery 함수 (실패시 로그인 화면에 에러를 보내고 리다이랙트함)
    const error = $("#loginErrorMessage").val();
    if (error) {
        alert(error);
    }
});


function openWindow () { //아이디/ 비번찾기
  const options = 'width=500, height=500, top=100, left=100, resizable=no, scrollbars=no'
  window.open('/findUserInfo','finduser',options)
}

/*window.addEventListener("resize", () => {
    const maxWidth = 500;
    const maxHeight = 800;

    if (window.outerWidth > maxWidth || window.outerHeight > maxHeight) {
        window.resizeTo(maxWidth, maxHeight);
        window.moveTo((screen.availWidth - maxWidth) / 2, (screen.availHeight - maxHeight) / 2);
    }
});
*/
