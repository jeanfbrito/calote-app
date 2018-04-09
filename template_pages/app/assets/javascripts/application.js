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

//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks

//= require pace/pace.min
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

$(document).on("ready turbolinks:load", function(){
  $.Pages.init();
  // Initializes search overlay plugin.
  // Replace onSearchSubmit() and onKeyEnter() with
  // your logic to perform a search and display results
  $(".list-view-wrapper").scrollbar();

  $('[data-pages="search"]').search({
      // Bind elements that are included inside search overlay
      searchField: '#overlay-search',
      closeButton: '.overlay-close',
      suggestions: '#overlay-suggestions',
      brand: '.brand',
       // Callback that will be run when you hit ENTER button on search box
      onSearchSubmit: function(searchString) {
          console.log("Search for: " + searchString);
      },
      // Callback that will be run whenever you enter a key into search box.
      // Perform any live search here.
      onKeyEnter: function(searchString) {
        console.log("Live search for: " + searchString);
        var searchField = $('#overlay-search');
        var searchResults = $('.search-results');

        /*
            Do AJAX call here to get search results
            and update DOM and use the following block
            'searchResults.find('.result-name').each(function() {...}'
            inside the AJAX callback to update the DOM
        */

        // Timeout is used for DEMO purpose only to simulate an AJAX call
        clearTimeout($.data(this, 'timer'));
        searchResults.fadeOut("fast"); // hide previously returned results until server returns new results
        var wait = setTimeout(function() {

          searchResults.find('.result-name').each(function() {
            if (searchField.val().length != 0) {
              $(this).html(searchField.val());
              searchResults.fadeIn("fast"); // reveal updated results
            }
          });
        }, 500);
        $(this).data('timer', wait);
    }
  });

  $('.panel-collapse label').on('click', function(e){
    e.stopPropagation();
  });

  $('#btnToggleSlideUpSize').click(function() {
        var size = $('input[name=slideup_toggler]:checked').val()
        var modalElem = $('#modalSlideUp');
        if (size == "mini") {
            $('#modalSlideUpSmall').modal('show')
        } else {
            $('#modalSlideUp').modal('show')
            if (size == "default") {
                modalElem.children('.modal-dialog').removeClass('modal-lg');
            } else if (size == "full") {
                modalElem.children('.modal-dialog').addClass('modal-lg');
            }
        }
    });

    $('#btnStickUpSizeToggler').click(function() {
      var size = $('input[name=stickup_toggler]:checked').val()
      var modalElem = $('#myModal');
      if (size == "mini") {
        $('#modalStickUpSmall').modal('show')
      } else {
        $('#myModal').modal('show')
        if (size == "default") {
          modalElem.children('.modal-dialog').removeClass('modal-lg');
        } else if (size == "full") {
          modalElem.children('.modal-dialog').addClass('modal-lg');
        }
      }
    });

    // Only for fillin modals so that the backdrop action is still there
    $('#modalFillIn').on('show.bs.modal', function(e) {
        $('body').addClass('fill-in-modal');
    });
    $('#modalFillIn').on('hidden.bs.modal', function(e) {
        $('body').removeClass('fill-in-modal');
    });
});
