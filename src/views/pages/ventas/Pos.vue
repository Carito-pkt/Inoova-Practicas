<template>
  <jc-template module="Ventas" page="POS">
    <template v-slot:body>
      <div class="row">
        <div class="col-12 col-sm-7">
          <div class="row">
            <div class="col-12">
              <div class="card bg-gradient-dark">
                <div class="card-header bg-transparent py-2 px-3">
                  <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                      <div class="input-group input-group-lg">
                        <span
                          class="input-group-text text-white bg-transparent border-0"
                        >
                          <i
                            class="ni ni-archive-2 text-lg"
                            aria-hidden="true"
                          ></i>
                        </span>
                        <input
                          type="text"
                          class="form-control bg-transparent border-0 text-white"
                          placeholder="Buscar..."
                          v-model="buscar"
                        v-on:keyup.enter="BuscarEnter()"
                        />
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 my-auto ms-auto">
                      <div class="input-group input-group-lg">
                        <span
                          class="input-group-text text-white bg-transparent border-0"
                        >
                          <i class="ni ni-box-2 text-lg" aria-hidden="true"></i>
                        </span>
                        <select
                          name=""
                          id=""
                          class="form-control bg-transparent border-0 text-white"
                          v-model="marca"
                        >
                          <option value="all" class="text-dark">Todas las marcas</option>
                          <option v-for="(m,i) in marcas" :key="i" :value="m.nombre" class="text-dark">{{m.nombre}}</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 py-2" style="min-height: 60vh">
              <div class="row">
                <template v-for="(m,i) in filterBuscar" :key="i" >
                    <div v-if="m.stock>0" class="col-3" >
                  <jc-card-producto :model="m" :tipo="tipo" @emitir="addItem" ></jc-card-producto>
                </div>
                </template>
             
              </div>
            </div>
            <div class="col-xl-12">
              <div class="card">
                <div class="card-body d-flex p-3">
                  <h6 class="my-auto">Categoría</h6>
                  <div class="nav-wrapper position-relative ms-auto w-50">
                    <ul class="nav nav-pills nav-fill p-1" role="tablist">
                      <li
                        class="nav-item active"
                        role="presentation"
                        
                      >
                        <a
                          class="nav-link mb-0 px-0 py-1"
                          data-bs-toggle="tab"
                          href="#cam1"
                         
                          role="tab"
                          aria-controls="cam1"
                          aria-selected="true"
                        >
                          {{categoria=='all'?'Todas':categoria}}
                        </a>
                      </li>
                   
                    </ul>
                  </div>
                  <div class="dropdown pt-2">
                    <a
                      href="javascript:;"
                      class="text-secondary ps-4"
                      id="dropdownCam"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                    >
                      <i class="fas fa-ellipsis-v" aria-hidden="true"></i>
                    </a>
                    <ul
                      class="dropdown-menu dropdown-menu-end me-sm-n4 px-2 py-3"
                      aria-labelledby="dropdownCam"
                      style=""
                    >
                      <li @click="categoria='all'">
                       <a
                          class="dropdown-item border-radius-md"
                          href="javascript:;"
                          >Todo</a
                        >
                      </li>
                    <li v-for="(m,i) in categorias" :key="i" @click="categoria=m.nombre">
                     <a
                          class="dropdown-item border-radius-md"
                          href="javascript:;"
                          >{{m.nombre}}</a
                        >
                    </li>
                    
                    </ul>
                  </div>
                </div>
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
                <h1 class="text-white mt-2 mb-0"><small></small>{{Number(total).toFixed(2)}}</h1>
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
              <div class="d-flex align-items-center px-2">
                <h6>CARRITO</h6>
                <button
                  type="button"
                  class="btn btn-icon-only btn-rounded btn-outline-dark mb-0 ms-2 btn-sm d-flex align-items-center justify-content-center ms-auto"
                  data-bs-toggle="tooltip"
                  data-bs-placement="bottom"
                  @click="Clean()"
                >
                  <i class="fas fa-trash"  aria-hidden="true"></i>
                </button>
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
                        Artículo
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 text-start"
                      >
                        Cantidad
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 text-start"
                      >
                        Total
                      </th>
                      <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                      ></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(m,i) in cart" :key="i">
                      <td class="text-start">
                        <p class="text-xxs font-weight-bold mb-0 text-start">
                          {{m.articulo.nombre}}
                        </p>
                      </td>
                      <td class="text-start">
                        <p class="text-xxs font-weight-bold mb-0 text-start">
                          {{m.cantidad}}  {{m.articulo.medida.codigo}}
                        </p>
                      </td>
                      <td class="text-start">
                        <p class="text-xxs font-weight-bold mb-0 text-start">
                         {{Number(m.precio*m.cantidad).toFixed(2)}}
                        </p>
                      </td>
                      <td>
                        <div class="input-group input-group-sm">
                          <button
                            class="btn btn-outline-primary mb-0 btn-sm"
                            type="button"
                            @click="editItem(m)"
                          >
                            <i class="fas fa-pen"></i>
                          </button>
                          <button
                            class="btn btn-outline-danger mb-0 btn-sm"
                            type="button"
                            @click="deleteItem(i)"
                          >
                            <i class="fas fa-times"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <a
                href="javascript:void(0);"
                @click="Guardar()"
                class="btn bg-gradient-dark w-100 mt-4 mb-0"
              >
                 <i class="fas fa-save mx-2"></i> GUARDAR
              </a>
            </div>
          </div>
        </div>
                  <div class="modal fade" :class="modalEdit?'showModal':''" id="AjusteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar artículo</h5>
        <button type="button" class="btn-close text-dark" @click="modalEdit=false" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
         
          <div class="col-12">
            <div class="form-group has-success">
              <label for="">Articulo</label>
              <input
                type="text"
                placeholder=""
                disabled
                v-model="item.articulo.nombre"
                class="form-control "
               
              />
            </div>
          </div>
         
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Precio Compra</label>
              <input
                type="text"
                placeholder=""
                v-model.number="item.articulo.compra"
                class="form-control "
               
              />
            </div>
          </div>
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Precio Venta</label>
              <input
                type="text"
                placeholder=""
                v-model.number="item.articulo.venta"
                class="form-control "
               
              />
            </div>
          </div>
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Precio</label>
              <input
                type="text"
                placeholder=""
                v-model.number="item.precio"
                class="form-control "
               
              />
            </div>
          </div>
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Cantidad</label>
              <input
                type="text"
                placeholder=""
                v-model.number="item.cantidad"
                class="form-control "
               @change="ValidarStock()"
              />
            </div>
          </div>
        
          
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" @click="modalEdit=false"  class="btn bg-gradient-secondary w-100" data-bs-dismiss="modal">Cerrar</button>
      
      </div>
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
import { mapState } from "vuex";


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
    filterCategoria(){
      let buscar = this.categoria
      if(buscar=='all'){
        return this.articulos
      }else{
        return this.articulos.filter(a=>a.categoria.nombre==buscar)
      }
    },
    filterMarca(){
      let buscar = this.marca
      if(buscar=='all'){
        return this.filterCategoria
      }else{
        return this.filterCategoria.filter(a=>a.marca.nombre==buscar)
      }
    },
    filterBuscar(){
      let buscar = this.buscar
      if(buscar==''){
        return this.filterMarca
      }else{
        return this.filterMarca.filter(a=>a.nombre.toLowerCase().indexOf(buscar.toLowerCase())>-1 || a.barra.toLowerCase().indexOf(buscar.toLowerCase())>-1)
      }
    }
  },
  methods: {
    async GET_DATA(path) {
      const response = await axios.get(path);
      return response.data;
    },
   BuscarEnter() {
    let buscar = this.buscar;
       let item = this.articulos.filter(item => item.nombre.toLowerCase().indexOf(buscar.toLowerCase()) > -1 || item.barra.toLowerCase().indexOf(buscar.toLowerCase()) > -1);
       if(item.length > 0){
        this.addItem(item[0]);
        this.buscar = "";
        this.$refs.buscar.focus();
       }
    },
    async loadData() {
      await Promise.all([this.GET_DATA('inventarios'),this.GET_DATA('marcas'),this.GET_DATA('categorias')]).then((v) => {
        this.articulos = v[0];
        this.marcas = v[1];
        this.categorias = v[2];
      });
    },
    editItem(m){
      this.item = m;
      this.modalEdit = true;
    
    },
    deleteItem(i){
     this.cart.splice(i,1);
    
    },
    ValidarStock(){
      if(this.item.cantidad > this.item.articulo.stock){
        this.item.cantidad = this.item.articulo.stock;
        toast.error("No hay suficiente stock");
      }
    },
    addItem(m){
      
      let buscar = this.cart.filter(item => item.articulo.id == m.id);
      if(buscar.length > 0){
        let stock = buscar[0].articulo.stock
        if(buscar[0].cantidad < stock){
          buscar[0].cantidad++;
        }else{
          toast.warning('No hay stock suficiente');
        }

        
      }else{
      const item = {
        articulo: m,
        cantidad: 1,
        precio: this.tipo==1? m.venta: m.compra,
      };
      this.cart.push(item);
      }
    },
    async Guardar(){
      let self = this;
      let loader = this.$loading.show();
      try{
        this.operacion.cart = this.cart;
        this.operacion.total = this.total;
        this.operacion.caja_id = this.user.caja_id;
        await axios.post('ventas',this.operacion);
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
    Clean(){
      this.cart = [];
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