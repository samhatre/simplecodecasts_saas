$(document).ready(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content')); // grabbing meta type from head of site and content from the meta tag
  // Watch for a form submission:
  $("#form-submit-btn").click(function(event) {
    event.preventDefault();   //preventing from default behaviour i.e data on the page is not sent to server at very moment
    $('input[type=submit]').prop('disabled', true);   // disables button from additional click
    var error = false;     // setting var error to false in case we need to declare some errror
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),  // storing values from the user in vars
        expMonth = $('#card_month').val(),   //....// 
        expYear = $('#card_year').val();     //
        
    if (!error) {
      // Get the Stripe token:
      Stripe.createToken({   //if there is no error.. pass on this info to stripe by creating token
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler); // callin th functn which we have declared below
    }
    return false;
  }); // form submission
  
  function stripeResponseHandler(status, response) {
    // Get a reference to the form:
    var f = $("#new_user");       // creating var f to store entire form
    
    // Get the token from the response:
    var token = response.id;
    
    // Add the token to the form:
    f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
    
    // Submit the form:
    f.get(0).submit(); 
  }
});