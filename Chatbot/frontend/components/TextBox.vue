<script setup>
    const props = defineProps({
        avatarImage: {type: String},
        name: {type: String},
        message: {type: String},
        type: {type: String}
    })

    /*
    const cardStyle = computed(() => if(props.type == 'right') 'red' else 'black')
    
   /* Modo de comunicar props e css mais indicado quando não há tantas variações
    const cardStyle = computed(() => props.type === 'right' ?
            {
                backColor: "red",
                fontSize: "1.Srem",
                textColor: "white"


            }
        : 
        {
                backColor: "black",
                fontSize: "3.Srem",
                textColor: "yellow"
        }
        ) */
        /* if de uma linha só*/
        
    
</script>

<template>
    <div class="text-box" :class="props.type === 'right' ? 'right-style' : 'left-style'">
    <Fieldset>
        <template #legend>
            <div class="flex align-items-center pl-2">
                <Avatar :image="props.avatarImage"  shape="circle" />
                <span class="font-bold">{{ props.name }}</span>
            </div>
        </template>
        <p class="m-0">
            {{ props.message }}
        </p>
    </Fieldset>
    </div>
</template>

<style scoped lang="scss">
     /* Modo de comunicar props e css mais indicado quando não há tantas variações
    .p-fieldset {
        background-color: v-bind(cardStyle.backColor);
        font-size: v-bind(cardStyle.fontSize);
    }
    */
    .text-box{
        .p-fieldset{
            background-color: black;
        }
    }

    .right-style > .p-fieldset{
        background-color: lightgreen;
        font-size: 1rem;
        color: black;
        padding: 10px;

    }

    .left-style > .p-fieldset{
        background-color: rgb(225, 134, 253);
        font-size: 1rem;
        color: black;
        padding: 10px;

    }
</style>