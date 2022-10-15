<template>
  <jc-template module="Configuración" page="Articulos">
    <template v-slot:body>
      <div class="row justify-content-md-center">
        <div class="col-12 col-sm-6">
          <div class="card">
            <div class="card-header pb-0">
              <div class="d-lg-flex">
                <div>
                  <h5 class="mb-0">Editar {{ title }}</h5>
                </div>
                <div class="ms-auto my-auto mt-lg-0 mt-4">
                  <div class="ms-auto my-auto">
                    <button
                      @click="$router.back()"
                      class="btn bg-gradient-info btn-sm mb-0"
                    >
                      <i class="ni ni-bold-left"></i> Regresar
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body">
              <jc-edit :model="model" :modelApi="modelApi" >
                <template v-slot:body>
                  <div class="row">
                    
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">BARRA</label>
                    <input
                      type="text"
                      placeholder=""
                      v-model="model.barra"
                      class="form-control "
                      :class="model.barra.length>0?'is-valid':''"
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">NOMBRE</label>
                    <input
                      type="text"
                      placeholder=""
                      v-model="model.nombre"
                      class="form-control "
                      :class="model.nombre.length>0?'is-valid':''"
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">VENTA</label>
                    <input
                      type="text"
                      placeholder=""
                      v-model.number="model.venta"
                      class="form-control "
           
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">COMPRA</label>
                    <input
                      type="text"
                      placeholder=""
                      v-model.number="model.compra"
                      class="form-control "
                  
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">STOCK MINIMO</label>
                    <input
                      type="text"
                      placeholder=""
                      v-model.number="model.stock_minimo"
                      class="form-control "
                      
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">MEDIDA</label>
                    <select name="" class="form-control" id="" v-model="model.medida_id" >
                      <option v-for="(m,i) in medidas" :key="i" :value="m.id">{{m.nombre}} - {{m.codigo}}</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">CATEGORIA</label>
                    <select name="" class="form-control" id="" v-model="model.categoria_id" >
                      <option v-for="(m,i) in categorias" :key="i" :value="m.id">{{m.nombre}}</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group has-success">
                    <label for="">MARCA</label>
                    <select name="" class="form-control" id="" v-model="model.marca_id" >
                      <option v-for="(m,i) in marcas" :key="i" :value="m.id">{{m.nombre}}</option>
                    </select>
                  </div>
                </div>
                  </div>
                </template>
              </jc-edit>
           
            </div>
          </div>
        </div>
      </div>
    </template>
  </jc-template>
</template>
<script>
import axios from '../../../../axios.js';

export default {
  props: {
    title: {
      type: String,
      default: "Articulo",
    },
    id: {
      type: String,
      default: "",
    },
    modelApi: {
      type: String,
      default: "articulos",
    },
  },
  data() {
    return {
      model: {
        nombre: "",
        marca_id: "",
        categoria_id: "",
        medida_id: "",
        barra: "",
        venta:0,
        compra:0,
        stock_minimo:0,
      },
      marcas: [],
      medidas: [],
      categorias: [],
    };
  },
  methods: {
   reset(){
    this.model.nombre = "";
    this.model.barra = "";
   },
     async GET_DATA(path){
      const response = await axios.get(path);
      return response.data;
    },
     async loadData(){
       await Promise.all([this.GET_DATA('marcas'),this.GET_DATA('medidas'),this.GET_DATA('categorias'),this.GET_DATA(this.modelApi+"/"+this.id)]).then((v)=>{
        this.marcas = v[0];
        this.medidas = v[1];
        this.categorias = v[2];
        this.model = v[3]
        if(this.marcas.length>0){
          this.model.marca_id = this.marcas[0].id;
        }
        if(this.medidas.length>0){
          this.model.medida_id = this.medidas[0].id;
        }
        if(this.categorias.length>0){
          this.model.categoria_id = this.categorias[0].id;
        }
      });
    }
  },
   mounted() {
    this.$nextTick(async () => {
      let loader = this.$loading.show();
      try{
        await this.loadData();

      }catch(error){
        console.log(error);
      }finally{
        loader.hide();
      }
  
    });
  },
};
</script>
