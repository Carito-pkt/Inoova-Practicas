<template>
  <jc-template module="Inventario" page="General">
    <template v-slot:body>
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header pb-0">
              <div class="d-lg-flex">
                <div>
                  <h5 class="mb-0">Kardex de artículo</h5>
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
             
              <div class="row">
               
                <div class="col-12 col-lg-5 mx-auto">
                  <h3 class="mt-lg-0 mt-4">{{model.nombre}}</h3>
                  <div class="rating">
                    <i class="fas fa-barcode" aria-hidden="true"></i>
                    {{model.barra}} | 
                    <i class="fas fa-boxes" aria-hidden="true"></i>
                    {{model.categoria.nombre}} |
                    <i class="fas fa-bookmark" aria-hidden="true"></i>
                    {{model.marca.nombre}}
                  </div>
                  <br />
                  <div class="d-flex justify-content-between">
                    <div class="mx-1">
                      <h6 class="mb-0 mt-3">Precio Compra</h6>
                      <h5>{{Number(model.compra).toFixed(2)}}</h5>

                    </div>
                    <div class="mx-1">
                      <h6 class="mb-0 mt-3">Precio Venta</h6>
                      <h5>{{Number(model.venta).toFixed(2)}}</h5>

                    </div>
                    <div class="mx-1">
                      <h6 class="mb-0 mt-3">Ganancia Unitaria</h6>
                      <h5>{{Number(model.venta-model.compra).toFixed(2)}}</h5>

                    </div>
                  </div>
                  <span class="badge " :class="model.stock>=model.stock_minimo?'badge-success':'badge-danger'"><i class="fas fa-archive" aria-hidden="true"></i> {{Number(model.stock)}} {{model.medida.codigo}} en Stock</span>
                  <br />
                  <div class="d-flex justify-content-between">
                    <div class="mx-1">
                      <h6 class="mb-0 mt-3">Inversion</h6>
                      <h5>{{Number(model.compra *model.stock ).toFixed(2)}}</h5>

                    </div>
                    <div class="mx-1">
                      <h6 class="mb-0 mt-3">Valorizado</h6>
                      <h5>{{Number(model.venta *model.stock ).toFixed(2)}}</h5>

                    </div>
                    <div class="mx-1">
                      <h6 class="mb-0 mt-3">Ganancia</h6>
                      <h5>{{Number(model.venta *model.stock -model.compra *model.stock ).toFixed(2)}}</h5>

                    </div>
                  </div>
                  <div class="row mt-4">
                    <div class="col-lg-12">
                      <button
                        class="btn bg-gradient-primary mb-0 mt-lg-auto w-100"
                        type="button"
                        name="button"
                         data-bs-toggle="modal" data-bs-target="#AjusteModal"
                      >
                        <i class="fas fa-cog"></i>
                        Ajustar Stock
                      </button>
                      <div class="modal fade" id="AjusteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Ajuste</h5>
        <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Cantidad</label>
              <input
                type="text"
                placeholder=""
                v-model.number="inventario.cantidad"
                class="form-control "
                :class="inventario.cantidad!=0?'is-valid':''"
              />
            </div>
          </div>
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Tipo de ajuste</label>
              <select name="" id="" class="form-control" v-model="inventario.tipo">
                <option value="1">ENTRADA</option>
                <option value="2">SALIDA</option>
              </select>
            </div>
          </div>
          <div class="col-6">
            <div class="form-group has-success">
              <label for="">Precio Compra</label>
              <input
                type="text"
                placeholder=""
                v-model.number="model.compra"
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
                v-model.number="model.venta"
                class="form-control "
               
              />
            </div>
          </div>
          <div class="col-12">
            <div class="form-group has-success">
              <label for="">Motivo</label>
              <input
                type="text"
                placeholder=""
                v-model.number="inventario.motivo"
                class="form-control "
               
              />
            </div>
          </div>
          
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button v-if="inventario.tipo==1 || (inventario.tipo==2 && inventario.cantidad<=model.stock)" type="button" class="btn bg-gradient-primary" data-bs-dismiss="modal" @click="Save()">Continuar</button>
      </div>
    </div>
  </div>
