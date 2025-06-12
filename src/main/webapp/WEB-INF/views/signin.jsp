<%@ page contentType="text/html; charset=UTF-8"  pageEncoding= "UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
	<title>会員登録</title>
	<link rel="stylesheet" href="<c:url value='/css/signin.css'/>" />
	<link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
	
	<!-- ① jQuery, jQuery UI CSS/JS 추가 -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	
	<script>
			//입력한 내용 검사
		  document.getElementById('signin').addEventListener('submit', function (e) {
		    const id = document.getElementById('input-id').value.trim();
		    const pw = document.getElementById('input-pw').value.trim();
		    const email = document.getElementById('input-mail').value.trim();
		    const firstname = document.getElementById('firstname').value.trim();
		    const lastname = document.getElementById('lastname').value.trim();

		    // 이메일 형식 확인용 정규식
		    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		    // 기본 검사 조건
		    if (id === '' || pw === '' || email === '' || firstname === '' || lastname === '') {
		      alert('모든 필드를 입력해주세요.');
		      e.preventDefault();
		      return;
		    }

		    if (pw.length < 8 || pw.length > 16) {
		      alert('비밀번호는 최소 8자 이상, 최대 16자 이하로 입력해주세요.');
		      e.preventDefault();
		      return;
		    }

		    if (!emailRegex.test(email)) {
		      alert('올바른 이메일 형식을 입력해주세요.');
		      e.preventDefault();
		      return;
		    }
		  });
		</script>
	
	<script>
		//캘린더 스크립트
	  $(function() {
	    // 캘린더 버튼 클릭 시 달력 표시
	    $("#calendarBtn").click(function() {
	      $("#caldateField").datepicker("show");
	    });

	    // 날짜 선택 시 해당 input에 값 설정
	    $("#caldateField").datepicker({
	      dateFormat: "yy-mm-dd"  // 원하는 포맷
	    });
	  });
	</script>
	
</head>
<body>
	<%@ include file="header.jsp" %> 
  <div class="screen">
    <div class="view-wrapper">
      <div class="view">
        <div class="overlap">
          <div class="div"></div>
          <div class="overlap-wrapper">
			<div class="groupoveroutline">
            <div class="group-6">
            <div class="overlap-2">
              <!-- 회원가입 form 시작 -->
              <form action="/signin" method="post" id="signin">
				<!-- 버튼은 form 내부로 이동 -->
				  <button type="submit" class="signin">会員登録</button>
				</form>
                <div class="group-wrapper">
                  <div class="overlap-group-wrapper">
                    <div class="div-wrapper">
                      <div class="text-wrapper-4">PW</div>
                    </div>
                    <div class="rectangle-8"></div>
                    <div class="input-type">
                      <div class="input-pw">
                        <input type="text" id="input-pw" name="pw" placeholder="最小８文字、最大１６文字">
                      </div>
                    </div>
                  </div>
                </div>
                
                  <div class="group-10">
                    <div class="div-wrapper">
                      <div class="text-wrapper-9">ID</div>
                    </div>
                    <div class="rectangle-6"></div>
                    <div class="input-type">
                      <div class="input-id">
                        <input type="text" id="input-id" name="ID" placeholder="重複検査を行います">
                      </div>
                    </div>
                  </div>
                  <div class="group-11">
                    <div class="overlap-group-wrapper">
                      <div class="div-wrapper">
                        <div class="text-wrapper-10">性別</div>
                      </div>
                    </div>
                  </div>
                  <div class="group-12">
                    <div class="div-wrapper">
                      <div class="text-wrapper-11">生年月日</div>
                    </div>
                  </div>
                  <div class="group-13">
                    <div class="div-wrapper">
                      <div class="text-wrapper-12">メール</div>
                    </div>
                    <div class="rectangle-7"></div>
                    <div class="input-type">
                      <div class="input-mail">
                        <input type="text" id="input-mail" name="EMAIL" placeholder="重複検査を行います">
                      </div>
                    </div>
                  </div>
                  <div class="group-14">
                    <div class="overlap-group-wrapper">
                      <div class="div-wrapper">
                        <div class="text-wrapper-13">名前</div>
                      </div>
                      <div class="rectangle-4"></div>
                      <div class="input-type">
                        <div class="input-fn">
                          <input type="text" id="firstname" name="firstname" placeholder="英語で入力してください">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="group-15">
                    <div class="overlap-group-wrapper">
                      <div class="div-wrapper">
                        <div class="text-wrapper-14">性</div>
                      </div>
                      <div class="rectangle-5"></div>
                      <div class="input-type">
                        <div class="input-ln">
                          <input type="text" id="lastname" name="lastname" placeholder="英語で入力してください">
                        </div>
                      </div>
                    </div>
                  </div>
                
				<div class="gender-type">
				  <div class="gender-type2">
				    <label>
				      <input type="radio" name="gender" value="male" class="male"> 男性
				    </label>
				    <label>
				      <input type="radio" name="gender" value="female" class="female"> 女性
				    </label>
				  </div>
				</div>
				<!-- 휴대폰 번호 -->
				<div class="group-16">
				  <div class="overlap-group-wrapper">
				    <div class="div-wrapper">
				      <div class="text-wrapper-15">電話番号</div>
				    </div>
				    <div class="rectangle-9"></div>
				    <div class="input-type">
				      <div class="input-phone">
				        <input type="text" id="input-phone" name="phone" placeholder="例: 01012345678">
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- 국적 선택 -->
				<div class="group-17">
				  <div class="overlap-group-wrapper">
				    <div class="div-wrapper">
				      <div class="text-wrapper-16">国籍</div>
				    </div>
				    <div class="rectangle-10"></div>
				    <div class="input-type">
				      <div class="input-nation">
				        <select id="input-nation" name="nationality">
							<!-- 국적은 임의로 몇국가만 뽑음 -->
				          <option value="">選択してください</option>
				          <option value="KR">韓国</option>
				          <option value="JP">日本</option>
				          <option value="US">アメリカ</option>
				          <option value="CN">中国</option>
				          <option value="VN">ベトナム</option>
				          <option value="DE">ドイツ</option>
				          <option value="CA">カナダ</option>
				          <option value="AU">オーストラリア</option>
				          <option value="AT">オーストリア</option>
				          <option value="ETC">他の国</option>
				        </select>
				      </div>
				    </div>
				  </div>
				</div>
				
				</div>

                <div class="group-4">
                  <div class="overlap-group-2">
                    <div class="umaretahi">
						<div class="umaretahi-wrap">
							<input type="text" id="caldateField" name="birthdate" readonly >
						</div>
					</div>
                  </div>
                </div>
                <div class="calender-nen">
                  <div class="text-wrapper-7">
					<!-- ② 날짜 입력 input + 캘린더 버튼 -->
					<button id="calendarBtn">📅</button>
					</div>
                </div>
				
                
              <!-- 회원가입 form 끝 -->
            </div>
            </div>
			</div>
          </div>
          <div class="group-2">
            <div class="overlap-3">
              <div class="rectangle-3"></div>
              <div class="text-wrapper-5">会員登録</div>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
</body>
</html>

