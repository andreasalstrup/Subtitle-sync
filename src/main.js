import { createApp } from 'vue'
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faSave, faLinkedin } from '@fortawesome/free-solid-svg-icons'

import App from './App.vue'
import router from './router'

library.add(faSave);

createApp(App)
.use(router)
.component('fa', FontAwesomeIcon)
.mount('#app')