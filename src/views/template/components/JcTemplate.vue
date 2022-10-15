<template>
  <div class="g-sidenav-show bg-gray-100 g-sidenav-pinned" :class="[dark==true?'dark-version':'']" id="body">
    <jc-aside  :module="module" :page="page"></jc-aside>
    <main
      class="main-content position-relative max-height-vh-100 h-100 border-radius-lg"
    >
    <jc-nav :module="module" :page="page"></jc-nav>
     

      <div class="container-fluid py-4">
       <slot name="body">
        
       </slot>
        
        <jc-footer></jc-footer>
      </div>
    </main>
    <div class="fixed-plugin " :class="[plugin==true?'show':'']">
      <a class="fixed-plugin-button text-dark position-fixed px-3 py-2" @click="PluginChange()">
        <i class="fa fa-cog py-2"> </i>
      </a>
      <div class="card shadow-lg blur">
        <div class="card-header pb-0 pt-3 bg-transparent">
          <div class="float-start">
            <h5 class="mt-3 mb-0">Amosis Point of Sale {{new Date().getFullYear()}}</h5>
            <p>Programmed by Jhony creativo.</p>
          </div>
          <div class="float-end mt-4">
            <button
            @click="PluginChange()"
              class="btn btn-link text-dark p-0 fixed-plugin-close-button"
            >
              <i class="fa fa-close"></i>
            </button>
          </div>
        </div>
        <hr class="horizontal dark my-1" />
        <div class="card-body pt-sm-3 pt-0">
         

          <div class="mt-3">
            <h6 class="mb-0">Free version.</h6>
            <p class="text-sm">This version is free and its sale is prohibited.</p>
          </div>
       
          <hr class="horizontal dark mb-1 d-xl-block d-none" />
          <div class="mt-2 d-xl-block d-none">
            <h6 class="mb-0">Light/Dark</h6>
          </div>
          <div class="form-check form-switch ps-0 d-xl-block d-none">
            <input
              class="form-check-input mt-1 ms-auto"
              type="checkbox"
              id="dark-version"
              @click="darkMode()"
            />
          </div>
          <hr class="horizontal dark my-sm-4" />
         <a href="https://www.facebook.com/profile.php?id=100082805217232" target="_blank" class="btn btn-facebook btn-icon w-100">
    <span class="btn-inner--icon"><i class="fab fa-facebook mx-2"></i></span>
    <span class="btn-inner--text">Facebook</span>
</a>
         <a href="https://www.patreon.com/jhonycreativo" target="_blank" class="btn btn-dark btn-icon w-100">
    <span class="btn-inner--icon"><i class="fab fa-patreon mx-2"></i></span>
    <span class="btn-inner--text">Patreon</span>
</a>

<a href="https://www.youtube.com/channel/UC0ugOxwyYFNbZCW31BEYyNw" target="_blank" class="btn btn-youtube btn-icon w-100">
    <span class="btn-inner--icon"><i class="fab fa-youtube mx-2"></i></span>
    <span class="btn-inner--text">YouTube</span>
</a>
        
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState,mapActions } from 'vuex'
export default {
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
  computed: {
    ...mapState(['plugin','dark']),
  },
  methods: {
    ...mapActions(['PluginChange','darkMode']),
  },
}
</script>