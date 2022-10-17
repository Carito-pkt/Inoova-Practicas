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
  if(/^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(nombre) && nombre != "" && nombre.length>1){
    return true;
  }
  else{
    if(nombre == ""){
      error += 'El nombre no puede quedar vacio. \n';
    }
    else if (nombre.length<2){
      error += 'El nombre no puede ser ' + nombre + '. Se necesita una longitud mayor a un caracter. \n'
    }
    else{
      error += 'El nombre no puede ser ' + nombre + '. \n'
    }
    return false;
  }
}

function validarUsuario(usuario){
  if(/^[a-zA-Z0-9\_\-]{4,16}$/.test(usuario) && usuario != ""){
    return true;
  }
  else{
    if(usuario == ""){
      error += 'El usuario no puede quedar vacio. \n';
    }
    else{
      error += 'El usuario no puede ser ' + usuario + '. \n'
    }
    return false;
  }
}

function validarEmail(email){
  if(/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/.test(email) && email != ""){
    return true;
  }
  else{
    if(email == ""){
      error += 'El correo no puede quedar vacio. \n';
    }
    else{
      error += 'El correo no puede ser ' + email + '. \n'
    }
    return false;
  }
}

function validarPass(pass){
  if(/^.{4,12}$/.test(pass) && pass.length>6){
    return true;
  }
  else{
    if (pass == ""){
      error += 'La contraseña no puede quedar vacía. \n'
    }
    else if (pass.length < 7){
      error += 'La contraseña no puede tomar ese valor! Esta de ser mayor a 6 dígitos. \n'
    }
    return false;
  }
}

function validaciones(atributo, valor){
  let pasa = true;
  switch(atributo){
    case 'username':
      pasa = validarUsuario(valor);
      //console.log('El valor de username es: ' + valor);
      break;
    case 'nombre':
      pasa = validarNombre(valor);
      //console.log('El valor de nombre es: ' + valor);
      break;
    case 'email':
      pasa = validarEmail(valor);
      //console.log('El valor de email es: ' + valor);
      break;
    case 'password':
      pasa = validarPass(valor);
      //console.log('El valor de password es: ' + valor);
      break;
  }
  return pasa;
}

function validar(objeto){
  let atributos = Object.keys(objeto);
  let datos = Object.values(objeto)
  let aprovado = false;
  let confirmado = true;
  //console.log(atributos, datos);
  for (let i = 0; i < atributos.length; i++){
    aprovado = validaciones(atributos[i], datos[i]);
    //console.log(atributos[i], datos[i], aprovado);
    if(!aprovado) confirmado = aprovado;
  }
  //console.log(atributos.length, datos.length);
  return confirmado;
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

      try {   
        if(validar(this.model)){
      
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
              title: "Ups!",
              text: error,
              icon: "error",
              showCancelButton: true,
              confirmButtonText: "CHA",
              cancelButtonText: "LE!",
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
