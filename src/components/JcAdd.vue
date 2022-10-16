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

var error = '';

function validarNombre(nombre){
  if(/^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(nombre.value) && nombre.value != ""){
    return true;
  }
  else{
    if(nombre.value == ""){
      error += 'El nombre no puede quedar vacio ';
    }
    else{
      error += 'El nombre no puede ser ' + nombre.value + ' '
    }
    return false;
  }
}

function validarUsuario(usuario){
  if(/^[a-zA-Z0-9\_\-]{4,16}$/.test(usuario.value) && usuario.value != ""){
    return true;
  }
  else{
    if(usuario.value == ""){
      error += 'El usuario no puede quedar vacio ';
    }
    else{
      error += 'El usuario no puede ser ' + usuario.value + ' '
    }
    return false;
  }
}

function validarEmail(email){
  if(/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/.test(email.value) && email.value != ""){
    return true;
  }
  else{
    if(email.value == ""){
      error += 'El correo no puede quedar vacio ';
    }
    else{
      error += 'El correo no puede ser ' + email.value + ' '
    }
    return false;
  }
}

function validarPass(pass){
  if(/^.{4,12}$/.test(pass.value) && pass.value.length>6){
    return true;
  }
  else{
    if (pass.value == ""){
      error += 'La contraseña no puede quedar vacía. '
    }
    else if (pass.value.length < 7){
      error += 'La contraseña no puede tomar ese valor! Esta de ser mayor a 6 dígitos '
    }
    return false;
  }
}


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
    async Save() {
      error = '';     
      let self = this;
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: "btn btn-success",
          cancelButton: "btn btn-danger",
        },
        buttonsStyling: false,
      });
      let loader = this.$loading.show();

      const nombre = document.getElementById("nombre");
      const pass = document.getElementById("pass");
      const usuario = document.getElementById("usuario");
      const email = document.getElementById("email");

      try {
        if (validarUsuario(usuario) && validarNombre(nombre) && validarEmail(email) && validarPass(pass)) {      
          const response = await axios.post(this.modelApi, this.model);
          console.log(response);
          swalWithBootstrapButtons
            .fire({
              title: "Guardado!",
              text: "Deseas guardar uno nuevo?",
              icon: "success",
              showCancelButton: true,
              confirmButtonText: "Si!",
              cancelButtonText: "No!",
              reverseButtons: false,
            })
            .then((result) => {
              if (result.isConfirmed) {
                self.$emit('reset')
              } else if (
                /* Read more about handling dismissals below */
                result.dismiss === Swal.DismissReason.cancel
              ) {
                self.$router.back();
              }
            });
        }
        else{
          swalWithBootstrapButtons
            .fire({
              title: "Error!",
              text: error,
              icon: "error",
              showCancelButton: true,
              cancelButtonText: "Intentar de nuevo",
              reverseButtons: false,
            })
        } 
      } 
      
      catch (error) {
        console.log(error);
        swalWithBootstrapButtons.fire(
          "Lo sentimos :(",
          "No hemos podido realizar tu petición.",
          "error"
        );
      } finally {
        loader.hide();
      }
    },
  },
  mounted() {
    this.$nextTick(() => {});
  },
};
</script>
