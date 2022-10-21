Vue.createApp({
  data() {
    return {
      ven_names :'',
      ven_name_form : {
        name  : '',
        DN    : '',
        srt   : ''
      },
      ven_name_form_act:'insert',
      ven_name_subs   :'',
      ven_name_sub_form : {name : '', price:'',color:''},
      ven_name_sf_act:'insert',
      isLoading : false,
    }
  },
  mounted(){
    this.url_base = window.location.protocol + '//' + window.location.host;
    this.get_ven_names()
    this.get_ven_name_subs()
  },
  watch: {
    
  },
  methods: {
    get_ven_names(){
      this.isLoading = true
      axios.post('../../server/asu/get_ven_names.php')
      .then(response => {
          
          if (response.data.status) {
              this.ven_names = response.data.respJSON;
          } 
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })
    },
    get_ven_name(id){
      this.isLoading = true
      axios.post('../../server/asu/get_ven_name.php',{id:id})
      .then(response => {
          if (response.data.status) {
            this.ven_name_form = response.data.respJSON;
          } 
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })      
    },
    ven_name_save(){
      if(this.ven_name_form.name != '' ){
          axios.post('../../server/asu/ven_name_act.php',{ven_name:this.ven_name_form, act:this.ven_name_form_act})
            .then(response => {
                if (response.data.status) {
                  this.get_ven_names()
                  let icon = 'success' 
                  this.alert(icon,response.data.message,1000)
                  this.$refs.close_ven_name_form.click()
                  this.clear_vnsf()
                }else{
                  let icon = 'warning' 
                  let message = response.data.message
                  this.alert(icon,message,0)
                } 
            })
            .catch(function (error) {
                console.log(error);
            })
      }else{
        const message = []
        if(this.ven_name_form.name == ''){message.push('กรุณากรอกข้อมูลให้ครบ')}
        let icon = 'warning' 
        this.alert(icon,message,0)
      }
    },
    clear_vnsf(){
      this.ven_name_form = {name : ''}
      this.ven_name_form_act = 'insert'
    },
    show_ven_nfi(){
      this.ven_name_form = {name : ''}
      this.ven_name_form_act = 'insert'
      this.$refs.show_ven_name_form.click()
    },
    ven_name_usf(id){
      this.ven_name_form_act = 'update'
      this.get_ven_name(id)
      this.$refs['show_ven_name_form'].click()
    },
    ven_name_del(){
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          axios.post('../../server/asu/ven_name_act.php',{ven_name:this.ven_name_form,act:'delete'})
                .then(response => {
                    
                    if (response.data.status) {
                      this.get_ven_names()
                      let icon = 'success' 
                      this.alert(icon,response.data.message,1000)
                      this.$refs.close_ven_name_form.click()
                      this.clear_vnsf()
                    }else{
                      let icon = 'warning' 
                      let message = response.data.message
                      this.alert(icon,message,0)
                    } 
                })
                .catch(function (error) {
                    console.log(error);
                  })
        }
      })

    },

    get_ven_name_subs(){
      this.isLoading = true
      axios.post('../../server/asu/get_ven_name_subs.php')
      .then(response => {
          
          if (response.data.status) {
              this.ven_name_subs = response.data.respJSON;
          } 
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })
    },
    get_ven_name_sub(id){
      this.isLoading = true
      axios.post('../../server/asu/get_ven_name_sub.php',{id:id})
      .then(response => {
          
          if (response.data.status) {
            this.ven_name_sub_form = response.data.respJSON;
          } 
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })      
    },
    clear_vnsf(){
      this.ven_name_sub_form = {name : '', price:'',color:'', act:'insert'}
    },
    ven_name_update_show_form(id){
      this.ven_name_form_act = 'update'
      this.get_ven_name(id)
      this.$refs.show_ven_name_sub_form.click()
    },
    vns_insert(ven_name_id){
      this.ven_name_sub_form.ven_name_id = ven_name_id
    },
    ven_name_sub_save(){
      if(this.ven_name_sub_form.name != '' && this.ven_name_sub_form.price != ''){
        axios.post('../../server/asu/ven_name_sub_act.php',{ven_name_sub:this.ven_name_sub_form, act:'insert'})
          .then(response => {
              if (response.data.status) {
                this.get_ven_names()
                this.get_ven_name_subs()
                this.$refs.close_vnsf.click()
                this.alert('success',response.data.message,1000)
                // this.clear_vnsf()
              }else{
                this.alert('warning',response.data.message,0)
              } 
          })
          .catch(function (error) {
              console.log(error);
          })
    }else{
      const message = []
      if(this.ven_name_sub_form.name == ''){message.push('ชื่อตำแหน่ง/หน้าที่')} 
      if(this.ven_name_sub_form.price == ''){message.push('ค่าเวร')} 
      this.alert('warning',message,0)
    }
    },
    ven_name_s_del(id){
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          axios.post('../../server/asu/ven_name_sub_act.php',{id:id, act:'delete'})
                .then(response => {
                    
                    if (response.data.status) {
                      this.get_ven_names()
                      this.get_ven_name_subs()
                      let icon = 'success' 
                      this.alert(icon,response.data.message,1000)
                      this.$refs.close_ven_name_form.click()
                      this.ven_name_sub_form = {name : '', price:'', color:''}
                    }else{
                      let icon = 'warning' 
                      let message = response.data.message
                      this.alert(icon,message,0)
                    } 
                })
                .catch(function (error) {
                    console.log(error);
                  })
        }
      })
    },
    alert(icon,message,timer=0){
      swal.fire({
      icon: icon,
      title: message,
      showConfirmButton: true,
      timer: timer
    });
  },



  },  

}).mount('#workName')
