axios.get("http://localhost:8888/G9T3/PHP/getRecord.php")
.then(response=>{
    var information = response.data;
    console.log(information);
    
    var event_data = [];
    for (info of information){
        
        var scheduleInfo = information[info];
        
        if (typeof date === 'string'){
        var infoYear = date.slice(0,4);
        var infoMonth = date.slice(5,7);
        var infoDay = date.slice(8,10);
        let event = {
            day : infoDay,
            month : infoMonth,
            year : infoYear
        };
        event_data.push(event);
        }
       
    }


   



var date = new Date();
var today = date.getDate();
console.log(today);


const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
];
// set click handlers for DOM elements
document.getElementById("prev").addEventListener("click", prev_year);
document.getElementById("next").addEventListener("click", next_year);
var monthElements = document.querySelectorAll(".month");

// Add a click event listener to each of them
monthElements.forEach(function (element) {
    element.addEventListener("click", month_click);
});


document.getElementById("add-button").addEventListener("click", new_event);
//set current month as active
var monthsRow = document.getElementById("months-row");
if (monthsRow) {
    var children = monthsRow.children;
    var currentMonthIndex = date.getMonth();
    if (currentMonthIndex >= 0 && currentMonthIndex < children.length) {
        children[currentMonthIndex].classList.add("active-month");
    }
}

init_calendar(date);

var events = check_events(today, date.getMonth() + 1, date.getFullYear());
show_events(events, months[date.getMonth()], today);

//Initialize the calendar by appending the HTML dates

function init_calendar(date) {
    var tbody = document.querySelector(".tbody");
    var eventsContainer = document.querySelector(".events-container");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
    while (eventsContainer.firstChild) {
        eventsContainer.removeChild(eventsContainer.firstChild);
    }

    var calendarDays = tbody;
    var month = date.getMonth();
    var year = date.getFullYear();
    var dayCount = days_in_month(month, year);
    var row = document.createElement("tr");
    row.className = 'table-row';
    var today = date.getDate();

    date.setDate(1);
    var firstDay = date.getDay();

    for (var i = 0; i < 35 + firstDay; i++) {
        var day = i - firstDay + 1;
        if (i % 7 === 0) {
            calendarDays.appendChild(row);
            row = document.createElement("tr");
            row.className = 'table-row';
        }

        var curr_date = document.createElement("td");
        curr_date.className = 'table-date';
        if (i < firstDay || day > dayCount) {
            curr_date.className += ' nil';
            curr_date.textContent = "";
        } else {
            curr_date.textContent = day;
            var events = check_events(day, month + 1, year);
            if (today === day && document.querySelector(".active-date") === null) {
                curr_date.classList.add("active-date");
                show_events(events, months[month], day);
            }
            if (events.length !== 0) {
                curr_date.classList.add("event-date");
            }
            curr_date.addEventListener("click", function (events, month, day) {
                date_click({ events: events, month: month, day: day });
            }.bind(null, events, months[month], day));
        }
        row.appendChild(curr_date);
    }

    calendarDays.appendChild(row);

    document.querySelector(".year").textContent = year;
}

//Get the number of days in a given month/year

function days_in_month(month, year) {
    var monthStart = new Date(year, month, 1);
    var monthEnd = new Date(year, month + 1, 1);
    console.log((monthEnd - monthStart) / (1000 * 60 * 60 * 24))
    return (monthEnd - monthStart) / (1000 * 60 * 60 * 24);
}

//Event handler when a date is clicked
function date_click(event) {
    var eventsContainer = document.getElementById("events-container");
    if (eventsContainer) {
        eventsContainer.style.display = "block";
    }

    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "none";
    }

    // Remove the "active-date" class from any previously selected date element
    var activeDates = document.querySelectorAll(".active-date");
    activeDates.forEach(function (activeDate) {
        activeDate.classList.remove("active-date");
    });

    // Add the "active-date" class to the clicked date element
    if (event.target && event.target.classList) {
        event.target.classList.add("active-date");
    }

    show_events(event.events, event.month, event.day);
}



//event handler when a month is clicked

// Get all elements with the "month" class within the months row
var monthElements = document.querySelectorAll(".months-row .month");

// Function to handle the click event for a month
function month_click(event) {
    // Show the elements with a transition effect
    var eventsContainer = document.querySelector(".events-container");
    if (eventsContainer) {
        eventsContainer.style.display = "block";
        eventsContainer.style.transition = "display 250ms";
    }

    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "none";
        dialog.style.transition = "display 250ms";
    }

    // Map months to their respective index (0 to 11)
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var new_month = months.indexOf(this.textContent);

    // Get the current date
    var currentDate = new Date();
    // Set the new month
    currentDate.setMonth(new_month);

    // Remove the "active-month" class from all elements with that class
    var monthElements = document.querySelectorAll(".month");
    monthElements.forEach(function (element) {
        element.classList.remove("active-month");
    });

    // Add the "active-month" class to the clicked element
    this.classList.add("active-month");

    // Call the `init_calendar` function with the updated date
    init_calendar(currentDate);
}






//event handler when the year right-button is clicked
function next_year(event) {
    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "none";
        // You can add a transition effect using JavaScript if needed.
    }

    var date = event.date; // Access the date directly from the event object.
    var new_year = date.getFullYear() + 1;

    // Update the content of the element with ID "year."
    var yearElement = document.getElementById("year");
    if (yearElement) {
        yearElement.innerHTML = new_year;
    }

    date.setFullYear(new_year);
    init_calendar(date);
}