</div>
                    </div>
                  </div>
                </div>
                 <div class="col-12 col-sm-7 ">
                  <h5 class="ms-1">Movimientos de stock</h5>
                  <div class="table table-responsive">
                    <table class="table align-items-center mb-0 table-sm">
                      <thead>
                        <tr>
                          <th
                            class="text-uppercase text-left text-secondary text-xxs font-weight-bolder opacity-7 px-1"
                          >
                            Detalle
                          </th>
                          <th
                            class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                          >
                            Cantidad
                          </th>
                          <th
                            class="text-uppercase text-secondary text-left text-xxs font-weight-bolder opacity-7 ps-2"
                          >
                            Compra
                          </th>
                          <th
                            class="text-left text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                          >
                            Venta
                          </th>
                          <th
                            class="text-left text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                          >
                            
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="(m,i) in model.movimientos" :key="i">
                          <td>
                            <div class="d-flex px-1 py-1">
                              <div class="text-xxs">
                               {{m.fecha}}
                              </div>
                              <div
                                class="d-flex flex-column justify-content-center"
                              >
                                <h6 class="mb-0 text-xxs">
                                  , {{m.motivo}}
                                </h6>
                              </div>
                            </div>
                          </td>
                          <td>
                            <h6>                  <span class="badge text-xxs" :class="m.tipo==1?'badge-success':'badge-danger'">{{m.tipo==1?'+':'-'}} {{Number(m.cantidad)}} {{model.medida.codigo}}</span>
</h6>
                          </td>
                          <td class="text-xxs">
                           {{Number(m.compra).toFixed(2)}}
                          </td>
                          <td class="align-middle text-sm text-xxs">
                             {{Number(m.venta).toFixed(2)}}
                          </td>
                          <td class="align-middle text-center text-xxs">
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
          </div>
        </div>
      </div>
    </template>
  </jc-template>
</template>
<script>
import axios from "../../../../axios.js";

export default {
  props: {
    title: {
      type: String,
      default: "",
    },
    id: {
      type: String,
      default: "",
    },
    modelApi: {
      type: String,
      default: "inventarios/articulo",
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
        venta: 0,
        compra: 0,
        stock_minimo: 0,
        marca:{

        },
        categoria:{

        },
        medida:{}
      },
      inventario:{
        cantidad: 0,
        tipo:1,
        motivo:'AJUSTE DE INVENTARIO'
      },
      marcas: [],
      medidas: [],
      categorias: [],
    };
  },
  methods: {
    reset() {
      this.model.nombre = "";
      this.model.barra = "";
    },
    async GET_DATA(path) {
      const response = await axios.get(path);
      return response.data;
    },
    Save() {
     
       let self = this;
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: "btn btn-success",
          cancelButton: "btn btn-danger",
        },
        buttonsStyling: false,
      });
      swalWithBootstrapButtons
          .fire({
            title: "Estas Seguro?",
            text: "Deseas realizar este ajuste?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Si, ajustar!",
            cancelButtonText: "No!",
            reverseButtons: true,
          })
          .then(async(result) => {
            if (result.isConfirmed) {
             await self.Ajustar()
            } else if (
              /* Read more about handling dismissals below */
              result.dismiss === Swal.DismissReason.cancel
            ) {
              // self.$router.back();
            }
          });
    },
     async Ajustar() {
     const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: "btn btn-success",
          cancelButton: "btn btn-danger",
        },
        buttonsStyling: false,
      });
      let loader = this.$loading.show();
      try {
        this.inventario.articulo_id = this.model.id;
        this.inventario.venta = this.model.venta;
        this.inventario.compra = this.model.compra;
        const response = await axios.post('inventarios', this.inventario);
        console.log(response);
        swalWithBootstrapButtons.fire(
          "Ajuste realizado!",
          "Se ha creado un nuevo movimiento de este producto.",
          "success"
        );
        await this.loadData()
      } catch (error) {
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
    async loadData() {
      await Promise.all([
 
        this.GET_DATA(this.modelApi + "/" + this.id),
      ]).then((v) => {
        this.model = v[0];
       
      });
    },
      async DeleteItem2(id){
       let loader = this.$loading.show();
      try {
        const response = await axios.delete('inventarios/'+id);
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
  title: 'Eliminar movimiento?',
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
