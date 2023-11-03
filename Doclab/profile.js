
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

 var application = new Vue({
  el:'#crudApp',
  data:{
   allData:'',
   myModel:false,
   
  },
  methods:{
   fetchAllData:function(){
    axios.post('payment.php', {
     action:'fetchall'
    }).then(function(response){
      result = '';
     application.allData = response.data;
     console.log(response.data)
     for (information of response.data){
      var clinicName = information.clinicName;
      var cost = information.cost;
      var date = information.date;
      var duedate = information.duedate;
      var receiptID = information.receiptID;
      var status = information.status;

      result += `
        <tr>
        <td>${receiptID}</td>
        <td>${clinicName}</td>
        <td>${date}</td>
        <td>${status}</td>
        <td>${cost}</td>
        <td>${duedate}</td>
        </tr>

      `
      
     }
     console.log(result);
     document.getElementById("payment").innerHTML += result;


    });
   },
  },
  created:function(){
   this.fetchAllData();
  }
 });