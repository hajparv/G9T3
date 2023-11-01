var application = new Vue({
  el:'#crudApp',
  data:{
   allData:'',
   myModel:false,
   
  },
  methods:{
   fetchAllData:function(){
    axios.post('pendingpayment.php', {
     action:'fetchall'
    }).then(function(response){
      pending = '';
     application.allData = response.data;
     console.log(response.data)
     for (information of response.data){
      console.log(information);
      var date = information.date;
      var receiptID = information.receiptID;
      var appointmentID = information.appointmentID;
      var clinicName = information.clinicName;
      var cost = information.cost;
      var duedate = information.duedate;
      pending += `
      <tr>
      <td>${receiptID}</td>
      <td>${date}</td>
      <td>${appointmentID}</td>
      <td>${clinicName}</td>
      <td>${cost}</td>
      <td>${duedate}</td>
      </tr>
      `
     }
     console.log(pending);

     document.getElementById("pending").innerHTML += pending;


    });
   },
  },
  created:function(){
   this.fetchAllData();
  }
 });

 var application = new Vue({
  el:'#crudApp',
  data:{
   allData:'',
   myModel:false,
   
  },
  methods:{
   fetchAllData:function(){
    axios.post('paymenthistory.php', {
     action:'fetchall'
    }).then(function(response){
      result = '';
      var tbody = document.getElementById("tbody");
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
     console.log(result);

     document.getElementById("data").innerHTML += result;


    });
   },
  },
  created:function(){
   this.fetchAllData();
  }
 });

 var application = new Vue({
  el:'#crudApp',
  data:{
   allData:'',
   myModel:false,
   
  },
  methods:{
   fetchAllData:function(){
    axios.post('userform.php', {
     action:'fetchall'
    }).then(function(response){
      result = '';
     application.allData = response.data;
     console.log(response.data)
     for (information of response.data){
      console.log(information.name);
      var name = information.name;
      var email = information.email;
      var address = information.address;
      var phone = information.phone;
      result += `
      Name : ${name}
      <br>
      Email : ${email}
      <br>
      Address : ${address}
      <br>
      Phone Number : ${phone}
      `
      
     }
     console.log(result);

     document.getElementById("userform").innerHTML += result;


    });
   },
  },
  created:function(){
   this.fetchAllData();
  }
 });