$(document).ready(function(){
  $(".login label").inFieldLabels();
  $(".new label").inFieldLabels();
  
  $('.create').click(function() {
    $('.account').fadeOut('fast', function() {
        // Animation complete.
        $('.new').fadeIn('fast');
      });
    return false;
  });
  
  $('.reply').click(function() {
    $(this).fadeOut('fast', function() {
        // Animation complete.
        $(this).siblings('.reply_hide').fadeIn('fast');
      });
    return false;
  });
  
  $("#login").validate();
  
  $("#new_user").validate({
    rules: {
      password: "required",
      verify: {
        equalTo: "#user_password"
      }
    }
  });
  
});
