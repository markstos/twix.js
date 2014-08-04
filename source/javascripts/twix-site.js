//= require jquery
//= require bootstrap-sprockets

$(function(){
  $("#toc > ul").addClass("nav");
  $("body").scrollspy({target: "#toc"});
});
