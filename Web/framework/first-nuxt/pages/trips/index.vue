<script setup>
    const {data: allImage} = await useFetch('http://localhost:8000/image')
</script>
<template>
    <div>
        <section v-for="image in allImage.results" :key = "image.id">
            
            <h3>{{ image.tripFk }} - {{ image.title }}</h3>
            <!-- <NuxtLink :to = "'/trips/' + image.tripFk"> <img :src="image.link"> </NuxtLink> -->
            <NuxtLink :to = "`/trips/${image.tripFk}`"> <img :src="image.link"> </NuxtLink>
        </section>
        <!-- <NuxtLink to = "/trips/1">
            <img src="https://pbs.twimg.com/media/F-NLqWAXMAAmGkx.jpg">
        </NuxtLink>
        <NuxtLink to = "/trips/2">
            <img src="https://pbs.twimg.com/media/F-QoU7aXkAAl1W_?format=jpg&name=small">
        </NuxtLink>
        <NuxtLink to = "/trips/3">
            <img src="https://pbs.twimg.com/media/F-Pp_kvb0AAoF0w?format=jpg&name=small">
        </NuxtLink> -->
    </div>
</template>