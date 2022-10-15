import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from "./router/index";
import store from './store'
import JcAside from './views/template/components/JcAside.vue'
import JcNav from './views/template/components/JcNav.vue'
import JcFooter from './views/template/components/JcFooter.vue'
import JcTemplate from './views/template/components/JcTemplate.vue'
import JcTable from './components/JcTable.vue'
import JcAdd from './components/JcAdd.vue'
import JcEdit from './components/JcEdit.vue'
import JcCardProducto from './components/JcCardProducto.vue'
import VueLoading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
import Toast from "vue-toastification";
// Import the CSS or use your own!
import "vue-toastification/dist/index.css";
import PerfectScrollbar from 'vue3-perfect-scrollbar'
import 'vue3-perfect-scrollbar/dist/vue3-perfect-scrollbar.css'
const app = createApp(App);
app.use(PerfectScrollbar)
app.use(VueLoading);
const options = {
    // You can set your default options here
};

app.use(Toast, options);
app.component("jc-aside", JcAside);
app.component("jc-nav", JcNav);
app.component("jc-footer", JcFooter);
app.component("jc-template", JcTemplate);
app.component("jc-table", JcTable);
app.component("jc-edit", JcEdit);
app.component("jc-add", JcAdd);
app.component("jc-card-producto", JcCardProducto);
app.use(router)
app.use(store)
app.mount('#app')
