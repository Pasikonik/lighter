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

  $('#login').on 'shown.bs.modal', ->
    $('#login_field').focus()

  $('#registration').on 'shown.bs.modal', ->
    $('#reg_field').focus()

  flashCallback = ->
    $(".alert-info, .alert-success").fadeOut()
  $(".alert").bind 'click', =>
    $(".alert").fadeOut()
  setTimeout flashCallback, 4000