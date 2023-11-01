var application = new Vue({
    el:'#crudApp',
    data:{
     allData:'',
     myModel:false,
     
    },
    methods:{
     fetchAllData:function(){
      axios.post('select-data.php', {
       action:'fetchall'
      }).then(function(response){
        result = '';
       application.allData = response.data;
       console.log(response.data)
       for (information of response.data){
        console.log(information);
        var appointmentID = information.appointmentID;
        var clinicName = information.clinicName;
        var cost = information.cost;
        var date = information.date;
        var invoiceID = information.invoiceID;
        var receiptID = information.receiptID;
       
        result += `
        <tr>
        <td>${invoiceID}</td>
        <td>${receiptID}</td>
        <td>${date}</td>
        <td>${appointmentID}</td>
        <td>${clinicName}</td>
        <td>${cost}</td>
        </tr>


        `
       }
  
       document.getElementById("data").innerHTML += result;
  
 
      });
     },
    },
    created:function(){
     this.fetchAllData();
    }
   });