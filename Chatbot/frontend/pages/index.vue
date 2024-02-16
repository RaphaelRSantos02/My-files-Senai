<script setup>
    let response = ref("")
    const dialog = reactive({
        text: '',
        type: '',
        name:'',
        image: ''
    })
    
    const incluedeDialog = ((type)=>{
        if(type === 'Q'){
            dialog.image = 'user.png';
            dialog.name = 'Raphael';
            dialog.type = 'right';
        }
        else{
            dialog.image = 'bot.png';
            dialog.name = 'bot';
            dialog.type = 'left';

        }
        //faz a copia profunda da estrutura apenas com os valores atuais (deep copy)
        ConversationsHistory.value.push(
            JSON.parse(JSON.stringify(dialog))
        );
    });

    const sendMessage = async () => {
        incluedeDialog("Q")
        
        //message.value;
        const {data: answer} = await useFetch('http://localhost:8000/chatbot/',{
            method: 'POST',
            body:{
                question: dialog.text
            }
        })
        dialog.value = answer.value.content
        incluedeDialog('A')
    }
    const ConversationsHistory = ref([])
</script>


<template>
    <div>
        <div v-for= "(conversation, id) in ConversationsHistory" :key="id">
            <TextBox :name="conversation.name" :avatar-image="conversation.image" :message="conversation.value" :type="conversation.type"/>
        </div>
        
        <label for=""> Type here your message!</label> <br>
        <textarea v-model="dialog.value"/> <br> <br>
        <Button @click="sendMessage" label="SEND"></Button>
        <hr>
    </div>
    <div>
        <h5>Bard: </h5>
        <p>{{ response }}</p>
    </div>
</template>

<style scoped>

     
   
</style>