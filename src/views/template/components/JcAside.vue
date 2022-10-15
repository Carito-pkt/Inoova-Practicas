<template>

    <aside
      class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3"
      id="sidenav-main"
      data-color="dark"
      style="overflow: hidden;"
    >
      <div class="sidenav-header">
        <i
          class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
          aria-hidden="true"
          id="iconSidenav"
        ></i>
        <a
          class="navbar-brand m-0"
          href="javascript:void(0)"
      
        >
          <!-- <img
            src="/assets/img/logo-ct-dark.png"
            class="navbar-brand-img h-100"
            alt="main_logo"
          /> -->
          <span class="ms-1 font-weight-bold">GRUPO INNOVA - FADE</span>
        </a>
      </div>

      <div
        class="collapse navbar-collapse w-auto h-auto"
        id="sidenav-collapse-main"
      >
      <perfect-scrollbar>
        <ul class="navbar-nav">

         <template v-for="(m,i) in item">
          <li v-if="m.title" class="nav-item mt-3">
          <hr class="horizontal dark">
            <h6
              class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"
            >
              {{m.text}}
            </h6>
          </li>
           <li v-else class="nav-item">
            <a
              data-bs-toggle="collapse"
              :href="'#'+m.name"
              class="nav-link"
              :class="m.module==module ? 'active' : ''"
              aria-controls="pagesExamples"
              role="button"
              aria-expanded="false"
            >
              <div
                class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center d-flex align-items-center justify-content-center me-2 mt-0"
              >
                <i   :class=" m.module==module ? m.icon+' text-white' : m.icon+' text-dark'" style="top:0!important;"></i>
              </div>
              <span class="nav-link-text ms-1">{{m.text}}</span>
            </a>
            <div class="collapse" :id="m.name" :class="m.module==module ? 'show' : ''">
              <ul class="nav ms-4 ps-3">
                <li class="nav-item " v-for="(s,x) in m.children" :class="s.page==page ? 'active' : ''">
                <router-link  class="nav-link "
                     :class="s.page==page ? 'active' : ''"
                     :to="s.path"
                     >
                   <span class="sidenav-mini-icon"> {{s.mini}} </span>
                    <span class="sidenav-normal"> {{s.text}} </span>
                </router-link>
                
                </li>
                
              </ul>
            </div>
          </li>
         </template>
        </ul>
        </perfect-scrollbar>
      </div>
     
    </aside>
</template>
<script>
import item from './nav/item'

export default{
   props:{
   
    module: {
      type: String,
      default: '',
    },
    page:{
      type: String,
      default: '',
    
    }
  },
 data(){
    return{
      item:item,
    }
  }
}
</script>

<style >

.ps {
  height: 80vh;
}
</style>