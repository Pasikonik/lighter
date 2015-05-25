$ ->
    
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

  type = $('.type').data('type')
  if type
    $("#photos").removeClass 'active'
    $("#graphics").addClass 'active'







