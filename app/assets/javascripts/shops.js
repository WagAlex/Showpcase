$(function() {
  $('body').on('click', '.delete-picture', function() {
    $(this).parent("fieldset").fadeOut(500);
  })

  $('body').on('change', '.upload', function() {
    $(this).parents('form').submit();
  });
});
