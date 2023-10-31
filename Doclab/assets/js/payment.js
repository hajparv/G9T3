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


