<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'

</script>

<template>
  <main id="card-app">
    <div id="content-app">
      <header>
          <nav>
            <RouterLink to="/">Home</RouterLink>
            <RouterLink to="/buildView"> Build </RouterLink>
            <RouterLink to="cartView"> Carrinho </RouterLink>
        </nav>
      </header>
    <RouterView/>
    </div>
  </main>



</template>

<style scoped>

</style>
