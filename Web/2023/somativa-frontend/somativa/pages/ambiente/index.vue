<script setup>
    const { data: todosAmbientes } = await useFetch('http://localhost:8000/ambientes');

    let showForm = false;
    const setShowForm = () => {

        showForm = true;
        refreshNuxtData()
    } 

    let nome;

    const salvaLocal = async () => {
        console.log("Nome", nome)
        await useFetch('http://localhost:8000/ambientes/',{
            method: 'POST',
            body: [{  
                nome: nome
            }],
            key: 'Localpost'            
        });

        alert("Novo local salvo (F5 na pagina para ver o novo local adicionado)");
    }
</script>
<template>
    <div>
        <h1>Ambientes</h1>
        <section v-for="local in todosAmbientes.data" :key="local.id">
            Nome:  {{ local.nome }} <p></p>
        </section>


        <button @click="setShowForm">
            Adicione um novo local        
        </button>
        <section v-if="showForm === true">
            <div>
                <label for="">Nome</label> <input type="text" v-model="nome"> <br>
                <button @click="salvaLocal">Salve o local</button>
            </div>
        </section>
        
    </div>
</template>