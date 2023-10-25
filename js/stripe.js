// Replace 'YOUR_PUBLISHABLE_KEY' with your actual Stripe Publishable Key
var stripe = Stripe('pk_test_51O54RGHLkcB4nnlEHW0YPWzG8Y6Kdlobr7r54iABVBlU220yaacYmvtHu2SO3Uye06lJtQP9GI6uzPBKbpNq4iqm00JROJRvCw');
var elements = stripe.elements();

var card = elements.create('card');
card.mount('#card-element');

var form = document.getElementById('payment-form');
var errorElement = document.getElementById('card-errors');

form.addEventListener('submit', function(event) {
  event.preventDefault();

  // Disable the submit button to prevent multiple submissions
  document.getElementById('submit').disabled = true;

  stripe.createToken(card).then(function(result) {
    if (result.error) {
      // Show any errors that occur
      errorElement.textContent = result.error.message;
      // Re-enable the submit button
      document.getElementById('submit').disabled = false;
    } else {
      // Token is created, you can send it to your server to process the payment
      stripeTokenHandler(result.token);
    }
  });
});

function stripeTokenHandler(token) {
  // You can send the token to your server for payment processing
  // For security reasons, you should not process payments on the client side.
  // Instead, make an AJAX request to your server and handle the payment on the server.
  // Example: Send the token via a fetch request to your server.
  fetch('YOUR_SERVER_ENDPOINT', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ token: token.id }),
  })
    .then(function(response) {
      return response.json();
    })
    .then(function(data) {
      // Handle the response from your server (e.g., display a success message)
    })
    .catch(function(error) {
      console.error('Error:', error);
    });
}
