//= require jquery
//= require jquery_ujs
//= require_tree .
jQuery ->
  $('#notify_box').addClass('animated bounceIn')

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

# jQuery ->
#   $('input#create_clubs_button').click (e) ->
#     e.preventDefault()
#       jQuery.ajax
#         type: "POST"
#         url: jQuery("a#create_clubs_button").attr("href")
#         data {}
#         dataType: "script"