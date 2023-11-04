axios.get('labtest.php',{action:'fetchall'})
.then(response=>{
  console.log('response',response.data)})

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
      axios.post('labtest.php', {
       action:'fetchall'
      }).then(function(response){
        result = '';
       application.allData = response.data;
       
       for (information of response.data){
       console.log('information', information); 
        var testName = information.TestName;
        var res = information.ResultValue;
        var date = information.ResultDate;
        result += `
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 pt-5" >
            <div class="blog-card has-before has-after revealed" data-reveal="bottom">
              <div class="meta-wrapper">
                <div class="card-meta">
                  <span class="span" id="title">${testName}</span>
                </div>
              </div>
              <p class="card-text d-lg-block">
                Result: ${res} 
              </p>
              <time class="title-sm date" datetime=${date}>Result taken on: ${date}</time>


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