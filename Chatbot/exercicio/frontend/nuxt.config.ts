// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: [
    'nuxt-primevue'
  ],
  primevue: {
    components: {
      include: ['Button', 'Fieldset', 'Avatar']
    }    
  },
  css: ['primevue/resources/themes/mdc-dark-indigo/theme.css']
})
