document.addEventListener("DOMContentLoaded", function () {
	    	let currentTripType = 'round';
	    	let datepickerInstance;

	   		// 항공편 선택
		    const tripButtons = document.querySelectorAll(".trip-option");
		    tripButtons.forEach(button => {
		        button.addEventListener("click", () => {
		            tripButtons.forEach(btn => btn.classList.remove("selected"));
		            button.classList.add("selected");
		            selectTripType(button.dataset.type);
		        });
		    });
	
		    // 클래스 선택
		    const classButtons = document.querySelectorAll(".class-option");
		    classButtons.forEach(btn => {
		        btn.addEventListener("click", () => {
		            document.getElementById("classTypeInput").value = btn.dataset.type;
		            classButtons.forEach(btn => btn.classList.remove("selected"));
		            btn.classList.add("selected");
		        });
		    });
	
		    // 탑승객 카운터
		    const counters = document.querySelectorAll(".counter");
		    counters.forEach((counter, index) => {
		        const minus = counter.querySelector("button:first-child");
		        const plus = counter.querySelector("button:last-child");
		        const value = counter.querySelector("span");
	
		        minus.addEventListener("click", () => {
		            let current = parseInt(value.textContent);
		            if (current > 0) {
		                value.textContent = current - 1;
		                updatePassengerCounts();
		            }
		        });
	
		        plus.addEventListener("click", () => {
		            let current = parseInt(value.textContent);
		            value.textContent = current + 1;
		            updatePassengerCounts();
		        });
		    });
	
		    // 날짜 선택 초기화
		    toggleArrivalDate(currentTripType);
		    initFlatpickr(currentTripType);
	
		    // 유효성 검사
		    document.querySelector("form").addEventListener("submit", function (e) {
	
		        const adult = parseInt(document.getElementById("adultCount").value);
		        const child = parseInt(document.getElementById("childCount").value);
		        const infant = parseInt(document.getElementById("infantCount").value);
				
		        if (adult + child + infant === 0) {
		            alert("搭乗人員を1人以上選択してください。");
		            e.preventDefault();
		        } else if (adult <= 0) {
					alert("大人一人は必須です。")
					e.preventDefault();
				}
				
		        const classType = document.getElementById("classTypeInput").value;
		        if (!classType) {
		            alert("座席クラスを選択してください。");
		            e.preventDefault();
		        }
				
		    });
	
		    // 함수 정의들
		    function selectTripType(type) {
		        currentTripType = type;
		        document.getElementById("tripTypeInput").value = type;
		        toggleArrivalDate(type);
		        initFlatpickr(type);
		    }
	
		    function toggleArrivalDate(type) {
		        const returnInput = document.getElementById("arrivalDate");
		        if (type === "round") {
		            returnInput.style.display = "inline-block";
		        } else {
		            returnInput.style.display = "none";
		            returnInput.value = "";
		        }
		    }
	
		    function updatePassengerCounts() {
		        const counts = document.querySelectorAll(".counter span");
		        document.getElementById("adultCount").value = counts[0].textContent;
		        document.getElementById("childCount").value = counts[1].textContent;
		        document.getElementById("infantCount").value = counts[2].textContent;
		    }
			
		    function initFlatpickr(type) {
		        if (datepickerInstance) {
		            datepickerInstance.destroy();
		        }
	
		        if (type === "multiway") return;
	
		        const baseOptions = {
		            minDate: "today",
		            dateFormat: "Y.m.d",
		            locale: "ja",
		            onChange: function (selectedDates) {
		                if (type === "round" && selectedDates.length === 2) {
		                    const [start, end] = selectedDates;
		                    if (start.getTime() === end.getTime()) {
		                        alert("出発日と帰国日は同じにできません。");
		                        document.getElementById("departureDate").value = "";
		                        document.getElementById("arrivalDate").value = "";
		                    }
		                }
		            }
		        };
	
		        if (type === "round") {
		            datepickerInstance = flatpickr("#departureDate", {
		                ...baseOptions,
		                mode: "range",
		                plugins: [new rangePlugin({ input: "#arrivalDate" })]
		            });
		        } else if (type === "oneway") {
		            datepickerInstance = flatpickr("#departureDate", {
		                ...baseOptions,
		                mode: "single"
		            });
		        }
		    }
		});