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
    <div>
        <img src="/GEJm3I4WIAAjda9.jpg" alt="melhor imagem" id="hakari">
        <button  @click="submiLogOut" class="customButton"> <saida> SAIR </saida> </button>
    </div>
</template>

<style scoped lang="scss">

    .customButton{
        &:hover{
            background-color: var(--felps2-background-color)
        }
        transition: background 2s ease-in-out;
        margin-top: 20vh;
        margin-left: 30%;
        width: 30vw;
    }
    saida{
        color: white
    }
    #hakari{
        margin-left: 30vw;
        margin-top: 10vh;
    }
    


</style>