// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var editfunc = function() {
  return $(".edit").click(function() {
    $(this).parent().siblings(".title").toggle();
    $(this).parent().parent().find("span.input-append").find(".edit-form").toggle();
    $(this).parent().parent().parent().children(".maincol").find(".content").toggle();
    return $(this).parent().parent().parent().children(".maincol").find(".edit-form").toggle();
  });
};

$(document).ready ( function(){
	$('.project-title').hover(function(){
	$(this).find(".hidebar").stop(true,true).fadeIn('fast');
	},  function(){
	$(this).find(".hidebar").stop(true,true).fadeOut('fast');
	}
	);
	$('.task').hover(function(){
	$(this).find(".hidebar").stop(true,true).fadeIn('fast');
	},  function(){
	$(this).find(".hidebar").stop(true,true).fadeOut('fast');
	}
	);
});