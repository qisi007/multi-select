import Vue from 'vue';
import App from './App.vue';
import install  from "./index";
Vue.use(install)

Vue.config.productionTip = false;
import "./markdown.styl"

new Vue({
  render: h => h(App),
}).$mount('#app')
