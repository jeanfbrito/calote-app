// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require pace/pace.min
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks

//= require pace/pace.min
//= require jquery/jquery-1.11.1.min
//= require modernizr.custom
//= require jquery-ui/jquery-ui.min
//= require tether/js/tether.min
//= require bootstrap/js/bootstrap.min
//= require jquery/jquery-easy
//= require jquery-unveil/jquery.unveil.min
//= require jquery-ios-list/jquery.ioslist.min
//= require jquery-actual/jquery.actual.min
//= require jquery-scrollbar/jquery.scrollbar.min
//= require select2/js/select2.full.min
//= require classie/classie
//= require switchery/js/switchery.min
//= require nvd3/lib/d3.v3
//= require nvd3/nv.d3.min
//= require nvd3/src/utils
//= require nvd3/src/tooltip
//= require nvd3/src/interactiveLayer
//= require nvd3/src/models/axis
//= require nvd3/src/models/line
//= require nvd3/src/models/lineWithFocusChart
//= require mapplic/js/hammer
//= require mapplic/js/jquery.mousewheel
//= require mapplic/js/mapplic
//= require rickshaw/rickshaw.min
//= require jquery-metrojs/MetroJs.min
//= require jquery-sparkline/jquery.sparkline.min
//= require skycons/skycons
//= require bootstrap-datepicker/js/bootstrap-datepicker

//= require pages
//= require dashboard
//= require demo
//= require scripts


document.addEventListener('turbolinks:load', function(){
  $.Pages.init()
});
