axios.get('healthscreening.php',{action:'fetchall'})
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
      axios.post('healthscreening.php', {
       action:'fetchall'
      }).then(function(response){
        result = '';
       application.allData = response.data;
       for (information of response.data){
        
               
        var name = information.ScreeningName;
        var description = information.ScreeningDescription;

        result += `
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 pt-5" >
            <div class="blog-card has-before has-after revealed" data-reveal="bottom">
              <div class="meta-wrapper">
                <div class="card-meta">
                  <span class="span" id="title">${name}</span>
                </div>
              </div>
              <h3 class="headline-sm card-title"></h3>
              <p class="card-text d-lg-block">
                ${description}
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