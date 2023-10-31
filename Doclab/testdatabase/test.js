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
       application.allData = response.data;
      });
     },
     openModel:function(){
      application.first_name = '';
      application.last_name = '';
      application.actionButton = "Insert";
      application.dynamicTitle = "Add Data";
      application.myModel = true;
     },
     submitData:function(){
      if(application.first_name != '' && application.last_name != '')
      {
       if(application.actionButton == 'Insert')
       {
        axios.post('action.php', {
         action:'insert',
         firstName:application.first_name, 
         lastName:application.last_name
        }).then(function(response){
         application.myModel = false;
         application.fetchAllData();
         application.first_name = '';
         application.last_name = '';
         alert(response.data.message);
        });
       }
       if(application.actionButton == 'Update')
       {
        axios.post('action.php', {
         action:'update',
         firstName : application.first_name,
         lastName : application.last_name,
         hiddenId : application.hiddenId
        }).then(function(response){
         application.myModel = false;
         application.fetchAllData();
         application.first_name = '';
         application.last_name = '';
         application.hiddenId = '';
         alert(response.data.message);
        });
       }
      }
      else
      {
       alert("Fill All Field");
      }
     },
     fetchData:function(id){
      axios.post('action.php', {
       action:'fetchSingle',
       id:id
      }).then(function(response){
       application.first_name = response.data.first_name;
       application.last_name = response.data.last_name;
       application.hiddenId = response.data.id;
       application.myModel = true;
       application.actionButton = 'Update';
       application.dynamicTitle = 'Edit Data';
      });
     },
     deleteData:function(id){
      if(confirm("Are you sure you want to remove this data?"))
      {
       axios.post('action.php', {
        action:'delete',
        id:id
       }).then(function(response){
        application.fetchAllData();
        alert(response.data.message);
       });
      }
     }
    },
    created:function(){
     this.fetchAllData();
    }
   });