<template>
  <main class="main-content main-content-bg mt-0 ps">
    <section>
      <div class="page-header min-vh-75">
        <div class="container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
              <div class="card card-plain mt-8">
                <div class="card-header pb-0 text-start">
                  <h3 class="font-weight-bolder text-info text-gradient">
                    Bienvenido al punto de ventas MKT INNOVA
                  </h3>
                  <p class="mb-0">Ingresa tu email o usuario y tu password para iniciar.</p>
                </div>
                <div class="card-body">
                  <div role="form" class="text-start">
                    <label>Email / Usuario</label>
                    <div class="mb-3">
                      <input
                        type="text"
                        v-model="email"
                        class="form-control"
                        placeholder="Email"
                        aria-label="Email"
                      />
                    </div>
                    <label>Password</label>
                    <div class="mb-3">
                      <input
                        type="password"
                        v-model="password"
                        class="form-control"
                        placeholder="Password"
                        aria-label="Password"
                      />
                    </div>
                   
                    <div class="text-center">
                      <button
                        type="button"
                        class="btn bg-gradient-info w-100 mt-4 mb-0"
                        @click="iniciar()"
                      >
                        Ingresar
                      </button>
                    </div>
                  </div>
                </div>
               
              </div>
            </div>
            <div class="col-md-6">
              <div
                class="oblique position-absolute top-0 h-100 d-md-block d-none me-n8"
              >
                <div
                  class="oblique-image bg-cover position-sticky ms-auto h-100 w-55 z-index-0 ms-n6"
                  style="
                    background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Escudo_de_la_Escuela_Superior_Polit%C3%A9cnica_de_Chimborazo.png/640px-Escudo_de_la_Escuela_Superior_Polit%C3%A9cnica_de_Chimborazo.png');
                  "
                ></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div class="ps__rail-x" style="left: 0px; bottom: 0px">
      <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px"></div>
    </div>
    <div class="ps__rail-y" style="top: 0px; right: 0px">
      <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px"></div>
    </div>
  </main>
</template>
<script>
import axios from '../../../axios.js'
import { mapActions } from 'vuex';
export default {
    
    data() {
        return {
            email:'',
            password:'',
          
            usuario :{}
        }
    },computed:{
        
    },
        methods: {
          ...mapActions(['getAmosisUser']),
            async iniciar(){
                let loader = this.$loading.show();
                 const swalWithBootstrapButtons = Swal.mixin({
customClass: {
  confirmButton: 'btn btn-success',
  cancelButton: 'btn btn-danger'
},
buttonsStyling: false
})
                try {
                    const data = {
                        email : this.email,
                        password : this.password,
                    }
                    const res =  await axios.post('iniciar-sesion',data);
                    this.usuario = res.data;
            
                     localStorage.setItem("getAmosisUser",JSON.stringify(this.usuario));
                     this.getAmosisUser()
                   this.$router.push('/');
                    
                   
                }  catch (error) {
                    
                swalWithBootstrapButtons.fire(
          "Lo sentimos :(",
          "No hemos podido iniciar sesión, intenta de nuevo",
          "error"
        );
                }finally{
                    loader.hide()
                }

            },
           
           
           
        },
        beforeMount() {
            
            },
        mounted() {
             this.$nextTick(async function () {
                            //  let loader = this.$loading.show(LoaderOption);

                  try {
                    
                  }catch (error) {
                  }finally{

                   
                  }
             
        })
   
        },
        updated() {
            
        },
}
</script>
