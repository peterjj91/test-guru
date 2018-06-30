function checkPass() {
  var pass1 = document.getElementById("user_password");
  var pass2 = document.getElementById("user_password_confirmation");
  var message = document.getElementById('confirmMessage');

  var goodColor = "#66cc66";
  var badColor = "#ff6666";

  if (pass1.value == pass2.value) {
    pass1.style.backgroundColor = goodColor;
    pass2.style.backgroundColor = goodColor;
  } else {
    pass1.style.backgroundColor = badColor;
    pass2.style.backgroundColor = badColor;
  }
}
