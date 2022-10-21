Vue.createApp({
  data() {
    return {
      q:'2254',
      url_base:'',
      url_base_app:'',
      url_base_now:'',
      datas: '',    
      ven_coms:'',
      ven_coms_g:'',
      vc:'',

    isLoading : false,
  }
  },
  mounted(){
    this.url_base = window.location.protocol + '//' + window.location.host;
    this.url_base_app = window.location.protocol + '//' + window.location.host + '/adminphp/';
    // this.get_ven_all()
    this.get_ven_coms()
  },
  watch: {
    
  },
  methods: {
    get_ven_coms(){
      // this.isLoading = true
      axios.post('../../server/asu/get_ven_coms.php')
      .then(response => {
          if (response.data.status) {
              this.ven_coms = response.data.respJSON;
              this.ven_coms_g = response.data.respJSON_G;

          } 
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })
    },

    get_ven_all(){
      // this.isLoading = true
      axios.get('../../server/asu/report/reportK.php')
      .then(response => {
          // console.log(response.data.respJSON);
          if (response.data.status) {
              this.datas = response.data.respJSON;
          } 
      })
      .catch(function (error) {
          console.log(error);
      })
      .finally(() => {
        this.isLoading = false;
      })
    },

    print(vcid){
      // this.isLoading = true
      axios.post('../../server/asu/report/report.php',{vcid:vcid})    
          .then(response => {
              if (response.data.status) {
                var print = JSON.stringify(response.data);    
                localStorage.setItem("print",print);
                window.open('./report-print.php','_blank')
              }else{
                this.alert('warning',response.data.message,0)
              } 
          })
          .catch(function (error) {
              console.log(error);
          });

    }, 

    view(vcid){
      axios.post('../../server/asu/report/report.php',{vcid:vcid})    
          .then(response => {
              if (response.data.status) {
                // this.alert('success',response.data.message,1000)
                this.datas = response.data.respJSON; 
                this.vc = response.data.vc; 
                this.$refs.show_modal.click()
              }else{
                this.alert('warning',response.data.message,0)
              }
          })
          .catch(function (error) {
              console.log(error);
          })
          .finally(() => {
            this.isLoading = false;
          })
    },

    con_f(ven_month){
      // console.log('test')
      Swal.fire({
        title: 'Are you sure?',
        text: "You is this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, is it!'
      }).then((result) => {
        if (result.isConfirmed) {
          this.isLoading = true;
          axios.post('../../server/asu/report/conf.php',{ven_month:ven_month})    
              .then(response => {
                  if (response.data.status) { 
                    this.alert('success',response.data.message,1000)
                    this.$refs.close_modal.click()
                  }else{
                    this.alert('warning',response.data.message,0)
                  }
              })
              .catch(function (error) {
                  console.log(error);
              })
              .finally(() => {
                this.isLoading = false;
              })
                  }
    })
    }, 

    getYM(dat){
      let MyDate = new Date(dat);
      let MyDateString;
      // MyDate.setDate(MyDate.getDate() + 20);
      MyDateString = MyDate.getFullYear() + '-' + ("0" + (MyDate.getMonth()+1)).slice(-2)
      return ("0" + MyDate.getDate()).slice(-2)+ '-' + ("0" + (MyDate.getMonth()+1)).slice(-2) + '-' + (MyDate.getFullYear() + 543)
  },
  date_thai(day){
    var monthNamesThai = ["มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤษจิกายน","ธันวาคม"];
    var dayNames = ["วันอาทิตย์ที่","วันจันทร์ที่","วันอังคารที่","วันพุทธที่","วันพฤหัสบดีที่","วันศุกร์ที่","วันเสาร์ที่"];
    var monthNamesEng = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var dayNamesEng = ['Sunday','Monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
    var d = new Date(day);
    return d.getDate() + ' ' + monthNamesThai[d.getMonth()] + "  " + (d.getFullYear() + 543)
  },    
  date_thai_dt(day){
    var monthNamesThai = ["มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤษจิกายน","ธันวาคม"];
    var dayNames = ["วันอาทิตย์ที่","วันจันทร์ที่","วันอังคารที่","วันพุทธที่","วันพฤหัสบดีที่","วันศุกร์ที่","วันเสาร์ที่"];
    var monthNamesEng = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var dayNamesEng = ['Sunday','Monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
    var d = new Date(day);
    return dayNames[d.getDay()] + ' '+ d.getDate() + ' ' + monthNamesThai[d.getMonth()] + "  " + (d.getFullYear() + 543)
  },    
  date_thai_my(day){
    var monthNamesThai = ["มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤษจิกายน","ธันวาคม"];
    var dayNames = ["วันอาทิตย์ที่","วันจันทร์ที่","วันอังคารที่","วันพุทธที่","วันพฤหัสบดีที่","วันศุกร์ที่","วันเสาร์ที่"];
    var monthNamesEng = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var dayNamesEng = ['Sunday','Monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
    var d = new Date(day);
    return monthNamesThai[d.getMonth()] + "  " + (d.getFullYear() + 543)
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
  
        

}).mount('#asuReport')
