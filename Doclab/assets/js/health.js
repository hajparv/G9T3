axios.get("http://localhost:8888/G9T3/PHP/getHealth.php")
    .then(response => {
        if (Array.isArray(response.data)) {
            var records = response.data;

            records.forEach(record => {
                var recordID = record.recordID;
                var name = record.name;
                var date = record.date;
                var location = record.location;

                console.log(`Record ID: ${recordID}`);
                console.log(`Name: ${name}`);
                console.log(`Date: ${date}`);
                console.log(`Location: ${location}`);
            });
        } else {
            console.log("Response data is not an array.");
        }
    })
    .catch(error => {
        console.error("An error occurred:", error);
    });
