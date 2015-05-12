# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    
  $('.btn-to-upload').click ->
    $('#image_src').trigger('click')

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
    location.reload()
    # $("#images").load(location.pathname + " #images")
    # setTimeout (->
    #   $(".progress").css 'display', 'none'
    #   return
    # ), 3000

  $container = $('#masonry-container')
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: '.item'
      columnWidth: 220
      isAnimated: !Modernizr.csstransitions
      isFitWidth: true

  $('a.fancybox').fancybox()

  $container.infinitescroll {
    navSelector: '#page-nav'
    nextSelector: '#page-nav a'
    itemSelector: '.item'
    animate: false
    loading:
      speed: 'fast'
      msg: $('<i></i>')
  }, (newElements) ->
    $newElems = $(newElements).css(opacity: 0)
    $newElems.imagesLoaded ->
      $newElems.animate opacity: 1
      $container.masonry 'appended', $newElems, true

  






