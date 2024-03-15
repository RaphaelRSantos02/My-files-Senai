// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules:[
      'nuxt-primevue',
      '@sidebase/nuxt-auth'
  ],
  primevue: {
    components: {
      include: ['Button']
    }
  },
  css: [
    '~/assets/style/global-project.scss',
    '~/assets/style/global-variables.scss'
  ],
  auth: {
    baseURL: 'http://localhost:8000',
    provider: {
      type: 'local',
      endpoints: {
        signIn: { path: '/token/login', method: 'post'},
        signOut: { path: '/token/logout', method: 'post' },
        signUp: { path: '', method: 'get' },
        getSession: { path: '/users', method: 'get' },
        //refresh: { }
      },
      token: {
        signInResponseTokenPointer: '/auth_token',
        //maxAgeInSeconds: 600,
        type: 'Token'
      },
      //refreshToken: { signInResponseRefreshTokenPointer : '',
      //maxAgeInSeconds: 600, 
    //},
      pages: {
        login: '/'
      }
    }
  }
})
