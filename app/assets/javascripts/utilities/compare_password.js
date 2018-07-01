document.addEventListener('turbolinks:load', function () {
    var control = document.getElementById('user_password_confirmation')

    if (control) { control.addEventListener('input', checkPass) }
});

function checkPass() {
  var pass1 = document.getElementById("user_password");
  var pass2 = document.getElementById("user_password_confirmation");

  var goodColor = "#66cc66";
  var badColor = "#ff6666";

  if (pass1.value == pass2.value) {
    pass1.style.backgroundColor = goodColor;
    pass2.style.backgroundColor = goodColor;
  } else {
    pass1.style.backgroundColor = badColor;
    pass2.style.backgroundColor = badColor;
  } 

  if (pass2.value == 0 || pass1.value == 0) {
    pass1.style.backgroundColor = 'transparent';
    pass2.style.backgroundColor = 'transparent';
  }
}


// document.addEventListener('turbolinks:load', function () {
//     var control = document.getElementById('user_password_confirmation')

//     if (control) { control.addEventListener('input', passwordCheck) }
// });

// function passwordCheck() {
//     var pass = document.getElementById('user_password').value
//     var passConf = this.value

//     if (passConf === pass) {
//         document.querySelector('.octicon-thumbsup').classList.remove('hide')
//         document.querySelector('.octicon-thumbsdown').classList.add('hide')
//     } else {
//         document.querySelector('.octicon-thumbsup').classList.add('hide')
//         document.querySelector('.octicon-thumbsdown').classList.remove('hide')
//     }

//     if (passConf == 0) {
//         document.querySelector('.octicon-thumbsup').classList.add('hide')
//         document.querySelector('.octicon-thumbsdown').classList.add('hide')
//     }
// }