<template>
  <div class="row">
    <div class="col-md-12">

      <slot name="body">

      </slot>
    </div>

    <div class="col-md-12">
      <button class="btn bg-gradient-dark w-100" @click="Save()">
        Guardar
      </button>
    </div>
  </div>
</template>
<script>
import axios from "../axios.js";
export default {
  props: {
    model: {
      type: Object,
      default: () => {},
    },
    modelApi: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
     
    };
  },
  methods: {
      async Save(){
      let self = this
      const swalWithBootstrapButtons = Swal.mixin({
customClass: {
  confirmButton: 'btn btn-success',
  cancelButton: 'btn btn-danger'
},
buttonsStyling: false
})
let loader = this.$loading.show()
      try {
        const response = await axios.put(this.modelApi+'/'+this.model.id,this.model);
        console.log(response);
             swalWithBootstrapButtons.fire({
  title: 'Guardado!',
  text: "Peticion exitosa!",
  icon: 'success',
  showCancelButton: false,
  confirmButtonText: 'Si!',

  reverseButtons: false
}).then((result) => {
  if (result.isConfirmed) {
    self.$router.back()
  } 
})
      } catch (error) {
        console.log(error);
      }finally{
        loader.hide()
      }
    }
  },
  mounted() {
    this.$nextTick(() => {});
  },
};
</script>
