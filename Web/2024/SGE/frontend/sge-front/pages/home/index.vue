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
        <button  @click="submiLogOut" class="customButton">SAIR</button>
    </div>
</template>

<style scoped lang="scss">

    .customButton{
        margin-top: 50vh;
        margin-left: 30%;
        width: 30vw;
    }


</style>