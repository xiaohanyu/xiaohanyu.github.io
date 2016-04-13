// init quotes
function get_random_int(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function json_to_quote(data) {
  var random = get_random_int(0, data.length - 1);
  var word = data[random];
  var quote = "";
  if(typeof word["content"] === 'string') {
    quote = '<p>' + word["content"];
  }
  else {                      // an array of strings
    for(var i = 0; i < word["content"].length; i++)
      quote += '<p>' + word["content"][i];
  }
  quote += '<footer>' + word["author"];
  quote += " <cite> &lt" + word["from"] + "&gt </cite>";
  return quote;
}

$(document).ready(function() {
  $('.ui.progress').progress();

  var word_random = get_random_int(0, 1);

  $.getJSON("/quotes/words-cn.json", function(data) {
    $("#words-cn").html(json_to_quote(data));
    if (word_random === 1)
      $("#words").html(json_to_quote(data));
  });

  $.getJSON("/quotes/words-en.json", function(data) {
    $("#words-en").html(json_to_quote(data));
    if (word_random === 0)
      $("#words").html(json_to_quote(data));
  });
});
