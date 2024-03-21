<template>
    <div class="home">
        <NuxtLink to="/home" class="link">Home </NuxtLink>
    </div>
    <slot></slot>
</template>

<style scoped lang="scss">
    .link{
        text-decoration: none;
        color: black;
        margin-left: 50px;
    }
    .home{
        margin-left: 0%;
background-color: aqua;
    }


</style>