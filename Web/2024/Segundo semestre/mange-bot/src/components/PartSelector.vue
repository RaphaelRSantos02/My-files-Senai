<script setup lang="ts">
import type { Part } from '@/models/Parts';
import { BASE_URL } from '@/services/services.config';
import { type Ref, ref } from 'vue';

type PropType = {
    parts: Array<Part>;
    position: "left"|"right"|"center"|"top"|"bottom"
}

const props = defineProps<PropType>();

const selectedIndex = ref(0);

const changePart = (isNext: boolean)=>{

    const newIndex = isNext? selectedIndex.value + 1 : 
                             selectedIndex.value - 1;
    
    if(newIndex < 0){
        selectedIndex.value = (props.parts.length - 1);
    }
    else if(newIndex > (props.parts.length - 1)){
        selectedIndex.value = 0;
    }
    else{
        selectedIndex.value = newIndex;
    }
    
    /*if(isNext){
        selectedIndex.value = 
        selectedIndex.value >= (props.parts.length - 1)?
        (props.parts.length - 1) : selectedIndex.value + 1;
    }
    else{
        selectedIndex.value = selectedIndex.value <= 0?
        0 : selectedIndex.value - 1;
    }*/
}
</script>
<template>
    <div>  
        <img :src="BASE_URL + props.parts[selectedIndex].src" alt="">
        <button @click="changePart(false)">Diminuir</button>
        <button @click="changePart(true)">Aumentar</button>
    </div>
</template>

<style scoped lang="scss">

</style>
