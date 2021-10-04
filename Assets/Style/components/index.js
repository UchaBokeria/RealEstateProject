$('.toggle-btn-value').click(function() {
    var mainParent = $(this).parent('.toggle-btn');
    if($(mainParent).find('input.toggle-btn-value').is(':checked')) {
      $(mainParent).addClass('active');
    } else {
      $(mainParent).removeClass('active');
    }
  
  })