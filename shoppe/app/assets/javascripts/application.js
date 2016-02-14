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

  //dynamically refresh category page after delete
  $('.category_page').on('click', '.delete_animal', function(event){
    event.preventDefault();
    var link = $(this).attr('href');
    $.ajax({
      method: 'DELETE',
      url: link
    })
    .done(function(response){
      console.log(response);
      $('.category_page').html(response);
    })

  })

  //NON WORKING
  // $('.category_page').on('ajax:success', '.delete_animal', function(e, data){
  //   $('.category_page').html(data)
  // })

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

  //edit category name
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

  $('#order-history').on('click', 'a', function(e){
    e.preventDefault();
    link = $(this).attr('href');
    $.ajax({
      method: 'GET',
      url: link
      }).done(function(response){
        $('#review-order').html(response);
        })
      })

  // displays cart when 'cart' link is clicked
  $('#cart_nav').on('ajax:success', 'a', function(e, data){
   $('#cart-window').show();
   $('#cart-window').html(data);
   })

  // closes window when close-window is clicked
  $('#cart-window').on('click', '#close-window', function(e){
    e.preventDefault();
    $('#cart-window').hide();
    })

  //Update item quantity/delete from shopping cart
  $('#cart-window').on('ajax:success', '.edit_order', function(e, data){
    $('#cart-window').html(data);
      });
  }

);


















