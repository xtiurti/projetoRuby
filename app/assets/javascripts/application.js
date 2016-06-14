// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require semantic-ui/tab
// require turbolinks
//= require_tree .

//para excluir uma linha
function remove_fields(link) {
	$(link).prev("input[type=hidden]").val(1);
	$(link).closest(".fields").hide();
}
//para adicionar uma linha 
function add_fields(link, association, content){
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	$(link).parent().before(content.replace(regexp, new_id));
}
// para fechar as mensagens
$(window).bind('load', function() {
  $('.message .close')
  .on('click', function() {
    $(this).parent('.message').fadeOut("fast");
  })
;})
// Para soma de aps
$(window).bind('change', "#aps #ap #apcc #at #ad", function() {
  var ap = parseInt($("#ap").val() || 0),
      aps = parseInt($("#aps").val() || 0);
      apcc = parseInt($("#apcc").val() || 0);
      at = parseInt($("#at").val() || 0);
      ad = parseInt($("#ad").val() || 0);
  $("#total").val(ap+aps+apcc+at+ad);
});
