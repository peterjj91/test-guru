document.addEventListener('turbolinks:load', function(){
  var timerElement = document.querySelector('.timer')
  if (timerElement) {
    var timeRemaining = timerElement.dataset.remainingTime;
    startTimer(timerElement, timeRemaining);
  }
}
)

function startTimer(control, timeRemaining) {
  if (timeRemaining > 0) {
    var timerLabel = document.querySelector('.timer_label');
    timerLabel.textContent = formatTime(timeRemaining);
    timeRemaining--;
    setTimeout(startTimer, 1000, control, timeRemaining);
  } else {
    var resultPage = window.location.href + '/result';
    window.location.replace(resultPage);
  }
}

function formatTime(numberOfSecs) {
  var secondsToOutput = numberOfSecs % 60
  var minutesToOutput = (numberOfSecs - secondsToOutput) / 60

  if (secondsToOutput < 10) {
    secondsToOutput = '0' + secondsToOutput
  }

  return minutesToOutput + ':' + secondsToOutput
}