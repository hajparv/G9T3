const { google } = require('googleapis'); const { OAuth2Client } = require('google-auth-library');
const oAuth2Client = new OAuth2Client('1038309708510-9qmvt9lf75qhrhii4ivhns85ko8k62e6.apps.googleusercontent.com', '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', 'http://localhost:8888/GitHub/G9T3/booking.html');
oAuth2Client.setCredentials({ refresh_token: '1//048g9fs5_b45yCgYIARAAGAQSNwF-L9IrGkP-lg2D2mSAA4ZiDl5QIfaGFHnKDyAFPUs5WFSdnHa3LhpkYL0MGFX4PMiK9rV4c3s' });
const calendar = google.calendar({ version: 'v3', auth: oAuth2Client });
const eventStartTime = new Date();
eventStartTime.setDate(eventStartTime.getDay() + 2);
const eventEndTime = new Date();
eventEndTime.setDate(eventEndTime.getDate() + 2);
eventEndTime.setMinutes(eventEndTime.getMinutes() + 45);

 // Replace with your desired start timeconst eventEndTime = new Date();   // Replace with your desired end time
const event = {
    summary: 'Meet for project', location: '80 Stamford Rd, Singapore 178902',
    description: 'Finish up the project with zia and priya. We are struggling bad', start: {
        dateTime: eventStartTime.toISOString(), timeZone: 'Asia/Singapore', // Replace with the correct timezone
    }, end: {
        dateTime: eventEndTime.toISOString(), timeZone: 'Asia/Singapore', // Replace with the correct timezone
    },
};
calendar.freebusy.query({
    resource: {
        timeMin: eventStartTime.toISOString(),
        timeMax: eventEndTime.toISOString(), timeZone: 'Asia/Singapore',
        items: [{ id: 'primary' }],
    },
}, (err, res) => {
    if (err) {
        return console.error('Free Busy Query Error', err);
    }
    const eventsArr = res.data.calendars.primary.busy;
    console.log(eventsArr);
    if (eventsArr.length === 0) {
        calendar.events.insert({
            calendarId: 'primary', // Use the correct calendar ID            resource: event,
        }, (err) => {
            if (err) {
                return console.error('Calendar Event Creation Error:', err);
            }
            return console.log('Calendar Event Created.');
        });
    } else {
        return console.log(`Sorry, I'm Busy`);
    }
});