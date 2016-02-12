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
//= require_tree .
$( document ).ready(function() {
  $.ajax({
      method: 'GET',
      url: '/categories/all'
    })
    .done(function(response){
      $('.category_page').html(response)
    })

  $('.nav-tabs').on('click', 'a', function(event){
    event.preventDefault();
    url = $(event.target).attr('href')
    $.ajax({
      method: 'GET',
      url: url
    })
    .done(function(response){
      $('.category_page').html(response)
    })
  })

  // $('.category_page').on('click', '#add_animal', function(e){
  //   e.preventDefault();
  //   var link = $(this).attr('href')
  //   $.ajax({
  //     method: 'GET',
  //     url: link
  //   })
  //   .done(function(response){
  //     $("#add_animal").hide();
  //     $('#animal-adder').html(response)
  //   })
  // })

  $('.add-content').on('click', 'a', function(e){
    e.preventDefault();
    var link = $(this).attr('href')
    $.ajax({
      method: 'GET',
      url: link
    })
    .done(function(response){
      $('.add-content-form').html(response)
    })
  })

  $('.category_page').on('click', '#edit_category', function(e){
    e.preventDefault();
    var link = $(this).attr('href')
    $.ajax({
      method: 'GET',
      url: link
    })
    .done(function(response){
      $("#edit_category").hide();
      $('#category-editor').html(response)
    })
  })
});


















