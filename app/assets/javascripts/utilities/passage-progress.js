document.addEventListener('turbolinks:load', function() {
  var progressBar = document.getElementById('test-progress');

  if (progressBar) {
    var questionNumber = progressBar.dataset.questionNumber;
    var questionsCount = progressBar.dataset.questionsCount;

    var progressPercent = Math.floor(questionNumber/questionsCount * 100);

    progressBar.textContent = "Пройдено " + progressPercent + "%";
    progressBar.style.width = progressPercent + "%"
  }
});