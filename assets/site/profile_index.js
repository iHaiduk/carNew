(function() {
  var $;

  $ = jQuery;

  $(function() {
    var $imageCropper;
    $("#save_profile").click(function() {
      console.log($("form#form_profile").serialize());
    });
    $("#cropit-image-input").on("change", function() {
      return $('#modal-1').modal('show');
    });
    $imageCropper = $('#image-cropper').cropit({
      imageBackground: true,
      imageBackgroundBorderWidth: 15
    });
    $("#zoomCrop").slider({
      orientation: 'horizontal',
      min: 1,
      max: 100,
      step: 1,
      slide: function(e, ui) {
        $imageCropper.cropit('zoom', ui.value / 100);
      },
      change: function(ev, ui) {
        $imageCropper.cropit('zoom', ui.value / 100);
      }
    });
    $("#saveAvatar").on("click", function() {
      $('#modal-1').modal('hide');
      return $("#imgUser").prop("src", $imageCropper.cropit('export', {
        type: 'image/jpeg',
        quality: .9,
        originalSize: true
      }));
    });
  });

}).call(this);