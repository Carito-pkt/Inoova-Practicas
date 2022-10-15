<template>
  <jc-template>
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
                 <router-link to="/config/medida/add">Home</router-link>
                </div>
              </div>
            </div>
          </div>
          <div class="card-body px-2 pb-0">
            <div class="table-responsive">
              <table
                    class="table table-flush "
                   
                  >
                    <thead class="thead-light">
                      <tr>
                        <th >
                          #
                        </th>
                        <th >
                          Codigo
                        </th>
                        <th >
                          Nombre
                        </th>
                       
                        <th >
                          
                        </th>
                       
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(m,i) in list" :key="i">
                        <td>
                         {{i+1}}
                        </td>
                        <td>
                          <div class="d-flex">
                            
                            <h6 class="ms-3 my-auto">{{m.codigo}}</h6>
                          </div>
                        </td>
                        <td>
                         {{m.nombre}}
                        </td>
                        
                        <td class="text-sm">
                          <a
                            href="javascript:;"
                            data-bs-toggle="tooltip"
                            data-bs-original-title="Preview product"
                          >
                            <i
                              class="fas fa-eye text-secondary"
                              aria-hidden="true"
                            ></i>
                          </a>
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
                  </table>
            </div>
          </div>
        </div>
      </div>
    </template>
  </jc-template>
</template>
<script>
import axios from '../../../axios.js';
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
    async DeleteItem(id){
      try {
        const response = await axios.delete('medidas/'+id);
        console.log(response);
        await this.loadData()
      } catch (error) {
        console.log(error);
      }
    },
    async loadData(){
       await Promise.all([this.GET_DATA('medidas')]).then((v)=>{
        this.list = v[0];
      
      });
    }
  },
  mounted() {
    this.$nextTick(async () => {
      await this.loadData();
  
    });
  },
}
</script>