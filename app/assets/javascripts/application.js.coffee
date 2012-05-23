//= require jquery
//= require jquery_ujs
//= require_tree .
jQuery ->
  if $('#notice_box').css('display') == "block"
    $('#notice_box').delay('800').fadeOut("slow")
  else
    $('#notice_box').addClass('animated bounceIn')

  if $('#alert_box').css('display') == "block"
    $('#alert_box').delay('800').fadeOut("slow")
  else
    $('#alert_box').addClass('animated bounceIn')

jQuery ->
  $('#copy_owner_token').click (e) ->
    $('#copy_owner_token').zclip
      path: '../assets/ZeroClipboard.swf',
      copy: $('#owner_token').val()

jQuery ->
  $('a#generate_new_token').click (e) ->
    e.preventDefault()
    if confirm("Czy wygenerować nowy token")
      jQuery.ajax
        type: "POST"
        url: jQuery("a#generate_new_token").attr("href")
        data: {}
        dataType: "script"

jQuery ->
  $('a.destroy_club').click (e) ->
    e.preventDefault()
    jQuery.ajax
      type: "DELETE"
      url: jQuery(@).attr("href")
      data: {}
      dataType: "script"
    $(@).parent().parent().parent().fadeOut('slow')

jQuery ->
  $('a.destroy_table').click (e) ->
    e.preventDefault()
    jQuery.ajax
      type: "DELETE"
      url: jQuery(@).attr("href")
      data: {}
      dataType: "script"
    $(@).parent().parent().parent().fadeOut('slow')


jQuery ->
  $('li.string input').click (e) ->
    if $(@).hasClass('animated')
      $(@).removeClass()
    else
      $(@).addClass('animated flipInX').delay('slow')

jQuery ->
  $('li.password input').click (e) ->
    if $(@).hasClass('animated')
      $(@).removeClass()
    else
      $(@).addClass('animated flipInX').delay('slow')

jQuery ->
  $("ol .fragment #user_birthday_5i").parent().css("display", "none")
  $("ol .fragment #user_birthday_4i").parent().css("display", "none")

# jQuery ->
#   $('input#create_clubs_button').click (e) ->
#     e.preventDefault()
#       jQuery.ajax
#         type: "POST"
#         url: jQuery("a#create_clubs_button").attr("href")
#         data {}
#         dataType: "script"