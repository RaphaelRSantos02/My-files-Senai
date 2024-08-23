
<script setup lang="ts">
  import { getParts } from '@/services/part.services';
  import PartSelector from '@/components/PartSelector.vue'
  import { type Ref, ref } from 'vue';
  import { PartsResponse } from '@/models/Parts';
     
  const availableParts: Ref<PartsResponse> = ref(new PartsResponse());
  
  getParts()
    .then((response)=>availableParts.value = response);

</script>

<template>
  <main>
    <h1>Build Page!</h1>
    <PartSelector :parts="availableParts.heads" position="top" />
  </main>
</template>
