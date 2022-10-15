<template>
  <jc-template module="Configuración" page="Articulos">
    <template v-slot:body class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header pb-0">
            <div class="d-lg-flex">
              <div>
                <h5 class="mb-0">{{title}}</h5>
                
              </div>
              <div class="ms-auto my-auto mt-lg-0 mt-4">
                <div class="ms-auto my-auto">
                  <router-link
                    :to="add"
                    class="btn bg-gradient-primary btn-sm mb-0"
              
                    >+&nbsp; Agregar</router-link
                  >
                
                </div>
              </div>
            </div>
          </div>
          <div class="card-body px-4 pb-0">
            <div class="table-responsive">
              <jc-table
                    class="table table-flush "
                   
                  >
                    <template v-slot:thead class="thead-light">
                      <thead>

                        <tr>
                          <th class="text-left p-0" >
                          #
                        </th>
                       
                        <th class="text-left p-0">
                          COD. BARRA
                        </th>
                        <th class="text-left p-0">
                          NOMBRE
                        </th>
                       
                        <th class="text-left p-0">
                          MARCA
                        </th>
                        <th class="text-left p-0">
                          CATEGORIA
                        </th>
                        <th class="text-left p-0">
                          MEDIDA
                        </th>
                       
                        <th >
                          
                          </th>
                       
                      </tr>
                          </thead>
                    </template>
                    <template v-slot:tbody >
                      <tbody>

                        <tr v-for="(m,i) in list" :key="i">
                        <td class="text-left p-0">
                          {{i+1}}
                        </td>
                        <td class="text-left p-0">
                          <h6 class="">{{m.barra}}</h6>
                          <div class="d-flex">
                            
                          </div>
                        </td>
                      
                        <td class="text-left p-0">
                          <h6 class="">{{m.nombre}}</h6>
                          <div class="d-flex">
                            
                          </div>
                        </td>
                        <td class="text-left p-0">
                          {{m.marca.nombre}}
                        </td>
                        <td class="text-left p-0">
                          {{m.categoria.nombre}}
                        </td>
                      
                        <td class="text-left p-0">
                          {{m.medida.nombre}}
                        </td>
                      
                        
                        <td class="text-center">
                          
                          <router-link
                            :to="edit+m.id"
                            class="mx-3"
                           
                          >
                            <i
                              class="fas fa-user-edit text-secondary"
                              aria-hidden="true"
                            ></i>
                          </router-link>
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
                     
                    </template>
                  </jc-table>
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
      default:''
    },
    add:{
      type:String,
      default:''
    },
    edit:{
      type:String,
      default:''
    },
    modelApi:{
      type:String,
      default:''
    },
  },
  data() {
    return {
      list:[],
    }
  },
  methods: {
    async GET_DATA(path){
      const response = await axios.get(path);
      return response.data;
    },
    async DeleteItem2(id){
       let loader = this.$loading.show();
      try {
        const response = await axios.delete(this.modelApi+'/'+id);
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
  title: 'Eliminar?',
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
    async loadData(){
       await Promise.all([this.GET_DATA(this.modelApi)]).then((v)=>{
        this.list = v[0];
      
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
}
</script>