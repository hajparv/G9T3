// Function to calculate the total price
function calculateTotal() {
    var consultationCost = 35.00; // Cost of consultation
    var medicineCost = 20.00;    // Cost of medicine
    // Calculate the total price
    var total = consultationCost + medicineCost;

    // Update the total amount in the HTML with a dollar sign and rounded to two decimal places
    document.getElementById('total-amount').textContent = total.toFixed(2);
}

// Call the calculateTotal function when the page loads
window.addEventListener('load', calculateTotal);


document.getElementById("checkout").addEventListener("click", function () {
    if (confirm("Are you sure you want to proceed with the payment?")) {
      stripe.redirectToCheckout({
        // Your payment configuration here
      });
    } else {
      alert("Payment canceled.");
    }
  });


const consultationFee = document.getElementById("consultationCost");
const medicineCost = document.getElementById("medicineCost");

consultationFee.addEventListener("mouseover", function () {
  showTooltip(consultationFee, "Consultation Fee: $35.00");
});

consultationFee.addEventListener("mouseout", function () {
  hideTooltip();
});

medicineCost.addEventListener("mouseover", function () {
  showTooltip(medicineCost, "Medicine Cost: $20.00");
});

medicineCost.addEventListener("mouseout", function () {
  hideTooltip();
});

function showTooltip(element, text) {
  const tooltip = document.createElement("div");
  tooltip.className = "tooltip";
  tooltip.textContent = text;
  element.parentNode.appendChild(tooltip);
  tooltip.style.left = element.offsetLeft + "px";
  tooltip.style.top = element.offsetTop + element.offsetHeight + "px";
}

function hideTooltip() {
  const tooltips = document.getElementsByClassName("tooltip");
  while (tooltips.length > 0) {
    tooltips[0].parentNode.removeChild(tooltips[0]);
  }
}

