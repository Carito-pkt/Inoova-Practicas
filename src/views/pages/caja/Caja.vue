<template>
  <jc-template module="Caja" page="Caja chica">
    <template v-slot:body>
      <div class="row">
        <div class="col-12 col-sm-7">
          <div class="row">
            <div class="col-12">
              <div class="d-flex align-items-center px-2">
                <h6>MOVIMIENTOS </h6>
                <button
                  type="button"
                  class="btn btn-icon-only btn-rounded btn-outline-dark mb-0 ms-2 btn-sm d-flex align-items-center justify-content-center ms-auto"
          
                  data-bs-placement="bottom"
                  data-bs-toggle="modal" data-bs-target="#movimientoModal"
                >
                  <i class="fas fa-plus"  aria-hidden="true"></i>
                </button>
                        <div class="modal fade" id="movimientoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo movimiento</h5>
        <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12">
            <div class="form-group has-success">
              <label for="">Monto</label>
              <input
                type="text"
                placeholder=""
                v-model.number="movimiento.monto"
                class="form-control "
               
              />
            </div>
          </div>
          <div class="col-12">
            <div class="form-group has-success">
              <label for="">Tipo de movimiento</label>
              <select name="" id="" class="form-control" v-model="movimiento.tipo">
                <option value="1">INGRESO</option>
                <option value="2">EGRESO</option>
              </select>
            </div>
          </div>
        
          <div class="col-12">
            <div class="form-group has-success">
              <label for="">Motivo</label>
              <input
                type="text"
                placeholder=""
                v-model="movimiento.motivo"
                class="form-control "
               
              />
            </div>
          </div>
          
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button  type="button" class="btn bg-gradient-primary" data-bs-dismiss="modal" @click="Save()">Continuar</button>
      </div>
    </div>
  </div>
</div>
              </div>
              <div class="table-responsive p-0" style="min-height: 30vh">
                <table
                  class="table align-items-center justify-content-center mb-0"
                >
                  <thead>
                    <tr>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 text-start"
                      >
                        DETALLE
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 text-start"
                      >
                        MONTO
                      </th>
                     
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                      ></th>
                    </tr>
                  </thead>
                  <tbody>
                   <tr v-for="(m,i) in model.movimientos" :key="i">
                          <td>
                            <div class="d-flex px-1 py-1">
                              <div class="text-xxs">
                               {{m.fecha}}
                              </div>
                              <div
                                class="d-flex flex-column justify-content-center"
                              >
                                <h6 class="mb-0 text-xxs">
                                  , {{m.motivo}}
                                </h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <h6>                  <span class="badge text-xxs" :class="m.tipo==1?'badge-success':'badge-danger'">{{m.tipo==1?'+':'-'}} {{Number(m.monto).toFixed(2)}} </span>
</h6>
                          </td>
                         
                          <td class="align-middle text-center text-xxs">
                            <a
                            href="javascript:void(0);"
                            @click="DeleteItem(m.id)"
                            data-bs-toggle="tooltip"
                            data-bs-original-title="Delete product"
                          >
                            <i
                              class="fas fa-trash text-secondary"
                              aria-hidden="true"
                            ></i>
                          </a>
                          </td>
                        </tr>
                  </tbody>
                </table>
              </div>
            </div>

          </div>
        </div>
        <div class="col-sm-5">
          <div class="card card-pricing">
            <div
              class="card-header bg-gradient-dark text-center pt-4 pb-5 position-relative"
            >
              <div class="z-index-1 position-relative">
                <h1 class="text-white mt-2 mb-0"><small></small>{{Number(model.monto_caja).toFixed(2)}}</h1>
                <h6 class="text-white">Total</h6>
              </div>
            </div>
            <div class="position-relative mt-n5" style="height: 50px">
              <div class="position-absolute w-100">
                <svg
                  class="waves waves-sm"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  viewBox="0 24 150 40"
                  preserveAspectRatio="none"
                  shape-rendering="auto"
                >
                  <defs>
                    <path
                      id="card-wave"
                      d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z"
                    ></path>
                  </defs>
                  <g class="moving-waves">
                    <use
                      xlink:href="#card-wave"
                      x="48"
                      y="-1"
                      fill="rgba(255,255,255,0.30"
                    ></use>
                    <use
                      xlink:href="#card-wave"
                      x="48"
                      y="3"
                      fill="rgba(255,255,255,0.35)"
                    ></use>
                    <use
                      xlink:href="#card-wave"
                      x="48"
                      y="5"
                      fill="rgba(255,255,255,0.25)"
                    ></use>
                    <use
                      xlink:href="#card-wave"
                      x="48"
                      y="8"
                      fill="rgba(255,255,255,0.20)"
                    ></use>
                    <use
                      xlink:href="#card-wave"
                      x="48"
                      y="13"
                      fill="rgba(255,255,255,0.15)"
                    ></use>
                    <use
                      xlink:href="#card-wave"
                      x="48"
                      y="16"
                      fill="rgba(255,255,255,0.99)"
                    ></use>
                  </g>
                </svg>
              </div>
            </div>
            <div class="card-body text-center p-3">
            
              <div class="row">
