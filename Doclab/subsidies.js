axios.get('subsidies.php',{action:'fetchall'})
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
      axios.post('subsidies.php', {
       action:'fetchall'
      }).then(function(response){
        result = '';
       application.allData = response.data;
       for (information of response.data){
        
        var subsidyID = information.SubsidyID;
        var SubsidyName = information.SubsidyName;
        var desc = information.SubsidyDescription;
       
        result += `
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 pt-5" >
            <div class="blog-card has-before has-after revealed" data-reveal="bottom">
              <div class="meta-wrapper">
                <div class="card-meta">
                <h3 class="headline-sm card-title">${SubsidyName}</h3>
                </div>
              </div>
              <p class="card-text d-lg-block">
                ${desc}
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