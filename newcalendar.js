var date = new Date();
var today = date.getDate();
console.log(today);
let event_data = {
    day : 5,
    month : 10,
    year : 2023
}

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
document.getElementById("prev").addEventListener("click",prev_year);
document.getElementById("next").addEventListener("click",next_year);
var monthElements = document.querySelectorAll(".month");

// Add a click event listener to each of them
monthElements.forEach(function (element) {
    element.addEventListener("click", month_click);
});


document.getElementById("add-button").addEventListener("click",new_event);
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
    console.log(event)
    var eventsContainer = document.getElementById("events-container");
    if (eventsContainer) {
        eventsContainer.style.display = "block";
        // You can add a transition effect using JavaScript if needed.
    }
    
    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "none";
        // You can add a transition effect using JavaScript if needed.
    }
    
    var activeDate = document.getElementById("active-date");
    if (activeDate) {
        activeDate.classList.remove("active-date");
    }

    // Check if event.target has a classList property
    if (event.target && event.target.classList) {
        event.target.classList.add("active-date");
    }
    
    show_events(event.events, event.month, event.day);
}

//event handler when a month is clicked

function month_click(event) {
    // Show the elements with a transition effect
    console.log(event);
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

    // Get the date from the event data
    var date = event.data.date;


    var activeMonth = document.getElementById("active-month");
    if (activeMonth) {
        activeMonth.classList.remove("active-month");
    }

    // Check if event.target has a classList property
    if (event.target && event.target.classList) {
        event.target.classList.add("active-month");
    }


    // Get the index of the clicked month element
    var newMonth = Array.from(document.querySelectorAll(".month")).indexOf(this);

    // Update the date object with the new month
    date.setMonth(newMonth);

    // Call the `init_calendar` function with the updated date
    init_calendar(date);
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

    var date = event.date; // Access the date directly from the event object.
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
    // If a date isn't selected, then do nothing
    if (document.querySelector(".active-date") === null) {
        return;
    }

    // Remove red error input on click
    var inputElements = document.querySelectorAll("input");
    inputElements.forEach(function (input) {
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
        // You can add a transition effect using JavaScript if needed.
    }

    var dialog = document.getElementById("dialog");
    if (dialog) {
        dialog.style.display = "block";
        // You can add a transition effect using JavaScript if needed.
    }

    // Event handler for cancel button
    var cancelButton = document.getElementById("cancel-button");
    if (cancelButton) {
        cancelButton.addEventListener("click", function (){

        document.getElementById("name").classList.remove("error-input");
        document.getElementById("count").classList.remove("error-input");
        dialog.style.display = "none";
        if (eventsContainer) {
            eventsContainer.style.display = "block";
            // You can add a transition effect using JavaScript if needed.
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

    console.log(event_data["events"]);

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
    console.log(event_data);
    
        if(event_data["day"]===day &&
            event_data["month"]===month &&
            event_data["year"]===year) {
                events.push(event_data);
            }
            return events;

    }







// Adds a json event to event_data
function new_event_json(name, count, date, day) {
    var event = {
        "occasion": name,
        "invited_count": count,
        "year": date.getFullYear(),
        "month": date.getMonth()+1,
        "day": day
    };
    event_data["events"].push(event);
}



//data for events in JSON




