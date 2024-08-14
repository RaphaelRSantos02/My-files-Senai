<script setup lang="ts">

</script>

<template>
    <header class="flex flex-row align-items-center justify-content-start">
        <img src="/build-a-bot-logo.png" alt="robot logo">
        <nav class="ml-5">
            <RouterLink to="/">Home</RouterLink>
            <RouterLink to="/buildView"> Build </RouterLink>
            <RouterLink to="cartView"> Carrinho </RouterLink>
        </nav>
    </header>

</template>

<style lang="scss">

header{
    height: 5rem;
    width: 40rem;
    img{
        margin-left: 4rem;
        height: 4rem;
    }
    a{
        text-decoration: none;
        font-size: 1.5rem;
        color: var(--app-dark-text-color);
        margin-left: 5px;
    }
    .router-link-exact-active{
        font-weight: bold;
    }
}

</style>