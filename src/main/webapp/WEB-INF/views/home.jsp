<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/home.css' />" />
  </head>
  <body>
    <%@ include file="header.jsp" %>

    <!-- 이미지 영역 -->
	<div class="parentbox">
	<div class="background-overlay" id=backgroundOverlay></div>
    <div class="home-image-slide" id="makeImg">
		    	

      
	<!-- 이미지 1 -->
    <div class="image-container active">
      <a href="/notice">
        <img src="<c:url value='/img/manila.png' />" alt="공지 사항" />
        <div class="overlay-text">フィリピンの首都マニラへの新規就航<br>自然とともに旅するチャンス！</div>
      </a>
    </div>

    <!-- 이미지 2 -->
    <div class="image-container active">
      <img src="<c:url value='/img/homepageImage5.png' />" alt="Main Visual" />
    </div>

    <!-- 이미지 3 -->
    <div class="image-container active">
      <img src="<c:url value='/img/homepageImage6.png' />" alt="Main Visual" />
    </div>

	</div>
	</div>

    <!-- 상품 리스트 영역 -->
    <div>
	  <h2 class="product-title"><ruby class="taxfree-t"><rb>免税品</rb><rt>めんぜいひん</rt><rb>販売</rb><rt>はんばい</rt>リスト</h2>
	</div>

    <div class="product-container">
      <c:forEach var="product" items="${productList}">
        <div class="product-card" onclick="showProductPopup('${product.name}', '${product.imageBase64}', '${product.description}', '${product.price}')">
          <img src="data:image/png;base64,${product.imageBase64}" alt="상품 이미지" />
          <div class="product-info">
            <h3>${product.name}</h3>
            <p>${product.price}</p>
          </div>
        </div>
      </c:forEach>
    </div>
    
    <div id="popup" class="popup" style="display: none;">
	  <div class="popup-content">
	    <span class="close" onclick="closePopup()">&times;</span>
	    <div class="popup-item">
	      <strong>商品名:</strong>
	      <h2 id="popup-name"></h2>
	    </div>
	    <div class="popup-item">
	      <img id="popup-img" src="" alt="상품 이미지" />
	    </div>
	    <div class="popup-item">
	      <strong>商品説明:</strong>
	      <p id="popup-desc"></p>
	    </div>
	    <div class="popup-item">
	      <strong>価格:</strong>
	      <p id="popup-price"></p>
	    </div>
	  </div>
	</div>
    
    <script src="/js/home.js"></script>
	
	<!--홈 슬라이드용-->
	<script>
	const slides = document.querySelectorAll('#makeImg .image-container');
	const background = document.getElementById('backgroundOverlay');
	let current = 0;
	const total = slides.length;

	function showSlide(index) {
	  slides.forEach((slide, i) => {
	    slide.classList.remove('active');
	  });

	  const currentSlide = slides[index];
	  currentSlide.classList.add('active');

	  // 현재 슬라이드 안의 img src로 배경 변경
	  const img = currentSlide.querySelector('img');
	  if (img) {
	    background.style.backgroundImage = `url(${img.src})`;
	  }
	}

	  function nextSlide() {
	    current = (current + 1) % total;
	    showSlide(current);
	  }

	  // 초기 상태
	  showSlide(current);

	  // 자동 슬라이드 시작
	  setInterval(nextSlide, 4000); // 4초마다
	</script>
	
  </body>
</html>
