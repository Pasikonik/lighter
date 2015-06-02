$ ->
  $('#search-icon').on 'click', (e) ->
    e.preventDefault()
    $('#search-field').css 'display', 'block'
    $('#search-field').animate {
      width: '200px'
    }, 700
    $('#search-field').focus()

  $('#search-field').focusout ->
    $('#search-field').css 'display', 'none'
    $('#search-field').css 'width', '0px'