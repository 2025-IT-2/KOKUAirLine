<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
	<title>会員登録</title>
	<link rel="stylesheet" href="<c:url value='/css/signin.css' />" />
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
	
	<!-- ① jQuery, jQuery UI CSS/JS 추가 -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	
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
              <form action="home.jsp" method="get" id="signin">
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
                <div class="group-9">
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
                        <div class="text-wrapper-14">苗字</div>
                      </div>
                      <div class="rectangle-5"></div>
                      <div class="input-type">
                        <div class="input-ln">
                          <input type="text" id="lastname" name="lastname" placeholder="英語で入力してください">
                        </div>
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
                <div class="group-4">
                  <div class="overlap-group-2">
                    <div class="umaretahi">
						<div class="umaretahi-wrap">
							<input type="text" id="caldateField" readonly >
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
				
                <!-- 버튼은 form 내부로 이동 -->
                <button type="submit" class="signin">会員登録</button>
              </form>
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

