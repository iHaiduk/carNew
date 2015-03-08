$ = jQuery
$ ->
  $("#save_profile").click ->
    console.log($( "form#form_profile" ).serialize())
    return

  $("#cropit-image-input").on "change", ->
    $('#modal-1').modal('show');

  $imageCropper = $('#image-cropper').cropit
    imageBackground: true
    imageBackgroundBorderWidth: 15

  $("#zoomCrop").slider
    orientation: 'horizontal'
    min: 1
    max: 100
    step: 1
    slide: (e, ui) ->
      $imageCropper.cropit('zoom', ui.value/100);
      return
    change: (ev, ui) ->
      $imageCropper.cropit('zoom', ui.value/100);
      return

  $("#saveAvatar").on "click", ->
    newImage = $imageCropper.cropit 'export',
      type: 'image/jpeg'
      quality: .9
    $.ajax(
      type: "POST"
      url: "/user/save/avatar"
      data:
        image: newImage
      dataType: "json"
    ).done (data)->
      if data? and not data.error?
        $("#imgUser").prop("src",newImage)
        $('#modal-1').modal('hide');

  # ---
  # generated by js2coffee 2.0.1

  return

