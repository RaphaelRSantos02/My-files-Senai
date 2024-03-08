// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules:[
      '@sidebase/nuxt-auth'
  ],
  css: [
    '~/assets/style/global-project.scss',
    '~/assets/style/global-variables.scss'
  ],
  auth: {
    baseURL: 'http://localhost:8000',
    provider: {
      type: 'local',
      endpoints: {
        signIn: { path: '/api/auth/token/login', method: 'post'},
        signOut: { path: '/api/auth/token/logout', method: 'post' },
        signUp: { },
        getSession: { path: '/api/auth/users', method: 'get' },
        //refresh: { }
      },
      token: {
        signInResponseTokenPointer: '/auth_token',
        maxAgeInSeconds: 600,
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
