<script setup>
    const { data: todasTarefas } = await useFetch('http://localhost:8000/tarefas?all');

</script>

<template>
    <div>

        <h1>Tarefas</h1>
        <section v-for="tarefa in todasTarefas.data" 
         :key="tarefa.id">
         Nome: <NuxtLink :to="`/tarefas/${tarefa.id}`"> {{ tarefa.nome}}</NuxtLink> <br>  status: {{ tarefa.idStatusFK.nome }}
         <br> ambiente: {{ tarefa.idAmbienteFK.nome }} <br>  Prazo: {{ tarefa.prazo }}<br> <p></p>
        
        </section>

    </div>
</template>