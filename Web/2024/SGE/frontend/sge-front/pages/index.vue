<script setup lang="ts">

</script>

<template>
    <main class="login_main">
        <section class = "logo_panel">
            <img src="/sge.jpeg" alt="Logo do projeto sge">
            <h1>Sistema de Gestão de Ensino</h1>
        </section>
        <section class="login_panel">

        </section>

    </main>
        
</template>

<style lang="scss">
    .login_main{
        width: 100vw;
        height: 100vh;
        background-color: var(--ligh-background-color);
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;

        .logo_panel{
            display: none;
        }
        .login_panel{
            width: 100vw;
            height: 100vh;
        }
    }

    @media screen and (min-width: 600px) {
        .login_main{
            .logo_panel{
                width: 50vw;
                display: flex;
            }
            .login_panel{
                width: 50vw;
            }
        }
        
    }

</style>