// Function to calculate the total price
function calculateTotal() {
    var consultationCost = 35.00; // Cost of consultation
    var medicineCost = 20.00;    // Cost of medicine
    var insuranceCost = 35.00;   // Cost of claimable insurance

    // Calculate the total price
    var total = consultationCost + medicineCost - insuranceCost;

    // Update the total amount in the HTML with a dollar sign and rounded to two decimal places
    document.getElementById('total-amount').textContent = total.toFixed(2);
}

// Call the calculateTotal function when the page loads
window.addEventListener('load', calculateTotal);


$(document).ready(function(){

    //For Card Number formatted input
    var cardNum = document.getElementById('cr_no');
    cardNum.onkeyup = function (e) {
        if (this.value == this.lastValue) return;
        var caretPosition = this.selectionStart;
        var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
        var parts = [];
        
        for (var i = 0, len = sanitizedValue.length; i < len; i += 4) {
            parts.push(sanitizedValue.substring(i, i + 4));
        }
        
        for (var i = caretPosition - 1; i >= 0; i--) {
            var c = this.value[i];
            if (c < '0' || c > '9') {
                caretPosition--;
            }
        }
        caretPosition += Math.floor(caretPosition / 4);
        
        this.value = this.lastValue = parts.join('-');
        this.selectionStart = this.selectionEnd = caretPosition;
    }
    
    //For Date formatted input
    var expDate = document.getElementById('exp');
    expDate.onkeyup = function (e) {
        if (this.value == this.lastValue) return;
        var caretPosition = this.selectionStart;
        var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
        var parts = [];
        
        for (var i = 0, len = sanitizedValue.length; i < len; i += 2) {
            parts.push(sanitizedValue.substring(i, i + 2));
        }
        
        for (var i = caretPosition - 1; i >= 0; i--) {
            var c = this.value[i];
            if (c < '0' || c > '9') {
                caretPosition--;
            }
        }
        caretPosition += Math.floor(caretPosition / 2);
        
        this.value = this.lastValue = parts.join('/');
        this.selectionStart = this.selectionEnd = caretPosition;
    }
    
    
    })