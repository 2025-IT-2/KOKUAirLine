function showProductPopup(name, imageBase64, description, price){
	document.getElementById('popup-name').innerText = name;
	document.getElementById('popup-price').innerText = price;
	document.getElementById('popup-desc').innerText = description;
	document.getElementById('popup-img').src = 'data:image/png;base64,' + imageBase64;
	document.getElementById('popup').style.display = 'flex';
}

function closePopup(){
	document.getElementById("popup").style.display = 'none';
}