<div class=" col-12 col-lg-6 mt-1 text-center">
<div class="border-dashed border-1 border-secondary border-radius-md py-1">
<h6 class="text-primary text-sm text-gradient mb-0">INGRESOS</h6>
<h4 class="font-weight-bolder text-xs"><span class="small"> </span><span id="state1" countto="23980">{{Number(model.ingresos).toFixed(2)}}</span></h4>
</div>
</div>
<div class=" col-12 col-lg-6 mt-1 text-center">
<div class="border-dashed border-1 border-secondary border-radius-md py-1">
<h6 class="text-primary text-sm text-gradient mb-0">GASTOS</h6>
<h4 class="font-weight-bolder text-xs"><span class="small"> </span><span id="state1" countto="23980">{{model.egresos>0?'-':''}} {{Number(model.egresos).toFixed(2)}}</span></h4>
</div>
</div>
<div class=" col-12 col-lg-6 mt-1 text-center">
<div class="border-dashed border-1 border-secondary border-radius-md py-1">
<h6 class="text-primary text-sm text-gradient mb-0">VENTAS</h6>
<h4 class="font-weight-bolder text-xs"><span class="small"> </span><span id="state1" countto="23980">  {{Number(model.monto_ventas).toFixed(2)}}</span></h4>
</div>
</div>
<div class=" col-12 col-lg-6  mt-1 text-center">
<div class="border-dashed border-1 border-secondary border-radius-md py-1">
<h6 class="text-primary text-sm text-gradient mb-0">COMPRAS</h6>
<h4 class="font-weight-bolder text-xs"><span class="small"> </span><span id="state1" countto="23980"> {{model.monto_compras>0?'-':''}} {{Number(model.monto_compras).toFixed(2)}}</span></h4>
</div>
</div>

</div>
           
              <a
                href="javascript:void(0);"
                @click="Cerrar()"
                class="btn bg-gradient-dark w-100 mt-4 mb-0"
              >
                 <i class="fas fa-inbox mx-2"></i> CERRAR / ABRIR CAJA
              </a>
            </div>
          </div>
        </div>
      

      </div>
    </template>
  </jc-template>
</template>
<script>
import axios from "../../../axios.js";
import { useToast } from "vue-toastification";
import { mapActions, mapState } from "vuex";

