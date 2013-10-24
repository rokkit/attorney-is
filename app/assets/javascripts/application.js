// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.datepicker
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require jquery.purr
//= require best_in_place
//= require_tree .

// For fixed width containers
jQuery(document).ready( function($) {
	$('.datatable').dataTable({
	  "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
	  "sPaginationType": "bootstrap"
	});

	$('.domains .square').equalHeights();
    $.datepicker.regional[""].dateFormat = 'dd.mm.yy';

    $.datepicker.setDefaults($.datepicker.regional['']);
    $(".datepicker").datepicker();
    
	// var currentDate = $.datepicker.formatDate('dd MM yy', new Date());
	// $("#current-date .date").text(currentDate);

});

