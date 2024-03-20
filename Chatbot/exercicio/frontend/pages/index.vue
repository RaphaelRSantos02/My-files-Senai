<script setup>
    let response = ref("")
    const dialog = reactive({
        text: '',
        type: '',
        name: '',
        image: '',
        historyId: null
    });

    const includeDialog = ((type)=>{
        if(type === 'Q'){
            dialog.image = 'user.png';
            dialog.name = 'Raphael';
            dialog.type = 'right';
        } else {
            dialog.image = 'bot.png';
            dialog.name = 'Bot';            
            dialog.type = 'left';
        }

        conversationHistory.value.push(
            JSON.parse(JSON.stringify(dialog))
        );                
    });
    
    const sendMessage = async () => {
        console.log(dialog.text);
        includeDialog('Q');
        const {data: answer} = await useFetch('http://localhost:8000/chatbot/',{
            method: 'POST',
            body:{
                question: dialog.text,
                userId: 1,
                conversationId: dialog.historyId
            }   
        })
        dialog.text = answer.value.message
        dialog.historyId = answer.value.history.id
        includeDialog('A');
        dialog.text = ''
    }

const conversationHistory = ref([])

</script>

<template>
    <div>
        <div v-for="(conversation, id) in conversationHistory" :key="id">
            <TextBox :name="conversation.name" :avatarImage="conversation.image" 
                :message="conversation.text" :type="conversation.type"/>
        </div>
        <label id="ask" placeholder="Type here your message!" for=""> </label> <br>
        <textarea v-model="dialog.text"/> <br> <br>        
        <Button id="button" @click="sendMessage" label="Send"></Button>

        

    </div>
</template>

<style scoped lang="scss">
.ask()    

     

</style>