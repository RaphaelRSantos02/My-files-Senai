<script setup>
    definePageMeta({
        layout: "layout_login"
    });

    const { data: login } = await useFetch('http://localhost:8000/usuarios');

    let showbutton = false;
    const setShowbutton = () => {
        showbutton = true;
        refreshNuxtData()
    }   
</script>
<template>
    <div>
    <h1>Login</h1>
        <select name="Login" @click="setShowbutton">
            <option v-for="user in login.data" :value="user.email" :key="user.id">
                {{ user.email }}
            </option>
        </select>
        <section v-if="showbutton === true">
            <NuxtLink to="/tarefas">
                <button>
                Login
                </button>
            </NuxtLink>
        </section>
        
    </div>

</template>