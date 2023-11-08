<script setup>
    const route = useRoute();
    const {data: tripFound} = await useFetch(`http://localhost:8000/trip/${route.params.id}`); 
    
</script>
<template>
    <div>
        <h1>welcome to trip: {{ tripFound.title }}</h1>
        <p>{{ tripFound.description }}</p>
        <p>daily: {{ tripFound.daily }}</p>
        <p>address: {{ tripFound.address }}</p>

    </div>
</template>