<template>
    <div class="card p-0" @click="emitir()">
                    <div class="card-header mx-4 mt-2 p-1 text-center">
                      <div
                        class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg"
                      >
                        <i
                          class="fas fa-archive opacity-10"
                          aria-hidden="true"
                        ></i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-1 text-center">
                      <h6 class="text-center mb-0 text-xxs">
                        <i class="fas fa-barcode"></i> {{model.barra}}
                      </h6>
                      <span class="text-xs">{{model.nombre}}</span>
                      <hr class="horizontal dark my-2" />
                      <h5 class="mb-0 text-sm">{{tipo==2?model.compra:model.venta}}</h5>
                    </div>
                  </div>
</template>

<script>
export default {
    name: 'jc-card-producto',
    props: {
        model: {
            type: Object,
            default: () => ({})
        },
       tipo:{
        type:Number,
        default:1
       }
    },
    data() {
        return {
           
        }
    },
    created() {
       
    },
    methods: {
       emitir(){
        this.$emit('emitir',this.model);
       }
    }
}
</script>