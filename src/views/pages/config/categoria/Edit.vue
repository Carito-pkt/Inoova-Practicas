<template>
  <jc-template  module="Configuración" page="Categorias">
    <template v-slot:body >
      <div class="row justify-content-md-center">

      
      <div class="col-12  col-sm-6">
        <div class="card">
          <div class="card-header pb-0">
            <div class="d-lg-flex">
              <div>
                <h5 class="mb-0">Editar {{title}}</h5>
                
              </div>
             <div class="ms-auto my-auto mt-lg-0 mt-4">
                <div class="ms-auto my-auto">
                  <button
                   @click="$router.back()"
                    class="btn bg-gradient-info btn-sm mb-0"
              
                    > 
                    <i class="ni ni-bold-left"></i> Regresar
                    </button
                  >
             
                </div>
              </div>
            </div>
          </div>
          <div class="card-body">
            <jc-edit :model="model" :modelApi="modelApi" >
                <template v-slot:body>
                  <div class="row">
                    
                <div class="col-md-12">
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
  props:{
    title:{
      type:String,
      default:'Categoria'
    },
    id:{
      type:String,
      default:''
    },
    modelApi:{
      type:String,
      default:'categorias'
    }
  },
  data() {
    return {
      model:{
        nombre:'',
        codigo:'',
      }
    }
  },
   methods: {
    async GET_DATA(path){
      const response = await axios.get(path);
      return response.data;
    },

  },
  mounted() {
    this.$nextTick(async () => {
      let loader = this.$loading.show()
      try{
      await Promise.all([this.GET_DATA(this.modelApi+'/'+this.id)]).then((v)=>{
        this.model = v[0];
      
      });
      }catch(e){
        console.log(e)
      }finally{
        loader.hide()
      }
    });
  },
}
</script>