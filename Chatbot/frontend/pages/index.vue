<script setup>
    let message = ref("") 
    let response = ref("")
    const sendMessage = async () => {
        //message.value;
        const {data: answer} = await useFetch('http://localhost:8000/chatbot/',{
            method: 'POST',
            body:{
                question: message
            }
        })
        response.value = answer
    }
</script>

<template>
    <div>
        <label for=""> Type here your message!</label> <br>
        <textarea v-model="message"/> <br> <br>
        <button @click="sendMessage"> Send</button>
        <hr>
    </div>
    <div>
        <h5>Bard: </h5>
        <p>{{ answer }}</p>
    </div>
</template>vs

<style scoped>
     
    button{
        background-color: black;
        color: white;
    }
</style>