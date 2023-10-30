axios.get("http://localhost:8888/G9T3/PHP/getHealth.php")
    .then(response => {
        console.log(response.data);
    })
