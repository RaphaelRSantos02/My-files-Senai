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
        <button  @click="submiLogOut" class="customButton"> <saida> SAIR </saida> </button>
    </div>
</template>

<style scoped lang="scss">

    .customButton{
        &:hover{
            color: #6d182b;
        }
        transition: background 2s ease-in-out;
        margin-top: 50vh;
        margin-left: 30%;
        width: 30vw;
    }
    saida{
        color: white
    }
    


</style>