
import { createStore } from 'vuex'

const getAmosisUser=()=>{
    if (window.localStorage.getItem('getAmosisUser') !== undefined && window.localStorage.getItem('getAmosisUser')){
      let user = JSON.parse(localStorage.getItem('getAmosisUser'));
      return user
    }
    return {id:''};
  }
// ----------------------------------------------------------
// Vuex modules
// ----------------------------------------------------------
const store =  createStore({

    state: {
       
        plugin:false,
        dark:false,
        user:getAmosisUser(),
       
    },
  
    mutations: {
       
          getAmosisUser(state){
            if (window.localStorage.getItem('getAmosisUser') !== undefined && window.localStorage.getItem('getAmosisUser')){
                let user = JSON.parse(localStorage.getItem('getAmosisUser'));
                state.user= user
              }else{

                  state.user = {id:''};
              }
          },
          PluginChange(state){
            state.plugin = !state.plugin;
          },
  
          darkMode(state){
            state.dark = !state.dark;
          }
  
    },
    actions: {
        getAmosisUser (context) {
          context.commit('getAmosisUser')
        },
       
        PluginChange (context) {
          context.commit('PluginChange')
        },
        darkMode (context) {
          context.commit('darkMode')
        },
       
        
      }

})

export default store