//event handler when the year left-button is clicked 
function prev_year(event) {
   
    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "none";
        // You can add a transition effect using JavaScript if needed.
    }

    var date = event.date; 
    console.log(event);
    // Access the date directly from the event object.
    var new_year = date.getFullYear() - 1;

    // Update the content of the element with ID "year."
    var yearElement = document.getElementById("year");
    if (yearElement) {
        yearElement.innerHTML = new_year;
    }

    date.setFullYear(new_year);
    init_calendar(date);
}

//Event handler for clicking new event button
function new_event(event) {
    // If a date isn't selected, do nothing
    var activeDate = document.querySelector(".active-date");
    if (!activeDate) {
        return;
    }

    // Remove red error input on click
    var inputs = document.querySelectorAll("input");
    inputs.forEach(function (input) {
        input.addEventListener("click", function () {
            input.classList.remove("error-input");
        });
    });

    // Empty inputs and hide events
    var textInputs = document.querySelectorAll("#dialog input[type=text]");
    var numberInputs = document.querySelectorAll("#dialog input[type=number]");
    textInputs.forEach(function (input) {
        input.value = '';
    });
    numberInputs.forEach(function (input) {
        input.value = '';
    });

    var eventsContainer = document.querySelector(".events-container");
    if (eventsContainer) {
        eventsContainer.style.display = "none";
        eventsContainer.style.transition = "display 250ms";
    }

    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "block";
        dialog.style.transition = "display 250ms";
    }

    // Event handler for cancel button
    var cancelButton = document.getElementById("cancel-button");
    if (cancelButton) {
        cancelButton.addEventListener("click", function () {
            var nameInput = document.getElementById("name");
            var countInput = document.getElementById("count");
            if (nameInput) {
                nameInput.classList.remove("error-input");
            }
            if (countInput) {
                countInput.classList.remove("error-input");
            }

            var eventsContainer = document.querySelector(".events-container");
            if (eventsContainer) {
                eventsContainer.style.display = "block";
                eventsContainer.style.transition = "display 250ms";
            }

            var dialog = document.getElementById("dialog");
            if (dialog) {
                dialog.style.display = "none";
                dialog.style.transition = "display 250ms";
            }
        });
    }

    // Event handler for ok button
    var okButton = document.getElementById("ok-button");
    if (okButton) {
        okButton.addEventListener("click", function () {

            var nameInput = document.getElementById("name");
            var countInput = document.getElementById("count");
            var day = parseInt(activeDate.innerHTML.trim());

            console.log(nameInput.value);
            // Basic form validation
            if (!nameInput.value.trim()) {
                nameInput.classList.add("error-input");
        
            } else {
                var name = nameInput.value.trim();
            
                dialog.style.display = "none";
                console.log("new event");
                new_event_json(name, count, date, day);
                date.setDate(day);
                init_calendar(date);
            }
            
        });
    }
}



function show_events(events, month, day) {
    var eventsContainer = document.querySelector(".events-container");
    if (eventsContainer) {
        // Clear the events container
        while (eventsContainer.firstChild) {
            eventsContainer.removeChild(eventsContainer.firstChild);
        }
        eventsContainer.style.display = "block";
    }

    console.log(event_data);

    if (events.length === 0) {
        var eventCard = document.createElement("div");
        eventCard.className = 'event-card';
        var eventName = document.createElement("div");
        eventName.className = 'event-name';
        eventName.textContent = "There are no events planned for " + month + " " + day + ".";
        eventCard.style.borderLeft = "10px solid #FF1744";
        eventCard.appendChild(eventName);
        eventsContainer.appendChild(eventCard);
    } else {
        for (var i = 0; i < events.length; i++) {
            var eventCard = document.createElement("div");
            eventCard.className = 'event-card';
            var eventName = document.createElement("div");
            eventName.className = 'event-name';
            eventName.textContent = events[i]["occasion"] + ":";
            var eventCount = document.createElement("div");
            eventCount.className = 'event-count';
            eventCount.textContent = events[i]["invited_count"] + " Invited";

            if (events[i]["cancelled"] === true) {
                eventCard.style.borderLeft = "10px solid #FF1744";
                var eventCancelled = document.createElement("div");
                eventCancelled.className = 'event-cancelled';
                eventCancelled.textContent = "Cancelled";
                eventCount = eventCancelled;
            }

            eventCard.appendChild(eventName);
            eventCard.appendChild(eventCount);
            eventsContainer.appendChild(eventCard);
        }
    }
}


//checks if a specific date has any events
function check_events(day, month, year) {
    var events = [];
    console.log(event_data[0]);
    console.log(event_data[1]);
    console.log(event_data[2]);
    console.log(event_data[3]);

    console.log(day);
    for (let i=0; i<event_data.length;i++){
        console.log(event_data[i].day)
    
    if (event_data[i].day == day &&
        event_data[i].month == month &&
        event_data[i].year == year) {
        events.push(event_data);
    }}
    console.log(events);
    return events;
    


}







// Adds a json event to event_data
function new_event_json(name, date, day) {
    var event = {
        "occasion": name,
  
        "year": date.getFullYear(),
        "month": date.getMonth() + 1,
        "day": day
    };
    event_data["events"].push(event);
}

})

//data for events in JSON




