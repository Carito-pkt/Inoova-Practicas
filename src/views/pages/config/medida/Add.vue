<template>
  <jc-template module="Configuración" page="Medidas">
    <template v-slot:body>
      <div class="row justify-content-md-center">
        <div class="col-12 col-sm-6">
          <div class="card">
            <div class="card-header pb-0">
              <div class="d-lg-flex">
                <div>
                  <h5 class="mb-0">Agregar {{ title }}</h5>
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
              <jc-add :model="model" :modelApi="modelApi" @reset="reset">
                <template v-slot:body>
                  <div class="row">
                     <div class="col-md-12">
                  <div class="form-group has-success">
                    <label for="">CODIGO</label>
                    <input
                      type="text"
                      placeholder=""
                      v-model="model.codigo"
                      class="form-control "
                         :class="model.codigo.length>0?'is-valid':''"
                      />
                     
                  </div>
                </div>
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
              </jc-add>
           
            </div>
          </div>
        </div>
      </div>
    </template>
  </jc-template>
</template>
<script>
export default {
  props: {
    title: {
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
      model: {
        nombre: "",
        codigo: "",
      },
    };
  },
  methods: {
   reset(){
    this.model.nombre = "";
    this.model.codigo = "";
   }
  },
  mounted() {
    this.$nextTick(() => {});
  },
};
</script>
