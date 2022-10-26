import { createRouter, createWebHistory } from "vue-router";
import Dashboard from "../views/pages/dashboard/Index.vue";
import MedidaList from "../views/pages/config/medida/List.vue";
import MedidaAdd from "../views/pages/config/medida/Add.vue";
import MedidaEdit from "../views/pages/config/medida/Edit.vue";
import MarcaList from "../views/pages/config/marca/List.vue";
import MarcaAdd from "../views/pages/config/marca/Add.vue";
import MarcaEdit from "../views/pages/config/marca/Edit.vue";
import UsuarioList from "../views/pages/usuario/List.vue";
import UsuarioAdd from "../views/pages/usuario/Add.vue";
import UsuarioEdit from "../views/pages/usuario/Edit.vue";
import CategoriaList from "../views/pages/config/categoria/List.vue";
import CategoriaAdd from "../views/pages/config/categoria/Add.vue";
import CategoriaEdit from "../views/pages/config/categoria/Edit.vue";
import ArticuloList from "../views/pages/config/articulo/List.vue";
import ArticuloAdd from "../views/pages/config/articulo/Add.vue";
import ArticuloEdit from "../views/pages/config/articulo/Edit.vue";
import InventarioList from "../views/pages/inventario/general/List.vue";
import InventarioKardex from "../views/pages/inventario/general/Edit.vue";
import VentaPOS from "../views/pages/ventas/Pos.vue";
import VentaList from "../views/pages/ventas/List.vue";
import VentaInvoice from "../views/pages/ventas/Invoice.vue";
import CompraPOS from "../views/pages/compras/Pos.vue";
import CompraInvoice from "../views/pages/compras/Invoice.vue";
import CompraList from "../views/pages/compras/List.vue";
import CajaPage from "../views/pages/caja/Caja.vue";
import LoginPage from "../views/pages/auth/Login.vue";

const routes = [
  {
    path: "/",
    component: Dashboard,
    props: {
      default: true,
      title: "Resumen",
      add: "/config/medida/add",
      edit: "/config/medida/edit/",
      modelApi: 'dashboard'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/medida",
    component: MedidaList,
    props: {
      default: true,
      title: "MEDIDAS",
      add: "/config/medida/add",
      edit: "/config/medida/edit/",
      modelApi: 'medidas'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/medida/add",
    component: MedidaAdd,
    props: {
      default: true,
      title: "Medida",
      modelApi: 'medidas'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/medida/edit/:id",
    component: MedidaEdit,
    props: true
  },
  {
    path: "/config/marca",
    component: MarcaList,
    props: {
      default: true,
      title: "MARCAS",
      add: "/config/marca/add",
      edit: "/config/marca/edit/",
      modelApi: 'marcas'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/marca/add",
    component: MarcaAdd,
    props: {
      default: true,
      title: "Marca",
      modelApi: 'marcas'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/marca/edit/:id",
    component: MarcaEdit,
    props: true
  },
  {
    path: "/config/categoria",
    component: CategoriaList,
    props: {
      default: true,
      title: "CATEGORIAS",
      add: "/config/Categoria/add",
      edit: "/config/Categoria/edit/",
      modelApi: 'categorias'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/categoria/add",
    component: CategoriaAdd,
    props: {
      default: true,
      title: "Categoria",
      modelApi: 'categorias'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/categoria/edit/:id",
    component: CategoriaEdit,
    props: true
  },
  {
    path: "/config/articulo",
    component: ArticuloList,
    props: {
      default: true,
      title: "ARTICULOS",
      add: "/config/articulo/add",
      edit: "/config/articulo/edit/",
      modelApi: 'articulos'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/articulo/add",
    component: ArticuloAdd,
    props: {
      default: true,
      title: "Articulo",
      modelApi: 'articulos'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/config/articulo/edit/:id",
    component: ArticuloEdit,
    props: true
  },
  {
    path: "/usuario",
    component: UsuarioList,
    props: {
      default: true,
      title: "USUARIOS",
      add: "/usuario/add",
      edit: "/usuario/edit/",
      modelApi: 'users'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/usuario/add",
    component: UsuarioAdd,
    props: {
      default: true,
      title: "Usuarios",
      modelApi: 'users'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/usuario/edit/:id",
    component: UsuarioEdit,
    props: true
  },
  {
    path: "/inventario",
    component: InventarioList,
    props: {
      default: true,
      title: "INVENTARIO GENERAL",
      add: "/config/articulo/add",
      edit: "/inventario/kardex/producto/",
      modelApi: 'inventarios'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/inventario/kardex/producto/:id",
    component: InventarioKardex,
    props: true
  },
  {
    path: "/ventas",
    component: VentaPOS,

    props: {
      default: true,
      title: "POS",
      add: "/config/articulo/add",
      edit: "/inventario/kardex/producto/",
      modelApi: 'inventarios'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/ventas/list",
    component: VentaList,
    props: {
      default: true,
      title: "Ventas",
     
      edit: "/ventas/invoice/",
      modelApi: 'ventas'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/ventas/invoice/:id",
    component: VentaInvoice,
    props:true, 
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/compras",
    component: CompraPOS,
    props: {
      default: true,
      title: "POS",
      add: "/config/articulo/add",
      edit: "/inventario/kardex/producto/",
      modelApi: 'inventarios'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/compras/list",
    component: CompraList,
    props: {
      default: true,
      title: "Compras",
     
      edit: "/compras/invoice/",
      modelApi: 'compras'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/compras/invoice/:id",
    component: CompraInvoice,
    props:true, 
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/caja",
    component: CajaPage,
    props: {
      default: true,
      title: "Caja chica",
      add: "/config/articulo/add",
      edit: "/inventario/kardex/producto/",
      modelApi: 'cajas'
    }, meta: {
      requiresAuth: false
    }
  },
  {
    path: "/auth/login",
    component: LoginPage,
    props: {
      default: true,
    }, meta: {
      requiresAuth: false
    }
  }
];

const history = createWebHistory();

const router = createRouter({
  history,
  routes,
});
router.beforeEach((to, from, next) => {
  const user = JSON.parse(localStorage.getItem("getAmosisUser"))

  if (to.matched.some(record => record.meta.requiresAuth) && !user) {

    next('/auth/login')

  }
  next()


})
export default router;
