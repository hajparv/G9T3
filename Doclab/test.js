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
      axios.post('action.php', {
       action:'fetchall'
      }).then(function(response){
        result = '';
       application.allData = response.data;
       for (information of response.data){
        var name = information.name;
        var location = information.location;
        var date = information.record_date;
        console.log(location);
        result += `
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 pt-5">
            <div class="blog-card has-before has-after" data-reveal="bottom">
              <div class="meta-wrapper">
                <div class="card-meta">
                  <ion-icon name="folder-outline"></ion-icon>
                  <span class="span" id="title">${name}</span>
                </div>
              </div>
              <h3 class="headline-sm card-title"></h3>
              <time class="title-sm date" datetime="2022-01-28">${date}</time>
              <p class="card-text d-lg-block">
                ${location}
              </p>
              <a href="#" class="btn-text title-lg">Read More</a>
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