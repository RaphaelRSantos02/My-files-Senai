<script setup>
const route = useRoute();
const {data: todosfuncionarios} = await useFetch(`http://localhost:8000/tarefasUsuarios?tarefa=${route.params.id}`);
const {data: tarefa} = await useFetch(`http://localhost:8000/tarefas/${route.params.id}`,{
        key: 'tarefas'
    });
</script>

<template>
    <div>

        <h1>Tarefa: {{ tarefa.data.nome }}</h1>
        <p>solicitante: {{ tarefa.data.idSolicitanteFK.nome }} <br>
            <img :src="tarefa.data.idSolicitanteFK.image">
        </p>
        
        descrição: {{ tarefa.data.descricao }} <br> 
        status: {{ tarefa.data.idStatusFK.nome }} <br> 
        ambiente: {{ tarefa.data.idAmbienteFK.nome }} <br>  
        Prazo: {{ tarefa.data.prazo }}<br>
        Data inicial: {{ tarefa.data.dataInicio }}<br>
        Data final: {{ tarefa.data.dataFim }}<br>
        
        <section v-for="funcionarios in todosfuncionarios.data" 
        :key="funcionarios.id">
        Responsavel: {{ funcionarios.idUsuarioFK.nome }}<p></p>
        <img :src="funcionarios.idUsuarioFK.image">
        </section>
        
        
    </div>
</template>