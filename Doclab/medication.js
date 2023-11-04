axios.get('medication.php',{action:'fetchall'})
.then(response=>{
  console.log(response.data);
})

var application = new Vue({
    el:'#crudApp',
    data:{
     allData:'',
     myModel:false,
     actionButton:'Insert',
     dynamicTitle:'Add Data',
    },
    methods:{
     fetchAllData:function(){
      axios.post('medication.php', {
       action:'fetchall'
      }).then(function(response){
        result = '';
       application.allData = response.data;
       for (information of response.data){
        
        var medicationname = information.MedicationName;
        var dosage = information.Dosage;
        var notes = information.Notes;
       
        result += `
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 pt-5" >
            <div class="blog-card has-before has-after revealed" data-reveal="bottom">
              <div class="meta-wrapper">
                <div class="card-meta">
                  <span class="span" id="title">${medicationname}</span>
                </div>
              </div>
              <p class="card-text d-lg-block">
              ${dosage}
            </p>              
            <p class="card-text d-lg-block">
                ${notes}
              </p>
            </div>
          </div>`
        
       }

       document.getElementById("data").innerHTML += result;
  
       console.log(result);
      });
     },
    },
    created:function(){
     this.fetchAllData();
    }
   });