const toast = useToast();
export default {
  props: {
    title: {
      type: String,
      default: "",
    },
    add: {
      type: String,
      default: "",
    },
    edit: {
      type: String,
      default: "",
    },
    modelApi: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      articulos: [],
      categorias: [],
      marcas: [],
      cart: [],
      marca:'all',
      categoria:'all',
      categoriaMode: 1,
      buscar: "",
      tipo:1,
      item:{
        cantidad:1,
        precio:0,
        articulo:{}
    
      },
      modalEdit:false,
      operacion:{
        cliente:'PUBLICO GENERAL',
        motivo:'',
      },
      movimiento:{
        tipo:1,
        monto:0,
        motivo:'',
      },
      model:{
        movimientos:[]
      }
    };
  },
  computed: {
    ...mapState(['user']),
   total() {
      return this.cart.reduce(
        (total, item) => total + item.precio * item.cantidad,
        0
      );
    },
   
  },
  methods: {
    ...mapActions(['getAmosisUser']),
    async GET_DATA(path) {
      const response = await axios.get(path);
      return response.data;
    },
 
    async loadData() {
      await Promise.all([this.GET_DATA('cajas/'+this.user.caja_id)]).then((v) => {
        this.model = v[0];
       
      });
    },
   
    async Guardar(){
      let self = this;
      let loader = this.$loading.show();
      try{

          this.movimiento.caja_id = this.user.caja_id;
        await axios.post('cajaMovimientos',this.movimiento);
         const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: "btn btn-success",
          cancelButton: "btn btn-danger",
        },
        buttonsStyling: false,
      });
      swalWithBootstrapButtons
          .fire({
            title: "Guardado!",
            text: "Se ha guardado correctamente",
            icon: "success",
            showCancelButton: false,
            confirmButtonText: "OK!",
            // cancelButtonText: "No!",
            reverseButtons: false,
          })
          .then(async (result) => {
           
               let loader = self.$loading.show();
              self.Clean()
              try {
                await self.loadData()
              } catch (error) {
                console.log(error);
              }finally{
                loader.hide();
              }
           
            
            })
      }catch(e){
        console.log(e);
         swalWithBootstrapButtons.fire(
          "Lo sentimos :(",
          "No hemos podido realizar tu petición.",
          "error"
        );
      }finally{
        loader.hide();
      }
    },
     Save() {
     
       let self = this;
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: "btn btn-success",
          cancelButton: "btn btn-danger",
        },
        buttonsStyling: false,
      });
      swalWithBootstrapButtons
          .fire({
            title: "Estas Seguro?",
            text: "Deseas realizar esta operación?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Si!",
            cancelButtonText: "No!",
            reverseButtons: true,
          })
          .then(async(result) => {
            if (result.isConfirmed) {
             await self.Guardar()
            } else if (
              /* Read more about handling dismissals below */
              result.dismiss === Swal.DismissReason.cancel
            ) {
              // self.$router.back();
            }
          });
    },
    Clean(){
      this.movimiento = {
        tipo:1,
        monto:0,
        motivo:'',
      };
    },
      async DeleteItem2(id){
       let loader = this.$loading.show();
      try {
        const response = await axios.delete('cajaMovimientos/'+id);
        console.log(response);
        await this.loadData()
      } catch (error) {
        console.log(error);
      }finally{
        loader.hide();
      }
    },
     async DeleteItem(id){
      let self = this
      const swalWithBootstrapButtons = Swal.mixin({
customClass: {
  confirmButton: 'btn btn-success',
  cancelButton: 'btn btn-danger'
},
buttonsStyling: false
})

        swalWithBootstrapButtons.fire({
  title: 'Eliminar movimiento?',
  text: "Este cambio es irreversible",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonText: 'Si!',
  cancelButtonText: 'No!',
  reverseButtons: true
}).then(async (result) => {
  if (result.isConfirmed) {
    self.DeleteItem2(id)
  }
})
     
    },
      async Cerrar2(){
       let loader = this.$loading.show();
      try {
        const caja ={
          user_id:this.user.id,
          caja_id:this.user.caja_id,
        }
        const response = await axios.put('cajas/'+caja.caja_id,caja);
        let user = this.user;
        user.caja_id = response.data.id;
        localStorage.setItem('getAmosisUser',JSON.stringify(user));
        this.getAmosisUser()
        await this.loadData()
      } catch (error) {
        console.log(error);
      }finally{
        loader.hide();
      }
    },
     async Cerrar(){
      let self = this
      const swalWithBootstrapButtons = Swal.mixin({
customClass: {
  confirmButton: 'btn btn-success',
  cancelButton: 'btn btn-danger'
},
buttonsStyling: false
})

        swalWithBootstrapButtons.fire({
  title: 'Cerrar caja?',
  text: "Se aperturara una nueva caja",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonText: 'Si Cerrar!',
  cancelButtonText: 'No!',
  reverseButtons: true
}).then(async (result) => {
  if (result.isConfirmed) {
    self.Cerrar2()
  }
})
     
    },
  },
  mounted() {
    this.$nextTick(async () => {
      let loader = this.$loading.show();
      try {
        await this.loadData();
      } catch (error) {
        console.log(error);
      } finally {
       
        loader.hide();
      }
    });
  },
};
</script>
<style>
.showModal{
  display:block !important;
  opacity: 1 !important;
}
</style>