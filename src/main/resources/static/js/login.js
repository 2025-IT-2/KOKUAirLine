window.onload = function () {
    const error = document.getElementById("loginErrorMessage");
    if (error && error.value) {
        alert(error.value);
    }
};
