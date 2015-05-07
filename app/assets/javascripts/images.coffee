# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#new_image').fileupload

    fail: (e, data) ->
      alert("upload fail")

    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('.progress .progress-bar').css 'width', progress + '%'
      $('.progress .progress-bar').text progress + '%'
      return

  $('#new_image').bind 'fileuploadstart', (e, data) ->
    $(".progress").css 'display', 'inline'

  $('#new_image').bind 'fileuploadstop', (e, data) ->
    $("#images").load(location.pathname + " #images")
    setTimeout (->
      $(".progress").css 'display', 'none'
      return
    ), 3000

  $('.btn-to-upload').click ->
    $('#image_src').trigger('click')

  $('#masonry-container').masonry
    itemSelector: '.item'
    columnWidth: 200
    isAnimated: !Modernizr.csstransitions
    isFitWidth: true

