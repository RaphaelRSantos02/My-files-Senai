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
        signIn: { },
        signOut: { },
        signUp: { },
        getSession: { },
        //refresh: { }
      },
      token: {
        signInResponseTokenPointer: '',
        maxAgeInSeconds: 600,
      },
      refreshToken: { signInResponseRefreshTokenPointer : '',
      maxAgeInSeconds: 600, 
    },
      pages: {
        login: '/'
      }
    }
  }
})
