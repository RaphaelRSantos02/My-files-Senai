<script setup>
    const { data: todoscargos } = await useFetch('http://localhost:8000/cargos');
</script>
<template>
    <div>

        <h1>cargos</h1>
        <section v-for="cargo in todoscargos.data" :key="cargo.id">
            Nome: {{ cargo.nome }} - Nivel de acesso {{ cargo.nivelAcesso }} <p></p>
        </section>

    </div>
</template>