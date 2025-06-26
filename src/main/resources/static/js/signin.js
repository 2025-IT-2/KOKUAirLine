$(document).ready(function () { // 로그인 화면 로드시 로그인 실패시 에러 출력하는 jquery 함수 (실패시 로그인 화면에 에러를 보내고 리다이랙트함)
    const error = $("#SigninErrorMessage").val();
    if (error) {
        alert(error);
    }
});

// 전체 체크박스
  document.getElementById("agreeAll").addEventListener("change", function () {
    const checked = this.checked;
    document.querySelectorAll(".terms-checkbox").forEach(cb => {
      cb.checked = checked;
    });
  });

  // 개별 체크박스가 하나라도 해제되면 전체 체크도 해제
  document.querySelectorAll(".terms-checkbox").forEach(cb => {
    if (cb.id !== "agreeAll") {
      cb.addEventListener("change", function () {
        const allChecked = [...document.querySelectorAll(".terms-checkbox")]
          .filter(c => c.id !== "agreeAll")
          .every(c => c.checked);
        document.getElementById("agreeAll").checked = allChecked;
      });
    }
  });

  // 전체 보기/접기 토글
  document.getElementById("toggleTermsView").addEventListener("click", function () {
    const terms = document.getElementById("allTermsContent");
    if (terms.style.display === "none") {
      terms.style.display = "block";
      this.textContent = "すべての約款を非表示";
    } else {
      terms.style.display = "none";
      this.textContent = "すべての約款を表示";
    }
  });