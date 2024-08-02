<script setup lang="ts">
definePageMeta({
    middleware:'auth'
})
const {signOut} = useAuth();


const submiLogOut =  () => {;
            signOut({redirect: false}).then(() =>{
                navigateTo('/')
            })
            .catch((error)=> {
                console.log(error);
            })

            }



</script>

<template>
    <main class="">
        <img src="/GEJm3I4WIAAjda9.jpg" alt="melhor imagem" id="hakari">
        <button  @click="submiLogOut" class="customButton"> <saida> SAIR </saida> </button>
    </main>
</template>

<style scoped lang="scss">

    .customButton{
        &:hover{
            background-color: var(--felps2-background-color)
        }
        transition: background 2s ease-in-out;
        margin-top: 20vh;
        margin-left: 30vw;
        width: 30vw;
    }
    saida{
        color: white
    }
    #hakari{
            align-items: center;
            width: 30vw;
            height: 35vh;
            margin-top: 10vh;
            margin-left: 30vw;
    }
    


</style>