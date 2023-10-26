const { google } = require('googleapis');
const { OAuth2 } = google.auth;
const oAuth2Client = new OAuth2('725612089696-1h3ifh5lmlnsd8iu2nfmnjg5i7aq5sfr.apps.googleusercontent.com','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');

oAuth2Client.setCredentials({ refresh_token: '1//04i6EJDrzOAFACgYIARAAGAQSNwF-L9IrfwrLX1EvfBaXcnni8uMtTWWoOU9oyUoX1HRfGD_s1bOrEPrLGgkDQywxvwR5tLUmlRo' })

const calendar = google.calendar({ version: 'v3', auth: oAuth2Client });

const eventStartTime = new Date();
eventStartTime.setDate(eventStartTime.getDay() + 2);

const eventEndTime = new Date();
eventEndTime.setDate(eventEndTime.getDate() + 2);
eventEndTime.setMinutes(eventEndTime.getMinutes() + 45);

const event = {
    summary: 'Meet for project',
    location: '80 Stamford Rd, Singapore 178902',
    description: 'Finish up the project with zia and priya. We are struggling bad',
    start: {
        dateTime: eventStartTime,
        timeZone: 'Singapore',
    },
    end: {
        dateTime: eventEndTime,
        timeZone: 'Singapore'
    },
    colorID: 1,

}
calendar.freebusy.query({
    resource: {
        timeMin: eventStartTime,
        timeMax: eventEndTime,
        timeZone: 'Singapore',
        items: [{ id: 'primary' }],
    },
}, (err, res) => {
    if (err)
        return console.error('Free Busy Query Error', err)
    const eventsArr = res.data.calendars.primary.busy;
    console.log(eventsArr);
    if (eventsArr.length === 0)
        return calendar.event.insert(
    {calendarId : 'primary',resource : event},(err)=>{
        if (err)
        return console.error('Calendar Event Creation Error: ',err)
    return console.log('Calendar Event Created.')
    })
    return console.log(`Sorry I'm Busy`)
    
})

