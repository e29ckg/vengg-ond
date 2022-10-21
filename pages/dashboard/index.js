Vue.createApp({
  data() {
    return {
      q:'2254',
      url_base:'',
      url_base_app:'',
      url_base_now:'',
      datas: [
        {
            id: 'a',
            title: 'my event',
            start: '2022-09-01',
            extendedProps: {
                uid: 5555,
                uname: '',
                ven_date: '',
                ven_time: '',
                DN: '',
                ven_month: '',
                ven_com_id: '',
                st: '',

            }
        }
    ],
    data_event:{ 
        uid: 5555,
        uname: '',
        ven_date: '',
        ven_time: '',
        DN: '',
        ven_month: '',
        ven_com_id: '',
        st: '',
    },
    profiles:[],

    ven_coms  :[],
    ven_coms_index:'',

    ven_com_id  : '',
    ven_month   : '',
    ven_com_name : '',
    ven_com_num : '',
    DN          : '',
    u_role      : '',
    price       : '',

    ssid :'',
    my_v :[],
    vh :[],
    d_now:'',
    my_v_show : 'false',
    ch_v1:'',
    ch_v2:'',
    users:[],
    u_id2:'',
    u_name2:'',
    act:'a',
    ch_a:false,
    ch_b:false,

    isLoading : false,
  }
  },
  mounted(){
    this.url_base = window.location.protocol + '//' + window.location.host;
    this.ssid = localStorage.getItem("ss_uid")
    this.ven_month = new Date();
    this.get_vens()
    this.cal_render()
    
  },
  watch: {
    q(){
      this.ch_search_pro()
    },
   
  },
  methods: {
    cal_render(){
      var calendarEl = this.$refs['calendar'];
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView : 'dayGridMonth',
        initialDate : this.ven_month,
        firstDay    : 1,
        height      : 1240,
        locale      : 'th',
        firstDay    : 1,
        // allDay      : true,
        eventOrder  : 'start',
        // allDayDefault : true,
        // allDayContent : true,
        // displayEventTime: false, 
        events      : this.datas,
        eventColor  : '#378006',
        eventClick: (info)=> {
            // console.log(info.event.id +' '+info.event.title)
            // console.log(info.event.extendedProps)
            this.cal_click(info.event.id)
        },
               
        
      })
      calendar.render();
    },
    cal_click(id){
      if(this.ssid != ''){
        axios.post('../../server/dashboard/get_ven.php',{id:id,uid:this.ssid})
            .then(response => {
              // console.log(response.data);
              if (response.data.status) {
                this.data_event = response.data.respJSON
                this.my_v = response.data.my_v
                this.vh = response.data.vh
                this.d_now = response.data.d_now
                this.get_users(this.data_event.ven_name,this.data_event.u_role)
                this.$refs['show_modal'].click()  
              }else{               
                this.alert('warning',response.data.message ,0)  
              }
          })
          .catch(function (error) {        
          console.log(error);  
        });
        // this.$refs.show_modal.click()
      }else{
        this.alert('warning','กรุณา Login..' ,0) 
      }
    },
    get_vens(){
      axios.get('../../server/dashboard/get_vens.php')
      .then(response => {
          // console.log(response.data.respJSON);
          if (response.data.status) {
              this.datas = response.data.respJSON;
              this.cal_render()
          } 
      })
      .catch(function (error) {
          console.log(error);
      });
    },

    change_a(my_v_index){
      this.act = 'a'
      this.$refs.show_modal_b.click()
      this.ch_v1 = this.my_v[my_v_index]
      this.ch_v2 = this.data_event

    },
    change_b(uid,u_name){
      console.log(uid)
      console.log(u_name)
      this.act = 'b'
      this.ch_v1 = this.data_event
      this.user_id2 = uid
      this.u_name2 = u_name
      this.$refs.show_modal_b.click()
    },
    change_save(){
      this.isLoading = true;
      axios.post('../../server/dashboard/change_save.php',{ch_v1:this.ch_v1, ch_v2:this.ch_v2})
      .then(response => {
          // console.log(response.data);
          if (response.data.status) {
            this.get_vens()
            this.$refs.close_modal.click()
            this.$refs.close_modal_b.click()
            this.alert('success',response.data.message,1000) 
            window.open('../history/index.php','_self')
          } else{
            this.alert('warning',response.data.message,0) 
          }
          this.act = 'a'
      })
      .catch(function (error) {
        this.alert('warning',error,0)
        console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })      
    },
    change_save_bb(){
      this.isLoading = true;
      axios.post('../../server/dashboard/change_save_b.php',{ch_v1:this.ch_v1, user_id2:this.user_id2, u_name2:this.u_name2})
      .then(response => {
          console.log(response.data);
          if (response.data.status) {
            this.get_vens()
            this.$refs.close_modal.click()
            this.$refs.close_modal_b.click()
            this.alert('success',response.data.message,1000) 
            window.open('../history/index.php','_blank')
          } else{
            this.alert('warning',response.data.message,0) 
          }
          // this.act = 'a'
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })
      
    },
    get_users(ven_name,uvn){
      this.isLoading = true;
      axios.post('../../server/dashboard/get_users.php',{ven_name:ven_name, uvn:uvn})
      .then(response => {
          console.log(response.data);
          if (response.data.status) {
            this.users =response.data.respJSON
            // this.alert('success',response.data.message,1000) 
          } else{
            // this.alert('warning',response.data.message,0) 
          }
          
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })      

    },
   
    
    close_m(){
      this.ch_a =false
      this.ch_b =false
    },
    close_m_b(){
      this.$refs.close_modal.click()
    },

    date_thai(day){
      var monthNamesThai = ["มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤษจิกายน","ธันวาคม"];
      var dayNames = ["วันอาทิตย์ที่","วันจันทร์ที่","วันอังคารที่","วันพุทธที่","วันพฤหัสบดีที่","วันศุกร์ที่","วันเสาร์ที่"];
      var monthNamesEng = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      var dayNamesEng = ['Sunday','Monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
      var d = new Date(day);
      return d.getDate() + ' ' + monthNamesThai[d.getMonth()] + "  " + (d.getFullYear() + 543)
    }, 

    alert(icon,message,timer=0){
      swal.fire({
        icon: icon,
        title: message,
        showConfirmButton: false,
        timer: timer
      });
    },
  },
  
        

}).mount('#dashboard')
